package com.application.cardscollector.Controllers;

import com.application.cardscollector.Services.DatabaseManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;

@WebServlet(name = "UserConnectionServlet", value = "/user-connection-servlet")
public class UserConnectionServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private DatabaseManager database;
    private String host;
    private String databaseName;
    private String username;
    private String password;
    private ResultSet rs;

    private Connection connection;

    public void init() {
        host = "localhost";
        databaseName = "CardsCollector";
        username = "root";
        password = "";

        database = DatabaseManager.getInstance(host,databaseName,username,password);
        // Connexion à la base de données
        connection = database.connect();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
