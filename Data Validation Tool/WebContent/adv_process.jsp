<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ page import = "datavalidation.*" %>
<%
	
	String host = request.getParameter("host");
	String username = request.getParameter("username");
	String password = request.getParameter("pwd");
	String port = request.getParameter("port");
	String database = request.getParameter("dbase");
	
	String sqlquery = request.getParameter("sql");
	
%>
