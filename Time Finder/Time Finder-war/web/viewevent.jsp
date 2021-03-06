<%-- 
    Document   : viewevent
    Created on : 25/04/2018, 11:11:21 AM
    Author     : Glen Osborne and Florian Widder
    View Event : Table data of the events
--%>

<%@page import="model.Event"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page="navbar.jsp"></jsp:include>           
        <jsp:useBean id= "user" scope= "session" class= "beans.UserBean" ></jsp:useBean>
        <jsp:useBean id= "event" scope= "session" class= "beans.EventBean"></jsp:useBean>
        <%
            String redirectURL = "index.jsp";
            if (!user.isLoggedIn()) {
                response.sendRedirect(redirectURL);
            }
        %>
    </head>
    <body>
        <br>
        <h5 class="center">Review Events</h5>
        <br>
        <div>
            <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col">Event ID</th>
                    <th scope="col">Event Name</th>
                    <th scope="col">Creator</th>
                    <th scope="col">Mail</th>
                    <th scope="col">Description</th>
                    <th scope="col">Start Date</th>
                    <th scope="col">End Date</th>
                    <th scope =" col">Best Date</th>
                </tr>
            </thead>
            <tbody>
                <% Event[] events = event.getAllEvents();
                    for (int i = 0; i < events.length; i++) {%>
                <tr>
                    <td><%= events[i].getEventID()%></td>
                    <td><%= events[i].getName()%></td>
                    <td><%= events[i].getCreator().getName()%></td>
                    <td><%= events[i].getCreator().getEmail()%></td>
                    <td><%= events[i].getDescription()%></td>
                    <td><%= events[i].getStart()%></td>
                    <td><%= events[i].getEnd()%></td>
                    <td><%= events[i].getBest()%></td>
                </tr>

                <%}%>
            </tbody>
            </table>
        </div>
     </body>
</html>
