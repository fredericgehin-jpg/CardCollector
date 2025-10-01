<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Cards Collector - Accueil</title>
        <LINK rel="stylesheet" type="text/css" href="css/styles.css">
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
        <style>
        
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f5f7fa;
                margin: 0;
                padding: 0;
                color: #333;
                line-height: 1.6;
            }
            
            /* Conteneur principal */
            .container {
                max-width: 800px;
                margin: 60px auto;
                padding: 30px;
                background-color: white;
                border-radius: 12px;
                box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
                text-align: center;
            }
            
            /* Style du titre */
            h1 {
                color: #2c3e50;
                font-size: 36px;
                margin-bottom: 30px;
                position: relative;
                padding-bottom: 15px;
            }
            
            h1::after {
                content: '';
                position: absolute;
                bottom: 0;
                left: 50%;
                transform: translateX(-50%);
                width: 80px;
                height: 4px;
                background: linear-gradient(90deg, #3498db, #9b59b6);
                border-radius: 2px;
            }
            
            /* Style du lien */
            .fancy-link {
                display: inline-block;
                margin-top: 25px;
                padding: 12px 28px;
                background: linear-gradient(135deg, #3498db, #9b59b6);
                color: white;
                text-decoration: none;
                border-radius: 50px;
                font-weight: 600;
                font-size: 16px;
                letter-spacing: 0.5px;
                transition: all 0.3s ease;
                box-shadow: 0 4px 12px rgba(52, 152, 219, 0.3);
            }
            
            .fancy-link:hover {
                transform: translateY(-3px);
                box-shadow: 0 6px 15px rgba(52, 152, 219, 0.4);
                background: linear-gradient(135deg, #2980b9, #8e44ad);
            }

            header{
                background-color: white;
                padding: 1rem 2rem;
                display: flex;
                justify-content: space-between;
                align-items: center;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            }

            .logo{
                font-size: 1.5rem;
                font-weight: bold;
                color: #4a00c0;
            }

            .nav-button a{
                margin-left: 1rem;
                text-decoration: none;
                color: #4a00c0;
                padding: 0.5rem 1rem;
                border-radius: 5px;
                transition: 0.3s;
            }

            .nav-button a:hover{
                background-color: #4a00c0;
                color: white;
            }
        </style>
    </body>
</html>