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
		String _err = session.getAttribute("derr").toString();
		out.print(_err);
		int err = Integer.parseInt(_err);
		String[] errorList = (String[])session.getAttribute("derrorlist");

		String host = (String)session.getAttribute("dhost");
		String port = (String)session.getAttribute("dport");
		String user = (String)session.getAttribute("duser");
		String pwd = (String)session.getAttribute("dpwd");
		String db = (String)session.getAttribute("ddb");
		String sql = (String)session.getAttribute("dsql");

		out.print(host +"<br />"+ port +"<br />"+ user +"<br />"+ pwd +"<br />"+ db +"<br />"+ sql);
		out.print("<br />");
		out.print("No of errors = " +err);
		for(int i =0; i<err;i++){
			out.print("ErrorList "+ i +"=="+ errorList[i]);
		}
		
%>
</body>
</html>