<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Cards Collector - Accueil</title>
        <link rel="stylesheet" type="text/css" href="css/styles.css">
    </head>
    <body>
        <header>
            <div class="logo">Cards Collector</div>
            <div class="nav-button">
                <a href="connexion.jsp">Se Connecter</a>
                <a href="inscription.jsp">S'inscrire</a>
            </div>
        </header>

        <div class="container">
            <h1 class="typed"><%= "Cards Collector..." %></h1>
            <br/>
            <a class="fancy-link" href="listCards-servlet">Accèder à la liste des cartes</a>
        </div>
    </body>
</html>