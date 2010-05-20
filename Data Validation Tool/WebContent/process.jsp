<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>Data Validation Tool</title>
		<link rel="icon" href="images/favicon/favicon.ico"/>
		<link rel="stylesheet" href="css/processEl.css"/>
		<link rel="stylesheet" href="css/ingrid.css" type="text/css" media="screen" />
		<script type="text/javascript" src="js/ingrid.js"></script>
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				$(".errors tr").mouseover(function() {$(this).addClass("over");}).mouseout(function() {$(this).removeClass("over");});
				$(".errors tr:even").addClass("alt");
			});
		</script>
		<script type="text/javascript">
			$(document).ready(
			function() {
				$("#table1").ingrid({ 
					url: 'remote.html',
					height: 350
				});
			}
		); 
	</script>
	
	</head>
	
	<body>
	
		<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
		<%@ page import = "datavalidation.*" %>
    
		<%
			Queries query = new Queries();	
		
			//checks whether a query is selected
			int flag= 0;
	
	if(request.getParameter("DMSgid") != null){
		query.mapQuery("DMSgid");	
		flag = 1;
	}
	
	if(request.getParameter("DMSoindex") != null){
		query.mapQuery("DMSoindex");
		flag = 1;
	}
	
	if(request.getParameter("DMStraitS") != null){
		query.mapQuery("DMStraitS");
		flag = 1;
	}
	
	if(request.getParameter("DMSduplData") != null){
		query.mapQuery("DMSduplData");
		flag = 1;
	}

	if(request.getParameter("DMSduplLevel") != null){
		query.mapQuery("DMSduplLevel");
		flag = 1;
	}
	
	if(request.getParameter("DMSlevel") != null){
		query.mapQuery("DMSlevel");
		flag = 1;
	}
	
	if(request.getParameter("ISnameT") != null){
		query.mapQuery("ISnameT");
		flag = 1;
	}
	
	if(request.getParameter("ISnameS") != null){
		query.mapQuery("ISnameS");
		flag = 1;
	}
	
	if(request.getParameter("ISnameTGACC") != null){
		query.mapQuery("ISnameTGACC");
		flag = 1;
	}
	
	if(request.getParameter("ISnameI") != null){
		query.mapQuery("ISnameI");
		flag = 1;
	}
	
	if(request.getParameter("ISnameFmt") != null){
		query.mapQuery("ISnameFmt");
		flag = 1;
	}
	
	if(request.getParameter("ISprefN") != null){
		query.mapQuery("ISprefN");
		flag = 1;
	}
	
	if(request.getParameter("ISprefID") != null){
		query.mapQuery("ISprefID");
		flag = 1;
	}
	
	if(request.getParameter("ISglocn") != null){
		query.mapQuery("ISglocn");
		flag = 1;
	}
	
	if(request.getParameter("GMSinP") != null){
		query.mapQuery("GMSinP");
		flag = 1;
	}
	
	if(request.getParameter("GMScircR") != null){
		query.mapQuery("GMScircR");
		flag = 1;
	}
	
	if(request.getParameter("GMSincGc") != null){
		query.mapQuery("GMSincGc");
		flag = 1;
	}
	
	if(request.getParameter("GMSgloc") != null){
		query.mapQuery("GMSgloc");
		flag = 1;
	}
	
	if(request.getParameter("GMSdelP") != null){
		query.mapQuery("GMSdelP");
		flag = 1;
	}
	
	if(request.getParameter("GMSrepP") != null){
		query.mapQuery("GMSrepP");
		flag = 1;
	}
	
	if(request.getParameter("GMSnon") != null){
		query.mapQuery("GMSnon");
		flag = 1;
	}
	
	if(request.getParameter("GMSdupN") != null){
		query.mapQuery("GMSdupN");
		flag = 1;
	}
	
	if(request.getParameter("GMSposDup") != null){
		query.mapQuery("GMSposDup");
		flag = 1;
	}
	
	if(request.getParameter("GMSmethN") != null){
		query.mapQuery("GMSmethN");
		flag = 1;
	}
	
	if(request.getParameter("GMSctP") != null){
		query.mapQuery("GMSctP");
		flag = 1;
	}
	
	if(request.getParameter("GMSprN") != null){
		query.mapQuery("GMSprN");
		flag = 1;
	}
	
	if(request.getParameter("GMSgdate") != null){
		query.mapQuery("GMSgdate");
		flag = 1;
	}
	
	if(request.getParameter("GMSgdatePr") != null){
		query.mapQuery("GMSgdatePr");
		flag = 1;
	}
	
	if(request.getParameter("GMSndate") != null){
		query.mapQuery("GMSndate");
		flag = 1;
	}
	
	if(request.getParameter("GMSngdate") != null){
		query.mapQuery("GMSngdate");
		flag = 1;
	}
	
	if(request.getParameter("GMSAttr") != null){
		query.mapQuery("GMSAttr");
		flag = 1;
	}
	
	if(request.getParameter("GMSbib") != null){
		query.mapQuery("GMSbib");
		flag = 1;
	}
	
	if(request.getParameter("GMSchng") != null){
		query.mapQuery("GMSchng");
		flag = 1;
	}
	
	if(request.getParameter("GMSgeo") != null){
		query.mapQuery("GMSgeo");
		flag = 1;
	}
	
	if(request.getParameter("GMSgpm") != null){
		query.mapQuery("GMSgpm");
		flag = 1;
	}
	
	if(request.getParameter("GMSinstln") != null){
		query.mapQuery("GMSinstln");
		flag = 1;
	}
	
	if(request.getParameter("GMSlistd") != null){
		query.mapQuery("GMSlistd");
		flag = 1;
	}
	
	if(request.getParameter("GMSloc") != null){
		query.mapQuery("GMSloc");
		flag = 1;
	}
	
	if(request.getParameter("GMSlistnms") != null){
		query.mapQuery("GMSlistnms");
		flag = 1;
	}
	
	if(request.getParameter("GMSlocdes") != null){
		query.mapQuery("GMSlocdes");
		flag = 1;
	}
	
	if(request.getParameter("GMSmeth") != null){
		query.mapQuery("GMSmeth");
		flag = 1;
	}
	
	if(request.getParameter("GMSnames") != null){
		query.mapQuery("GMSnames");
		flag = 1;
	}
	
	if(request.getParameter("GMSprog") != null){
		query.mapQuery("GMSprog");
		flag = 1;
	}
	
	if(request.getParameter("GMSsndivs") != null){
		query.mapQuery("GMSsndivs");
		flag = 1;
	}
	
	if(request.getParameter("GMSusrs") != null){
		query.mapQuery("GMSusrs");
		flag = 1;
	}
	
	if(flag>0){
		query.callQueries();
		out.print("<table class="+"errors"+">");
		out.print("<th>"+query.err+" data errors found </th>");
		for(int i=0;i<query.err;i++){
			out.print("<tr><td>"+query.errorsList[i]+"</td></tr>");
		}
		out.print("</table>");
	}
	
	//Advanced query processing
	
	String host = request.getParameter("host");
	String port = request.getParameter("port");
	String user = request.getParameter("username");
	String pwd = request.getParameter("pwd");
	String db = request.getParameter("dbase");
	String sql = request.getParameter("sql");
	
	//call method to execute query
	query.executeAdvancedQry(host,port,user,pwd,db,sql);
%>
	<div id="resultsIc">
		<h3 id="restxt">Advanced Query Results</h3>
	</div>
		
	<%
	//print advanced query results
		out.print("<p>SQL query returned "+query.getRowCount()+" results.  ");
		//if(query.rowCount > 0){
			out.print("<input type= \"button\" value =\"Show results\" onclick=\"append_row();\" />");
		//}
		out.print("</p>");
	%>
	
	<div>
	<table>
		<thead>
		<tr>
		<%
			for(int k=1;k <= query.getColCount();k++){
				out.print("<td>"+ query.columnNames.get(k - 1) +"</td>");
			}
		%>
		</tr>
		</thead>
		<tbody>
		<%
			for(int i=0;i < query.getRowCount();i++){
				out.print("<tr>");
				for(int j=1;j <= query.getColCount();j++){
						out.print("<td>"+ query.store[i][j] +"</td>");
				}
				out.print("</tr>");
			}
		%>
		</tbody>
	</table>
	</div>

	<script type="text/javascript">
		function append_row(){
			$('#advancedRows').append();
		}
	
		$(function(){
			$("#basicResults").html("<p> </p>");
		});
	</script>
	<div id="advancedRows"></div>
	</body>
</html>