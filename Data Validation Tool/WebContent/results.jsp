<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import = "datavalidation.*" %>
<% 
	Queries results = new Queries();
	
	for(int j=0;j <= results.rowCount;j++){
		for(int i=1;i <= results.noOfColumns;i++){
				if(j == 0){
					//column names
					out.print(results.columnNames.get(i));
				}
				else{
					// data
					out.print(results.store[i]);
				}
		}
	}

%>
</body>
</html>