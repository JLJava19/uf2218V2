package com.ipartek.formacion.controller.frontoffice;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;

import com.ipartek.formacion.controller.pojo.Alert;
import com.ipartek.formacion.model.dao.UsuarioDAO;
import com.ipartek.formacion.model.pojo.Usuario;

/**
 * Servlet implementation class UsuarioController
 */
@WebServlet("/frontoffice/usuario")
public class MisDatosController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public static final String VIEW_INDEX = "usuario/index.jsp";
	public static final String VIEW_FORM = "usuario/formulario.jsp";
	public static final String VIEW_LOGOUT = "/logout";

	public static String view = VIEW_INDEX;

	public static final String OP_GUARDAR = "23";
	public static final String OP_DETALLE = "13";
	public static final String OP_ELIMINAR = "hfd3";

	private static final UsuarioDAO usuarioDAO = UsuarioDAO.getInstance();

	private Validator validator;

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		validator = Validation.buildDefaultValidatorFactory().getValidator();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String op = request.getParameter("op");
		if (op == null) {
			op = OP_DETALLE;
		}

		switch (op) {
		case OP_DETALLE:
			detalle(request, response);
			break;

		case OP_GUARDAR:
			guardar(request, response);
			break;

		case OP_ELIMINAR:
			eliminar(request, response);
			break;

		default:
			detalle(request, response);
			break;
		}

		request.getRequestDispatcher(view).forward(request, response);
	}

	private void guardar(HttpServletRequest request, HttpServletResponse response) {

		String nombre = request.getParameter("nombre");
		String contrasenya = request.getParameter("contrasenya");
		String newPass1 = request.getParameter("newPass1");
		String newPass2 = request.getParameter("newPass2");

		Usuario u = new Usuario();
		u.setId(devolverUsuarioSession(request).getId());
		u.setNombre(nombre);
		u.setContrasenya(contrasenya);

		Set<ConstraintViolation<Usuario>> violations = validator.validate(u);
		if (violations.isEmpty()) {

			try {

				if (u.getId() == -1) {
					usuarioDAO.crear(u);
				} else {
					if (newPass1.equals(newPass2)) {
						u.setContrasenya(newPass1);
						usuarioDAO.modificar(u);
					} else {
						request.setAttribute("mensaje", new Alert("danger", "Las nuevas contraseñas no coinciden."));
					}

				}
				request.setAttribute("mensaje", new Alert("success", "Registro creado con exito"));

			} catch (Exception e) {

				request.setAttribute("mensaje", new Alert("danger", "Tenemos un problema, el codigo ya existe"));
			}

		} else { // hay violaciones de las validaciones

			String mensaje = "";

			for (ConstraintViolation<Usuario> violation : violations) {
				mensaje += violation.getPropertyPath() + ": " + violation.getMessage() + "<br>";
			}
			request.setAttribute("mensaje", new Alert("warning", mensaje));
		}
		request.setAttribute("usuarioEditar", u);
		view = VIEW_FORM;

	}

	private void eliminar(HttpServletRequest request, HttpServletResponse response) {
		;

		if (usuarioDAO.delete(devolverUsuarioSession(request).getId())) {
			request.setAttribute("mensaje", new Alert("success", "Registro Eliminado"));
		} else {
			request.setAttribute("mensaje", new Alert("danger", "ERROR, no se pudo eliminar"));
		}

		view = VIEW_LOGOUT;

	}

	private void detalle(HttpServletRequest request, HttpServletResponse response) {

		request.setAttribute("usuarioEditar", devolverUsuarioSession(request));
		view = VIEW_FORM;

	}

	/**
	 * El id lo obtengo SOLO de la SESSION
	 * 
	 * @return usuario
	 */
	private Usuario devolverUsuarioSession(HttpServletRequest request) {

		HttpSession session = request.getSession();
		Usuario usuario = (Usuario) session.getAttribute("usuario");

		return usuario;

	}
}
