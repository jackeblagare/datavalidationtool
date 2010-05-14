<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ page import = "datavalidation.*" %>
<%@ page import = "java.sql.*" %>
<%
	

	String host = request.getParameter("host");
	String username = request.getParameter("username");
	String password = request.getParameter("pwd");
	String port = request.getParameter("port");
	String database = request.getParameter("dbase");
	
	String sqlquery = request.getParameter("sql");
	
	ResultSet rs;
	Connection con;
    Statement st;
    
    try {
		con = DriverManager.getConnection("jdbc:mysql://"+host+":"+port+"/"+database,username,password);
		st= con.createStatement();
		rs= st.executeQuery(sqlquery);
		while(rs.next()){
			out.print(rs.getInt(1)+"<br/>");
		}
    	
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		//e.printStackTrace();
		out.print(e.getMessage());
	}
    
%>
