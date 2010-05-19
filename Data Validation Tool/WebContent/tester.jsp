<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <Title>Just A Test</Title>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript">
        var auto_refresh = setInterval(
        function ()
        {
        $('#load_me').load('showdata.jsp').fadeIn("slow");
        }, 10000); // autorefresh the content of the div after
                   //every 10000 milliseconds(10sec)
        </script>
   </head>
    <body>
    <div id="load_me"> <%@ include file="showdata.jsp" %></div>
    </body>
</html>
