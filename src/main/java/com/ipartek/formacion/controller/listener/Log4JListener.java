package com.ipartek.formacion.controller.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;

import com.ipartek.formacion.controller.backoffice.MigracionController;

/**
 * Application Lifecycle Listener implementation class Log4JListener
 *
 */
@WebListener
public class Log4JListener implements ServletContextListener {

	private final static Logger LOG = Logger.getLogger(MigracionController.class);

	/**
	 * @see ServletContextListener#contextDestroyed(ServletContextEvent)
	 */
	public void contextDestroyed(ServletContextEvent sce) {
		LOG.info("Parar Aplicacion");
	}

	/**
	 * @see ServletContextListener#contextInitialized(ServletContextEvent)
	 */
	public void contextInitialized(ServletContextEvent sce) {
		BasicConfigurator.configure();
		LOG.info("Arranca Aplicacion y carga contexto servlets");

	}

}