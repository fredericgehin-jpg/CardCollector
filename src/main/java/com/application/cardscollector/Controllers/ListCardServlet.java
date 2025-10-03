package com.application.cardscollector.Controllers;

import com.application.cardscollector.Models.Card;
import com.application.cardscollector.Services.DatabaseManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "listCardServlet", value = "/listCards-servlet")
public class ListCardServlet  extends HttpServlet {

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
        response.setContentType("text/html");

        try {
            ArrayList<Card> cards = new ArrayList<Card>();
            rs = database.runSQL("SELECT * FROM Cards");

            while (rs.next()) {
                cards.add(new Card(rs.getInt("id"), rs.getString("nom"), rs.getString("description"), rs.getString("image") ));
            }

            rs.close();
            request.setAttribute("cards", cards);
            request.getRequestDispatcher("listCards.jsp").forward(request, response);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
