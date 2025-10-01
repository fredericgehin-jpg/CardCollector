<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.application.cardscollector.Models.Card" %>
<%@ page import="com.application.cardscollector.Models.User" %>

<html>
<head>
    <title>Ma Collection de Cartes</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<header class="navbar">
    <div class="logo">Cards Collector</div>
    <nav>
        <ul>
            <li><a href="index.jsp">Accueil</a></li>
            <li><a href="listCards-servlet">Toutes les cartes</a></li>
            <% if ((User)session.getAttribute("userConnecte") != null) { %>
            <li class="active"><a href="user-cards">Ma Collection</a></li>
            <li><a href="logout.jsp">Déconnexion</a></li>
            <% } else { %>
            <li><a href="connexion.jsp">Connexion</a></li>
            <li><a href="inscription.jsp">Inscription</a></li>
            <% } %>
        </ul>
    </nav>
</header>

<div class="container">
    <h2>Ma Collection de Cartes</h2>

    <%
        if (session.getAttribute("prenom") != null) {
            out.println("<p class='welcome-message'>Bienvenue, " + session.getAttribute("prenom") + " !</p>");
        }
    %>

    <%
        List<Card> userCards = (List<Card>) request.getAttribute("userCards");
        if (userCards == null || userCards.isEmpty()) {
    %>
    <div class="empty-collection">
        <p>Votre collection est vide pour le moment.</p>
        <a href="listCards-servlet" class="add-cards-btn">Découvrir des cartes</a>
    </div>
    <%
    } else {
    %>
    <div class="cards-container">
        <%
            for (Card card : userCards) {
        %>
        <div class="card">
            <div class="card-image">
                <img src="pkmn_cards_setbase1/img/low/<%= card.getImage() %>" alt="<%= card.getTitle() %>">
            </div>
            <div class="card-content">
                <h3><%= card.getTitle() %></h3>
                <p><%= card.getDescription() %></p>
            </div>
            <div class="card-actions">
                <form action="remove-card" method="post">
                    <input type="hidden" name="card_id" value="<%= card.getId() %>">
                    <button type="submit" class="remove-btn">Retirer de ma collection</button>
                </form>
                <form action="toggle-favorite" method="post">
                    <input type="hidden" name="card_id" value="<%= card.getId() %>">
                    <button type="submit" class="favorite-btn">⭐ Favori</button>
                </form>
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
        font-family: 'Segoe UI', sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f5f7fa;
        color: #333;
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

    /* Message de bienvenue */
    .welcome-message {
        text-align: center;
        font-size: 18px;
        margin-bottom: 30px;
        color: #555;
    }

    /* Collection vide */
    .empty-collection {
        text-align: center;
        padding: 40px;
        background-color: white;
        border-radius: 10px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    }

    .empty-collection p {
        font-size: 18px;
        margin-bottom: 20px;
        color: #666;
    }

    .add-cards-btn {
        display: inline-block;
        padding: 10px 20px;
        background: linear-gradient(to right, #4a00c0, #8e2de2);
        color: white;
        border-radius: 30px;
        text-decoration: none;
        font-weight: bold;
        transition: 0.3s ease;
    }

    .add-cards-btn:hover {
        transform: translateY(-3px);
        box-shadow: 0 5px 15px rgba(74, 0, 192, 0.3);
    }

    /* Grille de cartes */
    .cards-container {
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

    .card-content {
        padding: 15px;
    }

    .card-content h3 {
        margin-top: 0;
        margin-bottom: 10px;
        color: #4a00c0;
    }

    .card-content p {
        margin: 0;
        color: #666;
        font-size: 14px;
        line-height: 1.5;
    }

    .card-actions {
        display: flex;
        justify-content: space-between;
        padding: 10px 15px 15px;
    }

    .card-actions button {
        padding: 8px 12px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 13px;
        transition: 0.3s ease;
    }

    .remove-btn {
        background-color: #f8f8f8;
        color: #ff5252;
    }

    .remove-btn:hover {
        background-color: #ff5252;
        color: white;
    }

    .favorite-btn {
        background-color: #f8f8f8;
        color: #ffc107;
    }

    .favorite-btn:hover {
        background-color: #ffc107;
        color: white;
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

        .cards-container {
            grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
            gap: 15px;
        }
    }
</style>

</body>
</html>