package com.ipartek.formacion.controller.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.log4j.BasicConfigurator;

/**
 * Application Lifecycle Listener implementation class Log4JListener
 *
 */
@WebListener
public class Log4JListener implements ServletContextListener {

	private final static Log LOG = LogFactory.getLog(Log4JListener.class);

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

		LOG.info("Arranca Aplicacion y carga contexto servlets");
		BasicConfigurator.configure();
	}

}