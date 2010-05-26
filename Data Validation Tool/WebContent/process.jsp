<%@ page import = "datavalidation.*" %>
<%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>Data Validation Tool</title>
		<style type="text/css" title="currentStyle">
			@import "css/demo_page.css";
			@import "css/demo_table.css";
		</style>
		<link rel="icon" href="images/favicon/favicon.ico"/>
		<link rel="stylesheet" href="css/processEl.css"/>	
		<script type="text/javascript" language="javascript" src="js/jquery.dataTables.js"></script>
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript">
			var oTable;
			$(document).ready(function() {
				$(".errors tr").mouseover(function() {$(this).addClass("over");}).mouseout(function() {$(this).removeClass("over");});
				$(".errors tr:even").addClass("alt");
				oTable = $('#example').dataTable();
			});
		</script>
	
	</head>
	
	<body id="dt_example">
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
		session.setAttribute("derr",query.err); 
		session.setAttribute("derrorlist",query.errorsList);
		
		//render page-----
		out.print("<table class="+"errors"+">");
		out.print("<th>"+query.err+" data errors found </th>");
		for(int i=0;i<query.err;i++){
			out.print("<tr><td>"+query.errorsList[i]+"</td></tr>");
		}
		out.print("</table>");
		//render page------
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
	
	int rowCnt = query.getRowCount();
	int colCnt = query.getColCount();
	
	ResultSet rs2 = query.getRs();
	%>
	<h2>Advanced Query Results</h2>
	<div id="container">
		
			<div id="demo">
	<table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
		<thead>
			<tr>
				<%
				for(int k=1;k <= query.getColCount();k++){
					out.println("<th>"+query.columnNames.get(k - 1)+"</th>");
				}
				%>
			</tr>
		</thead>
		<tbody>
			<%
			
			//renders results of advanced query
			for(int i=0;i<rowCnt;i++){
				out.println("<tr>");									
				for(int j=1;j<=colCnt;j++){
					out.println("<td>"+rs2.getObject(j)+"</td>");	
				}	
				out.println("</tr>");
			}
			query.closeDb(); //closes ResultSet,Statement,and Connection
		%>
		</tbody>
	</table>
		</div>
	</div>
	</body>
</html>