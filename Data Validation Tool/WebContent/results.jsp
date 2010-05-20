<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "datavalidation.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<body>
<%
	//eto dapat ung may ingrid jquery

		String[] errorList = (String[])session.getAttribute("derrorlist");
		String _err = session.getAttribute("derr").toString();
		int err = Integer.parseInt(_err);
		
		String _drow = session.getAttribute("drow").toString();
		String _dcol = session.getAttribute("dcol").toString();
		int rowNo = Integer.parseInt(_drow);
		int colNo = Integer.parseInt(_dcol);
		//String[] colNames = (String[])session.getAttribute("dcolnames");
		Object[][] data = (Object[][]) session.getAttribute("dstore");
		
		/*
		String host = (String)session.getAttribute("dhost");
		String port = (String)session.getAttribute("dport");
		String user = (String)session.getAttribute("duser");
		String pwd = (String)session.getAttribute("dpwd");
		String db = (String)session.getAttribute("ddb");
		String sql = (String)session.getAttribute("dsql");
		*/
		
		//render table of errors-----
		out.print("<table class="+"errors"+">");
		out.print("<th>"+err+" data errors found </th>");
		for(int i=0;i<err;i++){
			out.print("<tr><td>"+errorList[i]+"</td></tr>");
		}
		out.print("</table>");
		//render table of errors------
		%>
		<div id="resultsIc">
			<h3 id="restxt">Advanced Query Results</h3>
		</div>
		<%
		//print advanced query results
		out.print("<p>SQL query returned "+ rowNo +" results.  ");
		//if(query.rowCount > 0){
			out.print("<input type= \"button\" value =\"Show results\" onclick=\"append_row();\" />");
		//}
		out.print("</p>");
		%>
		
		<table id="#table1">
		<thead>
		<tr>
		<%
			for(int k=1;k <= colNo ;k++){
				//out.print("<td>"+ colNames[k-1] +"</td>");
			}
		%>
		</tr>
		</thead>
		<tbody>
		<%
			for(int i=0;i < rowNo;i++){
				out.print("<tr>");
				for(int j=1;j <= colNo;j++){
						out.print("<td>"+ data[i][j] +"</td>");
				}
				out.print("</tr>");
			}
		%>
		</tbody>
	</table>
		<%
		
		/*
		out.print(host +"<br />"+ port +"<br />"+ user +"<br />"+ pwd +"<br />"+ db +"<br />"+ sql);
		out.print("<br />");
		out.print("No of errors = " +err+ "<br />");
		for(int i =0; i<err;i++){
			out.print("ErrorList "+ i +"=="+ errorList[i]);
		}
		*/
		
%>

</body>
</html>