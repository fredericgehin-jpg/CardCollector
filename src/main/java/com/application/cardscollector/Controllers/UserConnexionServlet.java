package com.application.cardscollector.Controllers;

import com.application.cardscollector.Models.User;
import com.application.cardscollector.Services.AppContextListener;
import com.application.cardscollector.Services.DatabaseManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import static com.application.cardscollector.Services.PasswordHasher.generateSalt;
import static com.application.cardscollector.Services.PasswordHasher.hashPassword;

@WebServlet(name = "userConnexionServlet", value = "/user-connexion")
public class UserConnexionServlet extends HttpServlet {

    private DatabaseManager database;

    private Connection connection;

    public void init() {
        // Récupère la connexion stockée dans le contexte
        connection = (Connection) getServletContext().getAttribute("dbConnection");
        database = (DatabaseManager) getServletContext().getAttribute("database");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String identifiant = request.getParameter("identifiant");
        String password = request.getParameter("password");

        String message = "";
        boolean connexionReussie = false;

        if (identifiant != null && password != null) {
            // Connexion à la BDD

            if (connection != null) {
                // Vérifier les identifiants
                String query = "SELECT * FROM Users WHERE identifiant = '" + identifiant + "' AND password = '" + password + "'";
                ResultSet rs = database.runSQL(query);

                try {
                    if (rs != null && rs.next()) {

                        User userConnecte = new User(rs.getInt("user_id"),rs.getString("nom"), rs.getString("prenom"), rs.getString("identifiant"), rs.getString("password"));

                        // Identifiants corrects, création d'une session
                        request.getSession().setAttribute("userConnecte", userConnecte);

                        // Redirection vers la page d'accueil ou la collection de cartes
                        response.sendRedirect("user-cards");
                        return;
                    } else {
                        message = "Identifiant ou mot de passe incorrect.";
                    }
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }

                database.disconnect();
            } else {
                message = "Impossible de se connecter à la base de données.";
            }

            request.setAttribute("message", message);
        }
    }


}
