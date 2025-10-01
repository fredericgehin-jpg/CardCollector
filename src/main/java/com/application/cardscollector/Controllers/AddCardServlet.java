package com.application.cardscollector.Controllers;

import com.application.cardscollector.Models.User;
import com.application.cardscollector.Services.DatabaseManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;

@WebServlet(name = "addCardServlet", value = "/add-card")
public class AddCardServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private DatabaseManager database;
    private String host;
    private String databaseName;
    private String username;
    private String password;

    private Connection connection;

    public void init() {
        // Récupère la connexion stockée dans le contexte
        connection = (Connection) getServletContext().getAttribute("dbConnection");
        database = (DatabaseManager) getServletContext().getAttribute("database");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Vérifier si l'utilisateur est connecté
        User userConnecte = (User) session.getAttribute("userConnecte");

        if (userConnecte == null) {
            // Rediriger vers la page de connexion si l'utilisateur n'est pas connecté
            response.sendRedirect("connexion.jsp");
            return;
        }

        // Récupérer l'ID de la carte à ajouter
        String cardIdParam = request.getParameter("card_id");

        if (cardIdParam != null && !cardIdParam.isEmpty()) {
            int cardId = Integer.parseInt(cardIdParam);

            // Vérifier si la carte est déjà dans la collection de l'utilisateur
            String checkQuery = "SELECT COUNT(*) FROM User_Cards WHERE user_id = " + userConnecte.getId() + " AND card_id = " + cardId;

            try {
                var rs = database.runSQL(checkQuery);
                boolean cardExists = false;

                if (rs != null && rs.next()) {
                    cardExists = rs.getInt(1) > 0;
                }

                if (!cardExists) {
                    // Ajouter la carte à la collection de l'utilisateur
                    String insertQuery = "INSERT INTO User_Cards (user_id, card_id) VALUES (" + userConnecte.getId() + ", " + cardId + ")";
                    database.runUpdate(insertQuery);
                }

                // Rediriger vers la page de collection de l'utilisateur
                String referer = request.getHeader("Referer");
                if (referer != null) {
                    response.sendRedirect(referer);
                } else {
                    response.sendRedirect("user-cards");
                }

            } catch (Exception e) {
                throw new ServletException("Erreur lors de l'ajout de la carte", e);
            }
        } else {
            // Rediriger vers la page de toutes les cartes si l'ID de carte n'est pas spécifié
            response.sendRedirect("listCards-servlet");
        }
    }
}