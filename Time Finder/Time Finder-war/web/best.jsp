<%-- 
    Document   : best
    Created on : 25/04/2018, 4:28:18 PM
    Author     : Glen Osborne and Florian Widder
    Best Date  : for the pre selected event the best date will be displayed 
--%>

<%@page import="java.sql.Date"%>
<%@page import="model.Event"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel ="stylesheet" href="assets/css/landing.css">
<link rel ="stylesheet" href="assets/css/selectDays.css">
<jsp:include page="navbar.jsp"></jsp:include>  
<jsp:useBean id= "user" scope= "session" class= "beans.UserBean" ></jsp:useBean>
<jsp:useBean id= "event" scope= "session" class= "beans.EventBean"></jsp:useBean>
    <!--   REDIRECT IF NOT LOGGED IN          -->
<%
    String redirectURL = "index.jsp";
    if (!user.isLoggedIn()) {
        response.sendRedirect(redirectURL);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Best day so far</title>
    </head>
    <body>
        <!--   display the best day so far...         -->
        <div class="centerdiv bordered">
            <h1>Current Best day</h1>
            <% int id = Integer.parseInt(session.getAttribute("eventID").toString()); %>
            <% Event e = event.getEventByID(id);
             Date best = e.getBest(); %>
             <label>The most voted date so far....<label>
             <h1><%= best.toString() %>
            
        </div>
    </body>
</html>
