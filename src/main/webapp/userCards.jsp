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
    </body>
</html>