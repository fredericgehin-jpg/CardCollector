<%@ page import="java.sql.*" %>
<%@ page import="com.application.cardscollector.Services.DatabaseManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Cards Collector - Connexion</title>
        <link rel="stylesheet" type="text/css" href="css/styles.css">
    </head>
    <body>
        <div class="login_container">
            <h1>Bienvenue</h1>
            <p>Connectez-vous pour accéder à votre collection !</p>


            <form action="user-connexion" method="post">
                <input type="text" name="identifiant" placeholder="Votre identifiant" required>
                <input type="password" name="password" placeholder="Votre mot-de-passe" required>
                <button type="submit">Se connecter</button>
            </form>
            <p class="register_link">Pas encore membre ? <a href="inscription.jsp">S'inscrire</a></p>
            <p class="home_link"><a href="index.jsp">Retour à l'accueil</a></p>
        </div>
    </body>
</html>