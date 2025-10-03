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
    <title>Inscription</title>
    <link rel="stylesheet" href="css/style.css">
    <script src="js/script.js" defer></script>
</head>
<body>
<div class="container">
    <h2>Inscription</h2>
    <form action="RegisterServlet" method="post" onsubmit="return validateRegisterForm()">
        <label for="username">Nom d'utilisateur</label>
        <input type="text" id="username" name="username" required>

        <label for="password">Mot de passe</label>
        <input type="password" id="password" name="password" required>

        <label for="confirmPassword">Confirmer le mot de passe</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required>

        <button type="submit">S'inscrire</button>
    </form>
    <p>Déjà inscrit ? <a href="login.jsp">Connectez-vous</a></p>
</div>
</body>
</html>
