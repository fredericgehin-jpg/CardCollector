package com.application.cardscollector.Services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

public class DatabaseManager {
    private static DatabaseManager instance = null; // instance unique (singleton)

    private String host;
    private String database;
    private String username;
    private String password;
    private Connection connection;

    // Constructeur privé pour empêcher l'instanciation directe
    private DatabaseManager(String host, String database, String username, String password) {
        this.host = host;
        this.database = database;
        this.username = username;
        this.password = password;
        this.connection = null;
    }

    // Méthode publique pour récupérer l'instance unique
    public static DatabaseManager getInstance(String host, String database, String username, String password) {
        if (instance == null) {
            instance = new DatabaseManager(host, database, username, password);
        }
        return instance;
    }

    // Méthode pour se connecter
    public Connection connect() {
        if (connection != null) {
            return connection;
        }
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://" + host + "/" + database + "?useSSL=false&serverTimezone=UTC";
            connection = DriverManager.getConnection(url, username, password);
            return connection;
        } catch (SQLException e) {
            System.out.println("Erreur de connexion : " + e.getMessage());
            return null;
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    // Méthode pour exécuter une requête SQL (SELECT)
    public ResultSet runSQL(String sql) {
        if (connection == null) {
            System.out.println("Pas de connexion active !");
            return null;
        }
        try {
            Statement statement = connection.createStatement();
            return statement.executeQuery(sql);
        } catch (SQLException e) {
            System.out.println("Erreur lors de l'exécution de la requête : " + e.getMessage());
            return null;
        }
    }

    // Méthode pour exécuter une requête de modification (INSERT, UPDATE, DELETE)
    public boolean runUpdate(String sql) {
        if (connection == null) {
            System.out.println("Pas de connexion active !");
            return false;
        }
        try {
            Statement statement = connection.createStatement();
            statement.executeUpdate(sql);
            return true;
        } catch (SQLException e) {
            System.out.println("Erreur lors de l'exécution de la requête : " + e.getMessage());
            return false;
        }
    }

    // Méthode pour fermer la connexion
    public void disconnect() {
        if (connection != null) {
            try {
                connection.close();
                connection = null; // très important : libérer la ressource
                System.out.println("Déconnexion réussie !");
            } catch (SQLException e) {
                System.out.println("Erreur lors de la déconnexion : " + e.getMessage());
            }
        }
    }
}