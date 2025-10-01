<%@ page import="java.sql.*" %>
<%@ page import="com.application.cardscollector.Services.DatabaseManager" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Cards Collector - Inscription</title>
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

<style>
    body{
        font-family: 'Segoe UI', sans-serif;
        background: linear-gradient(to right, #4a00c0, #8e2de2);
        display: flex;
        align-items: center;
        justify-content: center;
        height: 100vh;
        overflow: hidden;
    }

    .signup-container{
        background-color: rgba(34,34,34,0.8);
        padding: 2.5rem 2rem;
        border-radius: 15px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.3);
        width: 100%;
        max-width: 450px;
        color: white;
        animation: fadeIn 0.8s ease-in-out;
        border: 1px solid rgba(255,255,255,0.1);
    }

    .signup-container h1{
        text-align: center;
        margin-bottom: 1.5rem;
        color: #4a00c0;
    }

    .message {
        padding: 10px;
        margin-bottom: 15px;
        border-radius: 5px;
        text-align: center;
    }

    .success {
        background-color: rgba(76, 175, 80, 0.3);
        border: 1px solid #4CAF50;
    }

    .error {
        background-color: rgba(244, 67, 54, 0.3);
        border: 1px solid #F44336;
    }

    input {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border-radius: 5px;
        border: 1px solid rgba(255,255,255,0.1);
        background-color: rgba(255,255,255,0.1);
        color: white;
    }

    input::placeholder {
        color: rgba(255,255,255,0.6);
    }

    button {
        width: 100%;
        padding: 12px;
        background: linear-gradient(to right, #4a00c0, #8e2de2);
        border: none;
        border-radius: 5px;
        color: white;
        font-weight: bold;
        cursor: pointer;
        transition: transform 0.3s ease;
    }

    button:hover {
        transform: translateY(-3px);
    }

    .login-link, .home-link {
        text-align: center;
        margin-top: 15px;
    }

    a {
        color: #8e2de2;
        text-decoration: none;
    }

    a:hover {
        text-decoration: underline;
    }
</style>

</body>
</html>