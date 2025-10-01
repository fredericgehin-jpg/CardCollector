<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Invalider la session
    session.invalidate();

    // Rediriger vers la page d'accueil
    response.sendRedirect("index.jsp");
%>