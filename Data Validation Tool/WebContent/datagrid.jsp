<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		
		<title></title>
		<style type="text/css" title="currentStyle">
			@import "css/demo_page.css";
			@import "css/demo_table.css";
		</style>
		<script type="text/javascript" language="javascript" src="js/jquery.js"></script>

		<script type="text/javascript" language="javascript" src="js/jquery.dataTables.js"></script>
		<script type="text/javascript" charset="utf-8">
			
			var oTable;
			
			/* Global var for counter */
			var giCount = 2;
			
			$(document).ready(function() {
				oTable = $('#example').dataTable();
			} );
			
		</script>
	</head>
	<body id="dt_example">
		<div id="container">
		
			<div id="demo">

<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>

<table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
	<thead>
		<tr>
			<th>Column 1</th>
			<th>Column 2</th>
			<th>Column 3</th>
			<th>Column 4</th>
			<th>Column 5</th>
		</tr>
	</thead>
	<tbody>
	<%
			
	int i=1;
	String user=request.getParameter("searchId");
			
	Class.forName("com.mysql.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/clinlink","root","");
	Statement st= con.createStatement();
	ResultSet rs=st.executeQuery("select * from user");
	try{
						while(rs.next()){	
							out.println("<tr>");					
							out.println("<td>"+rs.getString(1)+"</td>");					
							out.println("<td>"+rs.getString(2)+"</td>");					
							out.println("<td>"+rs.getInt(3)+"</td>");					
							out.println("<td>"+rs.getInt(4)+"</td>");					
							out.println("<td>"+rs.getInt(5)+"</td>");										
							out.println("</tr>");
							
						}
					}
					catch(SQLException e){
						out.println(e.getMessage());
					}
	
					con.close();
					st.close();
				%>
		
	</tbody>
</table>
			</div>
			
	</body>
</html>