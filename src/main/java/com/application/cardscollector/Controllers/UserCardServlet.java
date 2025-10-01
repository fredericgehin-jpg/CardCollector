package com.application.cardscollector.Controllers;

import com.application.cardscollector.Models.Card;
import com.application.cardscollector.Models.User;
import com.application.cardscollector.Services.DatabaseManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.Serial;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "userCardServlet", value = "/user-cards")
public class UserCardServlet extends HttpServlet {

    @Serial
    private static final long serialVersionUID = 1L;
    private DatabaseManager database;

    private Connection connection;

    public void init() {
        // Récupère la connexion stockée dans le contexte
        connection = (Connection) getServletContext().getAttribute("dbConnection");
        database = (DatabaseManager) getServletContext().getAttribute("database");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session = request.getSession();

        // Vérifier si l'utilisateur est connecté
        User userConnecte = (User) session.getAttribute("userConnecte");

        if (userConnecte == null) {
            // Rediriger vers la page de connexion si l'utilisateur n'est pas connecté
            response.sendRedirect("connexion.jsp");
            return;
        }

        try {
            ArrayList<Card> userCards = new ArrayList<Card>();

            // Requête pour récupérer les cartes de l'utilisateur avec les infos de User_Cards
            String sql = "SELECT c.* " +
                    "FROM cards c " +
                    "JOIN User_Cards uc ON c.id = uc.card_id " +
                    "WHERE uc.user_id = " + userConnecte.getId();

            ResultSet rs = database.runSQL(sql);

            while (rs.next()) {
                Card card = new Card(rs.getInt("id"), rs.getString("nom"), rs.getString("description"), rs.getString("image"));
                userCards.add(card);
            }

            rs.close();
            request.setAttribute("userCards", userCards);
            request.getRequestDispatcher("userCards.jsp").forward(request, response);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (NullPointerException e) {
            response.sendRedirect("500.jsp");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}