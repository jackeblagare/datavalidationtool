<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Advanced Query</title>
</head>
<body>
	<div id="container">
		<form method="post">
			<table>
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
			
			<textarea rows="10" cols="50" name="sql"></textarea>
			<textarea rows="10" cols="50" name="results"></textarea>
		</form>
	</div>
</body>
</html>