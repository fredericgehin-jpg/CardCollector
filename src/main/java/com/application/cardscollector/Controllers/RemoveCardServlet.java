package com.application.cardscollector.Controllers;

import com.application.cardscollector.Services.DatabaseManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;

@WebServlet(name = "removeCardServlet", value = "/remove-card")
public class RemoveCardServlet extends HttpServlet {

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
        Integer userId = (Integer) session.getAttribute("user_id");

        if (userId == null) {
            // Rediriger vers la page de connexion si l'utilisateur n'est pas connecté
            response.sendRedirect("connexion.jsp");
            return;
        }

        // Récupérer l'ID de la carte à supprimer
        String cardIdParam = request.getParameter("card_id");

        if (cardIdParam != null && !cardIdParam.isEmpty()) {
            int cardId = Integer.parseInt(cardIdParam);

            // Supprimer la carte de la collection de l'utilisateur
            String deleteQuery = "DELETE FROM User_Cards WHERE user_id = " + userId + " AND card_id = " + cardId;

            try {
                database.runUpdate(deleteQuery);

                // Rediriger vers la page de collection de l'utilisateur
                response.sendRedirect("user-cards");

            } catch (Exception e) {
                throw new ServletException("Erreur lors de la suppression de la carte", e);
            }
        } else {
            // Rediriger vers la page de collection de l'utilisateur si l'ID de carte n'est pas spécifié
            response.sendRedirect("user-cards");
        }
    }
}