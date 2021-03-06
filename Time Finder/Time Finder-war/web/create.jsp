<%-- 
    Document   : create
    Created on : 25/04/2018, 10:58:08 AM
    Author     : Glen Osborne and Florian Widder
    create     : create a new event to allow other users to vote on
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.3/moment.min.js"></script>
        <link rel ="stylesheet" href="assets/css/create.css">
        <link rel ="stylesheet" href="assets/css/landing.css">
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
    </head>
    <body>
        <br>
        <h5 class="center">Create a new event</h5>
        <br>
        <!--   gather event data for new event          -->
        <div class="centerdiv bordered">
            <form action="createEventProcessing" method="post">
                <label>Event Name:</label>
                <p><input name="eventName"></p>
                <label>Event Description</label>
                <p><input name="eventDescription"></p>
                <label>Start Date :</label><br>
                <input type="date" name="eventStart" data-date1="" data-date-format="DD MMMM YYYY" value="2018-04-15">
                <br>
                <label>End Date :</label><br>
                <input type="date" name="eventEnd" data-date2="" data-date-format="DD MMMM YYYY" value="2018-04-15">
                <br>
                <br>
                <button value="registerEvent" type="submit" class="btn btn-default">Create Event</button>
            </form>
        </div>
    </body>
    <!--   get the values from the date pickers           -->
    <script>
        $("start").on("change", function () {
            this.setAttribute(
                    "data-date1",
                    moment(this.value, "YYYY-MM-DD")
                    .format(this.getAttribute("data-date-format"))
                    )
        }).trigger("change")
        $("end").on("change", function () {
            this.setAttribute(
                    "data-date2",
                    moment(this.value, "YYYY-MM-DD")
                    .format(this.getAttribute("data-date-format"))
                    )
        }).trigger("change")
    </script>
</html>
