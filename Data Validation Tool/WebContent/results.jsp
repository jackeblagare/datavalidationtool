<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "datavalidation.*" %>
<%@ page import ="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>Data Validation Tool</title>
		<link rel="icon" href="images/favicon/favicon.ico"/>
		<link rel="stylesheet" href="css/processEl.css"/>
		
		<style type="text/css">
			@import "css/demo_page.css";
			@import "css/demo_table_jui.css";
			@import "css/demo_table.css";
		</style>
		<script type="text/javascript" src="js/jquery.dataTables.js"></script>
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				$(".errors tr").mouseover(function() {$(this).addClass("over");}).mouseout(function() {$(this).removeClass("over");});
				$(".errors tr:even").addClass("alt");
			});
		</script>
		
		<script type="text/javascript" charset="utf-8"> 
			$(document).ready(function() {
				$('#table1').dataTable();
			} );
		</script>
	
	</head>
<body>
<%
		int err;
		String[] errorList;
		int rows,cols;
		ArrayList<String> colnames = new ArrayList<String>();
		
		try{
			err = session.getAttribute("derr").toString().toInt();
			errorList = (String[]) session.getAttribute("derrorlist").toString();	
		}
		catch(Exception e){
			
		}
		
		try{
			rows = session.getAttribute("drow").toString();
			cols = session.getAttribute("dcol").toString().toInt();
			colnames = session.getAttribute("dcolnames").toString();
			//dstore
			
		}
		catch(Exception e){
			
		}
		
		//display data error codes
		out.print("<table class="+"errors"+">");
		out.print("<th>"+err+" data error/s found </th>");
		for(int i=0;i<err;i++){
			out.print("<tr><td>"+errorList[i]+"</td></tr>");
		}
		out.print("</table>");
		//end of display
		
		%>
		<div id="resultsIc">
			<h3 id="restxt">Advanced Query Results</h3>
		</div>
		<%
		//print advanced query results
		out.print("<p>SQL query returned "+ rows +" results.  ");
		//if(query.rowCount > 0){
			out.print("<input type= \"button\" value =\"Show results\" onclick=\"append_row();\" />");
		//}
		out.print("</p>");
		%>
		<%
			
			
			
		%>
		<table>
			<thead>
				<tr>
				<%
					for(int i=0;i<cols;i++){
						out.println("<td>"+colnames.get(i)+"</td>");
					}
		
				%>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>&nbsp;</td>
				</tr>
			
			</tbody>
		</table>
		
	</div>

</body>
</html>