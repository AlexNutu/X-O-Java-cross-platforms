<%@page import="java.util.Map.Entry" %>
<%@page import="java.util.HashMap" %>
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
    out.println(request.getAttribute("signup"));
    if (request.getAttribute("signup") != null && (Boolean) request.getAttribute("signup")) { //daca a dat click pe signup
%>
<form action="CreateAccount" method="post"><br><br>
    Username:<input type="text" name="newUser"/><br>
    <br>Password:<input type="text" name="newPass"/><br>
    <br><input type="submit" value="Create account"/>
</form>
<%
} else {
%>

<%
    String currentUser = (String) session.getAttribute("currentUser");
    if (currentUser == null) {
%>
<div>
    Welcome, X & O is waiting for you!
    <form action="Login" method="post"><br><br>
        Username:<input type="text" name="user"/><br>
        <br>Password:<input type="text" name="pass"/><br>
        <br><input type="submit" value="Login"/>
    </form>

    <form action="Signup" method="post">
        <br><input type="submit" value="Signup"/>
    </form>
</div>

<%
} else {
%>
Bine ai revenit <%= currentUser %><br/>
<form action="Logout" method="post">
    <br><input type="submit" value="Logout"/>
</form>
<form action="StartGame" method="post">
    <br><input type="submit" value="StartGame"/>
</form>
<%
        }
    }
%>

<%/**MESAJE DE INTERES PUBLIC MAI JOS*/%>
<%
    if (request.getAttribute("accountCreated") != null) {
        if ((Boolean) request.getAttribute("accountCreated")) { //daca un cont a fost creat
%>
<div style="color:blue">Account created succesfully!</div>
<%
        } else {
%>
<div style="color:red">Account was not created!</div>
<%
        }
    }
%>

<%
    if (request.getAttribute("error") != null) { //daca a aparut vreo eroare
%>
<div style="color:red"><%=request.getAttribute("error")%>
</div>
<%
    }
%>

</body>
</html>
