<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.application.cardscollector.Models.Card" %>
<%@ page import="com.application.cardscollector.Models.User" %>

<html>
    <head>
        <title>Liste des cartes</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/styles.css">
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
    </body>
</html>