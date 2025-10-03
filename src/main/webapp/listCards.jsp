<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.application.cardscollector.Models.Card" %>
<!-- adapter le package -->

<html>
<head>
    <title>Liste des cartes</title>
</head>
<body>

<h2 style="text-align: center;">Collection de cartes</h2>

<%
    List<Card> cartes = (List<Card>) request.getAttribute("cards");
    if (cartes == null || cartes.isEmpty()) {
%>
<p style="text-align: center;">Aucune carte enregistrée.</p>
<%
} else {
%>
<table>
    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Description</th>
        <th>Image</th>
    </tr>
    <%
        for (Card c : cartes) {
    %>
    <tr>
        <td><%= c.getId() %></td>
        <td><%= c.getTitle() %></td>
        <td><%= c.getDescription() %></td>
        <td><%= c.getImage() %></td>
    </tr>
    <%
            }
        }
    %>
</table>

</body>
</html>
