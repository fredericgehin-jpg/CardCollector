<%@ page import="java.sql.*" %>
<%@ page import="com.application.cardscollector.Services.DatabaseManager" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Cards Collector - Inscription</title>
        <link rel="stylesheet" type="text/css" href="css/styles.css">
    </head>
    <body>
    <div class="signup-container">
        <h1>Créer un compte</h1>

        <%  String message = request.getAttribute("message").toString();
            boolean inscription = (boolean) request.getAttribute("inscription");
            if (!message.isEmpty()) {

        %>
        <div class="message <%= inscription ? "success" : "error" %>">
            <%= request.getAttribute("message") %>
        </div>
        <% } %>

        <form action="inscription.jsp" method="post">
            <input type="text" name="name" placeholder="Votre prénom" required>
            <input type="text" name="firstname" placeholder="Votre nom" required>
            <input type="text" name="identifiant" placeholder="Votre identifiant" required>
            <input type="password" name="password" placeholder="Votre mot-de-passe" required>
            <input type="password" name="confirm_password" placeholder="Confirmer le mot de passe" required>
            <button type="submit">S'inscrire</button>
        </form>

        <p class="login-link">Déjà inscrit ? <a href="connexion.jsp">Se connecter</a></p>
        <p class="home-link"><a href="index.jsp">Retour à l'accueil</a></p>
    </div>
    </body>
</html>