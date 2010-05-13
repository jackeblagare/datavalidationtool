<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Advanced Query</title>
<link rel="stylesheet" href="css/main.css"/>
<link rel="stylesheet" href="css/advancedEl.css"/>
</head>
<body>
	<div id="container">
		<form method="post">
			<table id="connection">
				<tr>
					<td>Host:</td>
					<td><input type="text" name="host"/></td>
				</tr>
				<tr>
					<td>Username:</td>
					<td><input type="text" name="username"/></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="password" name="pwd"/></td>
				</tr>
				<tr>
					<td>Port:</td>
					<td><input type="text" name="port"/></td>
				</tr>
				<tr>
					<td>Database:</td>
					<td><input type="text" name="dbase"/></td>
				</tr>
			</table>
			<div id="queryIc">
				<img src="images/query.png" height="30"/>
			</div>
			<h3 id="sqltxt">SQL Query</h3>
			<textarea rows="7" cols="50" id="sql" name="sql"></textarea><br/>
			<p></p><br/>
			<div id="opButtons">
				<input type="submit" value="Run"/>
				<input type="reset" value="Reset"/>
			</div>
			
		</form>
		<!-- RENDER RESULTS -->
		<div id="resultsIc">
				<img src="images/results.png" height="30"/>
		</div>
		<h3 id="restxt">Results</h3>
		<textarea rows="5" cols="84" id="results" name="results"></textarea>
	
	</div>
	<a class="button" href="index.jsp"><span>Back</span></a> 
</body>
</html>