package com.ipartek.formacion.controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ipartek.formacion.controller.pojo.Alert;
import com.ipartek.formacion.model.dao.LikesDAO;
import com.ipartek.formacion.model.pojo.Usuario;

/**
 * Servlet implementation class LikesController
 */
@WebServlet("/likes")
public class LikesController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private static LikesDAO likesDAO;

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		likesDAO = LikesDAO.getInstance();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int idVideo = Integer.parseInt(request.getParameter("id"));

		HttpSession session = request.getSession();
		Usuario usuario = (Usuario) session.getAttribute("usuario");

		if (usuario != null) {

			try {
				if (!likesDAO.existe(usuario.getId(), idVideo)) {
					likesDAO.crear(usuario.getId(), idVideo);
					request.setAttribute("mensaje", new Alert("success", "Has dado like al vídeo."));
				} else {
					likesDAO.delete(usuario.getId(), idVideo);
					request.setAttribute("mensaje", new Alert("danger", "Has quitado el like del vídeo."));
				}

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			request.getRequestDispatcher("public/inicio").forward(request, response);
		} else {
			request.getRequestDispatcher("login").forward(request, response);
		}
	}

}
