package com.application.cardscollector.Controllers;

import com.application.cardscollector.Services.DatabaseManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import static com.application.cardscollector.Services.PasswordHasher.generateSalt;
import static com.application.cardscollector.Services.PasswordHasher.hashPassword;

public class UserRegisterServlet extends HttpServlet {

    private DatabaseManager database;

    private Connection connection;

    public void init() {
        // Récupère la connexion stockée dans le contexte
        connection = (Connection) getServletContext().getAttribute("dbConnection");
        database = (DatabaseManager) getServletContext().getAttribute("database");
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Recupération des informations sur le nouvel utilisateur
        String nom = request.getParameter("name");
        String prenom = request.getParameter("firstname");
        String identifiant = request.getParameter("identifiant");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");

        String message = "";
        boolean inscription = false;

        if (nom != null && prenom != null && identifiant != null && password != null && confirmPassword != null) {
            // Vérification que les mots de passe correspondent
            if (!password.equals(confirmPassword)) {
                message = "Les mots de passe ne correspondent pas.";
            } else {

                if (connection != null) {
                    // Vérifier si l'identifiant existe déjà
                    String checkQuery = "SELECT COUNT(*) FROM Users WHERE identifiant = '" + identifiant + "'";
                    ResultSet rs = database.runSQL(checkQuery);
                    boolean userExists = false;

                    try {
                        if (rs != null && rs.next()) {
                            userExists = rs.getInt(1) > 0;
                        }
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }

                    if (userExists) {
                        message = "Cet identifiant est déjà utilisé.";
                    } else {
                        String salt = generateSalt();
                        String hashed = hashPassword(password, salt);

                        String sql = "INSERT INTO Users (nom, prenom, identifiant, password) VALUES ('"
                                + nom + "', '" + prenom + "', '" + identifiant + "', '" + hashed + "')";

                        boolean success = database.runUpdate(sql);

                        if (success) {
                            message = "Inscription réussie !";
                            inscription = true;
                        } else {
                            message = "Erreur lors de l'inscription.";
                        }
                    }
                    database.disconnect();
                } else {
                    message = "Impossible de se connecter à la base de données.";
                }
            }
            request.setAttribute("message", message);
            request.setAttribute("inscription", inscription);
        }

    }
}
