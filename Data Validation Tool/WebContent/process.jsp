
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ page import = "datavalidation.*" %>
    
<%
	Queries query = new Queries();	

	if(request.getParameter("DMSgid") != null){
		query.mapQuery("DMSgid");	
	}
	
	if(request.getParameter("DMSoindex") != null){
		query.mapQuery("DMSoindex");
	}
	
	if(request.getParameter("DMStraitS") != null){
		query.mapQuery("DMStraitS");
	}
	
	if(request.getParameter("DMSduplData") != null){
		query.mapQuery("DMSduplData");
	}

	if(request.getParameter("DMSduplLevel") != null){
		query.mapQuery("DMSduplLevel");
	}
	
	if(request.getParameter("DMSlevel") != null){
		query.mapQuery("DMSlevel");
	}
	
	if(request.getParameter("ISnameT") != null){
		query.mapQuery("ISnameT");
	}
	
	if(request.getParameter("ISnameS") != null){
		query.mapQuery("ISnameS");
	}
	
	if(request.getParameter("ISnameTGACC") != null){
		query.mapQuery("ISnameTGACC");
	}
	
	if(request.getParameter("ISnameI") != null){
		query.mapQuery("ISnameI");
	}
	
	if(request.getParameter("ISnameFmt") != null){
		query.mapQuery("ISnameFmt");
	}
	
	if(request.getParameter("ISprefN") != null){
		query.mapQuery("ISprefN");
	}
	
	if(request.getParameter("ISprefID") != null){
		query.mapQuery("ISprefID");
	}
	
	if(request.getParameter("ISglocn") != null){
		query.mapQuery("ISglocn");
	}
	
	if(request.getParameter("GMSinP") != null){
		query.mapQuery("GMSinP");
	}
	
	if(request.getParameter("GMScircR") != null){
		query.mapQuery("GMScircR");
	}
	
	if(request.getParameter("GMSincGc") != null){
		query.mapQuery("GMSincGc");
	}
	
	if(request.getParameter("GMSgloc") != null){
		query.mapQuery("GMSgloc");
	}
	
	if(request.getParameter("GMSdelP") != null){
		query.mapQuery("GMSdelP");
	}
	
	if(request.getParameter("GMSrepP") != null){
		query.mapQuery("GMSrepP");
	}
	
	if(request.getParameter("GMSnon") != null){
		query.mapQuery("GMSnon");
	}
	
	if(request.getParameter("GMSdupN") != null){
		query.mapQuery("GMSdupN");
	}
	
	if(request.getParameter("GMSposDup") != null){
		query.mapQuery("GMSposDup");
	}
	
	if(request.getParameter("GMSmethN") != null){
		query.mapQuery("GMSmethN");
	}
	
	if(request.getParameter("GMSctP") != null){
		query.mapQuery("GMSctP");
	}
	
	if(request.getParameter("GMSprN") != null){
		query.mapQuery("GMSprN");
	}
	
	if(request.getParameter("GMSgdate") != null){
		query.mapQuery("GMSgdate");
	}
	
	if(request.getParameter("GMSgdatePr") != null){
		query.mapQuery("GMSgdatePr");
	}
	
	if(request.getParameter("GMSndate") != null){
		query.mapQuery("GMSndate");
	}
	
	if(request.getParameter("GMSngdate") != null){
		query.mapQuery("GMSngdate");
	}
	
	if(request.getParameter("GMSAttr") != null){
		query.mapQuery("GMSAttr");
	}
	
	if(request.getParameter("GMSbib") != null){
		query.mapQuery("GMSbib");
	}
	
	if(request.getParameter("GMSchng") != null){
		query.mapQuery("GMSchng");
	}
	
	if(request.getParameter("GMSgeo") != null){
		query.mapQuery("GMSgeo");
	}
	
	if(request.getParameter("GMSgpm") != null){
		query.mapQuery("GMSgpm");
	}
	
	if(request.getParameter("GMSinstln") != null){
		query.mapQuery("GMSinstln");
	}
	
	if(request.getParameter("GMSlistd") != null){
		query.mapQuery("GMSlistd");
	}
	
	if(request.getParameter("GMSloc") != null){
		query.mapQuery("GMSloc");
	}
	
	if(request.getParameter("GMSlistnms") != null){
		query.mapQuery("GMSlistnms");
	}
	
	if(request.getParameter("GMSlocdes") != null){
		query.mapQuery("GMSlocdes");
	}
	
	if(request.getParameter("GMSmeth") != null){
		query.mapQuery("GMSmeth");
	}
	
	if(request.getParameter("GMSnames") != null){
		query.mapQuery("GMSnames");
	}
	
	if(request.getParameter("GMSprog") != null){
		query.mapQuery("GMSprog");
	}
	
	if(request.getParameter("GMSsndivs") != null){
		query.mapQuery("GMSsndivs");
	}
	
	if(request.getParameter("GMSusrs") != null){
		query.mapQuery("GMSusrs");
	}
	
	query.callQueries();
	query.show();
	
	out.print("<br/>");
	
	for(int i=0;i<=query.err;i++){
		out.print("-------------");
		out.print(query.errorsList[i]+"<br/><br/>");	
	}
	
	
%>