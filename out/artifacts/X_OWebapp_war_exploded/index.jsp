<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.HashMap"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>MicroMag</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <% 
            String currentUser = (String) session.getAttribute("currentUser");
            if (currentUser == null)
            {
        %>
        <div>
            Welcome, X & O is waiting for you!
            <form action="Login" method="post"><br><br>
            Username:<input type="text" name="user" /><br>
                <br>Password:<input type="password" name="pass" /><br>
            <br><input type="submit" value="Login" />
                <br><br><input type="submit" value="Cont" />
            </form>
        </div>

        <%
            }
            else
            {

        %>
        <%
            if (request.getAttribute("error") != null) { //dacă a apărut vreo eroare
        %>
        <div>
            Welcome, X & O is waiting for you!
            <form action="Login" method="post"><br><br>
                Username:<input type="text" name="user" /><br>
                <br>Password:<input type="password" name="pass" /><br>
                <br><input type="submit" value="Login" />
                <br><br><input type="submit" value="Cont" />
                <div style="color:red">Incorrect username or password!</div>
            </form>
        </div>
        <%
        } else {
        %>
        Bine ai revenit <%= currentUser %><br />
        Articole in cos:
        <ul>
        <%
            HashMap<String, Integer> cos = (HashMap<String, Integer>) session.getAttribute("cos");
            for(Entry<String, Integer> entry : cos.entrySet())
            {
                out.print("<li>");
                out.print(entry.getKey() + " - " + entry.getValue());
                out.println("</li>");
            }
        %>
        Export cos: <a href="rest/export/10">export</a>
        </ul>
        Adauga in cos:
        <form action="Adauga" method="Post">
            Produs: <select name="produs">
            <%
                //TODO: add dynamic things.
            %>
            <option value="lapte">lapte</option>
            <option value="cafea">cafea</option>
            <option value="paine">paine</option>
            </select>
            Cantitate:<input type="text" name="cantitate" />
            <br />
            <input type="submit" value="Cumpara"/>
        </form>
        <%
            } }
        %>
    </body>
</html>
