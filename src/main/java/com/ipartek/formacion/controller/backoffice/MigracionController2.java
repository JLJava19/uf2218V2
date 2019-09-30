package com.ipartek.formacion.controller.backoffice;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.ipartek.formacion.model.dao.UsuarioDAO;
import com.ipartek.formacion.model.pojo.Usuario;

/**
 * Servlet implementation class MigracionController
 */
@WebServlet("/backoffice/migracion2")
public class MigracionController2 extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private final static Log LOG = LogFactory.getLog(MigracionController.class);

	private static final UsuarioDAO usuarioDAO = UsuarioDAO.getInstance();
	private static final String FILENAME = "personas.txt";

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// BasicConfigurator.configure();

		int lineasLeidas = 0;
		int lineasInsertadas = 0;
		int lineasErroneas = 0;
		long tiempoInicio = System.currentTimeMillis();

		String linea = "";
		String[] campos;
		Usuario usuario;
		String nombre;
		String contrasenya;

		try (BufferedReader bufferedReader = new BufferedReader(
				new InputStreamReader(this.getClass().getResourceAsStream("/" + FILENAME)))) {

			while ((linea = bufferedReader.readLine()) != null) {

				lineasLeidas++;
				LOG.debug("Linea " + lineasLeidas);

				try {
					campos = linea.split(",");

					if (campos.length == 7) { // linea correcta

						nombre = campos[0] + " " + campos[1] + " " + campos[2];
						contrasenya = campos[5];

						usuario = new Usuario();
						usuario.setNombre(nombre);
						usuario.setContrasenya(contrasenya);

						// TODO mejor abrir conexion una vez y autocomitable a false
						usuarioDAO.crear(usuario);

						lineasInsertadas++;

					} else { // linea Erronea

						lineasErroneas++;
						LOG.warn("*** Linea ERROR ***  " + linea);

					}

				} catch (Exception e) {

					LOG.warn("*** Linea ERROR ***  " + linea);
					lineasErroneas++;
				}

			} // while

		} // try

		long tiempoFin = System.currentTimeMillis();

		request.setAttribute("lineasLeidas", lineasLeidas);
		request.setAttribute("lineasInsertadas", lineasInsertadas);
		request.setAttribute("lineasErroneas", lineasErroneas);
		request.setAttribute("tiempo", tiempoFin - tiempoInicio);

		LOG.info("-------------- proceso migracion terminado --------------");
		LOG.info(" Leidas : " + lineasLeidas);
		LOG.info(" Insertadas : " + lineasInsertadas);
		LOG.info(" Erroneas : " + lineasErroneas);
		LOG.info(" Tiempo : " + (tiempoFin - tiempoInicio) + " ms");
		LOG.info("---------------------------------------------------------");

		request.getRequestDispatcher("migracion.jsp").forward(request, response);

	}

}