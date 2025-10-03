<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 13/05/2025
  Time: 11:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Connexion</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="js/script.js" defer></script>
</head>
<body>
<div class="container">
    <h2>Connexion</h2>
    <form action="LoginServlet" method="post" onsubmit="return validateLoginForm()">
        <label for="username">Nom d'utilisateur</label>
        <input type="text" id="username" name="username" required>

        <label for="password">Mot de passe</label>
        <input type="password" id="password" name="password" required>

        <button type="submit">Se connecter</button>
    </form>
    <p>Pas encore de compte ? <a href="register.jsp">Inscrivez-vous</a></p>
</div>
</body>
</html>
