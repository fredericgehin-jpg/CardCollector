<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.application.cardscollector.Models.Card" %>
<%@ page import="com.application.cardscollector.Models.User" %>

<html>
<head>
    <title>Liste des cartes</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<header class="navbar">
    <div class="logo">Cards Collector</div>
    <nav>
        <ul>
            <li><a href="index.jsp">Accueil</a></li>
            <li class="active"><a href="listCards-servlet">Toutes les cartes</a></li>
            <% if ((User)session.getAttribute("userConnecte") != null) { %>
            <li><a href="user-cards">Ma Collection</a></li>
            <li><a href="logout.jsp">Déconnexion</a></li>
            <% } else { %>
            <li><a href="connexion.jsp">Connexion</a></li>
            <li><a href="inscription.jsp">Inscription</a></li>
            <% } %>
        </ul>
    </nav>
</header>

<div class="container">
    <h2>Collection de cartes</h2>

    <%
        List<Card> cartes = (List<Card>) request.getAttribute("cards");
        if (cartes == null || cartes.isEmpty()) {
    %>
    <p class="empty-message">Aucune carte enregistrée.</p>
    <%
    } else {
    %>
    <div class="cards-grid">
        <%
            for (Card c : cartes) {
        %>
        <div class="card">
            <div class="card-image">
                <% if (c.getImage() != null && !c.getImage().isEmpty()) { %>
                <img src="pkmn_cards_setbase1/img/low/<%= c.getImage() %>" alt="<%= c.getTitle() %>">
                <% } else { %>
                <div class="no-image">Pas d'image</div>
                <% } %>
            </div>
            <div class="card-details">
                <h3><%= c.getTitle() %></h3>
                <p class="description"><%= c.getDescription() %></p>
                <div class="card-id">ID: <%= c.getId() %></div>

                <% if (session.getAttribute("userConnecte") != null) { %>
                <form action="add-card" method="post" class="add-form">
                    <input type="hidden" name="card_id" value="<%= c.getId() %>">
                    <button type="submit" class="add-btn">Ajouter à ma collection</button>
                </form>
                <% } else { %>
                <a href="connexion.jsp" class="login-to-add">Se connecter pour ajouter</a>
                <% } %>
            </div>
        </div>
        <%
            }
        %>
    </div>
    <%
        }
    %>
</div>

<style>
    /* Styles généraux */
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f5f7fa;
        margin: 0;
        padding: 0;
        color: #333;
        line-height: 1.6;
    }

    .container {
        max-width: 1200px;
        margin: 20px auto;
        padding: 0 20px;
    }

    h2 {
        color: #4a00c0;
        text-align: center;
        margin-bottom: 30px;
        font-size: 28px;
    }

    /* Navbar */
    .navbar {
        background: linear-gradient(to right, #4a00c0, #8e2de2);
        color: white;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 15px 30px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }

    .logo {
        font-size: 24px;
        font-weight: bold;
    }

    nav ul {
        list-style: none;
        display: flex;
        margin: 0;
        padding: 0;
    }

    nav li {
        margin-left: 20px;
    }

    nav a {
        color: white;
        text-decoration: none;
        font-weight: 500;
        transition: 0.3s ease;
    }

    nav a:hover {
        color: #c8a2ff;
    }

    nav li.active a {
        color: #c8a2ff;
        font-weight: bold;
    }

    /* Message vide */
    .empty-message {
        text-align: center;
        padding: 40px;
        background-color: white;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        font-size: 18px;
        color: #666;
    }

    /* Grille de cartes */
    .cards-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
        gap: 25px;
    }

    .card {
        background-color: white;
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 3px 15px rgba(0,0,0,0.1);
        transition: transform 0.3s ease;
    }

    .card:hover {
        transform: translateY(-5px);
    }

    .card-image {
        height: 180px;
        overflow: hidden;
        background-color: #f8f8f8;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .card-image img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: 0.5s ease;
    }

    .card:hover .card-image img {
        transform: scale(1.05);
    }

    .no-image {
        color: #aaa;
        font-style: italic;
    }

    .card-details {
        padding: 15px;
    }

    .card-details h3 {
        margin-top: 0;
        margin-bottom: 10px;
        color: #4a00c0;
    }

    .description {
        margin: 0 0 15px;
        color: #666;
        font-size: 14px;
        line-height: 1.5;
        /* Limiter à 3 lignes max */
        display: -webkit-box;
        -webkit-line-clamp: 3;
        -webkit-box-orient: vertical;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .card-id {
        font-size: 12px;
        color: #999;
        margin-bottom: 15px;
    }

    .add-btn {
        width: 100%;
        padding: 10px;
        background: linear-gradient(to right, #4a00c0, #8e2de2);
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: 0.3s ease;
        font-weight: 500;
    }

    .add-btn:hover {
        background: linear-gradient(to right, #3a0090, #7e1ed2);
        transform: translateY(-2px);
    }

    .login-to-add {
        display: block;
        text-align: center;
        padding: 10px;
        background-color: #f8f8f8;
        color: #666;
        border-radius: 5px;
        text-decoration: none;
        transition: 0.3s ease;
    }

    .login-to-add:hover {
        background-color: #eaeaea;
        color: #4a00c0;
    }

    /* Responsive */
    @media (max-width: 768px) {
        .navbar {
            flex-direction: column;
            padding: 15px;
        }

        .logo {
            margin-bottom: 15px;
        }

        nav ul {
            flex-wrap: wrap;
            justify-content: center;
        }

        nav li {
            margin: 5px 10px;
        }

        .cards-grid {
            grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
            gap: 15px;
        }
    }
</style>

</body>
</html>