package com.application.cardscollector.Services;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

import java.sql.Connection;

@WebListener
public class AppContextListener implements ServletContextListener {

    private Connection connection;

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        String host = "localhost";
        String databaseName = "cardscollector";
        String username = "root";
        String password = "";

        DatabaseManager database = DatabaseManager.getInstance(host, databaseName, username, password);
        // Connexion à la base de données
        connection = database.connect();

        sce.getServletContext().setAttribute("dbConnection", connection);
        sce.getServletContext().setAttribute("database", database);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
