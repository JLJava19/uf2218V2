package com.ipartek.formacion.controller.api;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.ipartek.formacion.model.dao.UsuarioDAO;
import com.ipartek.formacion.model.pojo.Usuario;

/**
 * Servlet implementation class UsuarioRestController
 */
@WebServlet("/api/usuarios")
public class UsuarioRestController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static UsuarioDAO usuarioDAO = UsuarioDAO.getInstance();
	private static ArrayList<Usuario> usuarios = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UsuarioRestController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("utf8");

		// String path = request.getPathInfo();

		String nombreUsuario = request.getParameter("filter");
		String orden = request.getParameter("orden");

		// TODO
		if (nombreUsuario != null && orden != null && !nombreUsuario.isEmpty() && orden.isEmpty()) {
			usuarios = usuarioDAO.getAllByNombre(nombreUsuario);
		} else {
			usuarios = usuarioDAO.getAll();
		}

		Gson gson = new Gson();
		String responseBody = gson.toJson(usuarios);

		ServletOutputStream out = response.getOutputStream();
		out.print(responseBody);
		out.flush();

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setStatus(501);
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setStatus(501);
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setStatus(501);
	}

}
