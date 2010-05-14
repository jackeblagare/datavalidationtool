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
<script src="js/jquery.js" type="text/javascript"></script>
<script type="text/javascript">
	$('#form').submit(function() {

		 $.ajax({
             type: "GET",
             url: "adv_process.jsp",
             data: 'host='+host+'&username='+ username+'&pwd='+pwd+'&port='+port+'&database='+dbase+'&sql='+sql,
             cache: false,
             success: function(response){
			 	$("#results").html("<h3>" + response + "</h3>").fadeIn("slow");
             }
         });
	});
</script>
</head>
<body>
	<a class="button" href="index.jsp"><span>&lt;&lt;Back</span></a> 
	<br/><br/>
	<div id="container">
		<br/>
		<form id="form">
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
		<div id="results"></div>
	</div>
	
</body>
</html>