package com.ipartek.formacion.controller.backoffice;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ipartek.formacion.model.dao.UsuarioDAO;
import com.ipartek.formacion.model.pojo.Rol;
import com.ipartek.formacion.model.pojo.Usuario;

/**
 * Servlet implementation class MigracionController
 */
@WebServlet("/backoffice/migracion")
public class MigracionController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static String[] palabrasLinea = new String[7];
	private static ArrayList<Usuario> usuarios = new ArrayList<Usuario>();
	private static UsuarioDAO usuarioDAO = UsuarioDAO.getInstance();

	private static int lineasErroneas = 0;
	private static int lineasLeidas = 0;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MigracionController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		usuarios.clear();
		lineasErroneas = 0;
		lineasLeidas = 0;

		String filename = "C:\\1713\\eclipse-workspace-post\\personas.txt";

		try {

			List<String> list = readByJavaClassic(filename);
			list.forEach(System.out::println);
			lineasLeidas = list.size();

		} catch (IOException e) {
			e.printStackTrace();
		}

		// Comprobar el rol
		HttpSession session = request.getSession();
		Usuario usuario = (Usuario) session.getAttribute("usuario");

		if (usuario.getRol().getId() == Rol.ROL_ADMINISTRADOR) {

			// request interna
			if (usuarios != null) {
				for (Usuario u : usuarios) {
					try {
						// Usuario ue = usuarioDAO.crear(u);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				request.setAttribute("lineasInsertadas", usuarios.size());
			} else {
				request.setAttribute("lineasInsertadas", 0);
			}
			request.setAttribute("lineasLeidas", lineasLeidas);
			request.setAttribute("lineasErroneas", lineasErroneas);
			request.getRequestDispatcher("migracion.jsp").forward(request, response);
		} else {
			// String url = request.getContextPath();
			response.sendRedirect("../frontoffice/inicio");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private static List<String> readByJavaClassic(String fileName) throws IOException {

		List<String> result = new ArrayList<>();
		BufferedReader br = null;

		try {

			br = new BufferedReader(new FileReader(fileName));

			String nombre = "";
			String contrasenya = "";

			String line;
			// ArrayList<String> palabrasLinea = new ArrayList<String>();
			Usuario u = new Usuario();

			while ((line = br.readLine()) != null) {
				palabrasLinea = line.split(",");
				if (palabrasLinea.length == 7) {
					try {
						nombre = palabrasLinea[0] + " " + palabrasLinea[1] + " " + palabrasLinea[2];
						contrasenya = palabrasLinea[5];
						if (nombre.length() <= 45) {
							u.setNombre(nombre);
							u.setContrasenya(contrasenya);

							usuarios.add(u);
							Usuario ue = usuarioDAO.crear(u);
						}

					} catch (Exception e) {
						e.printStackTrace();
					}

				} else {
					lineasErroneas += 1;
				}
				result.add(line);
			}

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (br != null) {
				br.close();
			}
		}

		return result;
	}
}
