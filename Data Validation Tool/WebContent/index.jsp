<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Data Validation Tool</title>
<style type="text/css">
body {
	background: #f0f0f0;
	margin: 0;
	padding: 0;
	font: 10px normal Verdana, Arial, Helvetica, sans-serif;
	color: #444;
}
h1 {font-size: 3em; margin: 20px 0;}
.container {width: 900px; margin: 10px auto;}
ul.tabs {
	margin: 0;
	padding: 0;
	float: left;
	list-style: none;
	height: 32px;
	border-bottom: 1px solid #999;
	border-left: 1px solid #999;
	width: 100%;
}
ul.tabs li {
	float: left;
	margin: 0;
	padding: 0;
	height: 31px;
	line-height: 31px;
	border: 1px solid #999;
	border-left: none;
	margin-bottom: -1px;
	background: #e0e0e0;
	overflow: hidden;
	position: relative;
}
ul.tabs li a {
	text-decoration: none;
	color: #000;
	display: block;
	font-size: 1.2em;
	padding: 0 20px;
	border: 1px solid #fff;
	outline: none;
}
ul.tabs li a:hover {
	background: #ccc;
}	
html ul.tabs li.active, html ul.tabs li.active a:hover  {
	background: #fff;
	border-bottom: 1px solid #fff;
}
.tab_container {
	border: 1px solid #999;
	border-top: none;
	clear: both;
	float: left; 
	width: 100%;
	background: #fff;
	-moz-border-radius-bottomright: 5px;
	-khtml-border-radius-bottomright: 5px;
	-webkit-border-bottom-right-radius: 5px;
	-moz-border-radius-bottomleft: 5px;
	-khtml-border-radius-bottomleft: 5px;
	-webkit-border-bottom-left-radius: 5px;
}
.tab_content {
	padding: 20px;
	font-size: 1.2em;
}
.tab_content h2 {
	font-weight: normal;
	padding-bottom: 10px;
	border-bottom: 1px dashed #ddd;
	font-size: 1.8em;
}
.tab_content h3 a{
	color: #254588;
}
.tab_content img {
	float: left;
	margin: 0 20px 20px 0;
	border: 1px solid #ddd;
	padding: 5px;
}
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">

$(document).ready(function() {

	//Default Action
	$(".tab_content").hide(); //Hide all content
	$("ul.tabs li:first").addClass("active").show(); //Activate first tab
	$(".tab_content:first").show(); //Show first tab content
	
	//On Click Event
	$("ul.tabs li").click(function() {
		$("ul.tabs li").removeClass("active"); //Remove any "active" class
		$(this).addClass("active"); //Add "active" class to selected tab
		$(".tab_content").hide(); //Hide all tab content
		var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
		$(activeTab).fadeIn(); //Fade in the active content
		return false;
	});

});
</script>
</head>

<body>

<div class="container">
	<form> <!-- FORM -->
    <ul class="tabs">
        <li><a href="#tab1">Data Management System</a></li>
        <li><a href="#tab2">Implementation-specific</a></li>
        <li><a href="#tab3">Genealogy Management System</a></li>
        <li><a href="#tab4">Database foreign key references by table</a></li>
        
    </ul>
    <div class="tab_container">
        <div id="tab1" class="tab_content">
        	<input type="checkbox" name="DMSgid"/> Check GIDs in DMS that have been replaced in the GMS <br/>
        	<input type="checkbox" name="DMSoindex"/> OINDEX table (Factorid ID or Level No is zero) <br/>
        	<input type="checkbox" name="DMStraitS"/> Trait-Scale-Method Relationship <br/>
        	<input type="checkbox" name="DMSduplData"/> Duplicate records in DATA_N,DATA_C tables <br/>
        	<input type="checkbox" name="DMSduplLevel"/> Duplicate records in LEVEL_N,LEVEL_C tables <br/>
        	<input type="checkbox" name="DMSlevel"/> Level inconsistency in labels of a factor <br/>
        	
        </div>
        <div id="tab2" class="tab_content">
        	<input type="checkbox" name="ISnameT"/> Name type occurence <br/>
        	<input type="checkbox" name="ISnameS"/> Name sharing (ACCNO,ITEST,GACC,RELNM) <br/>
        	<input type="checkbox" name="ISnameTGACC"/> Name type GACC (Genebank accession) <br/>
        	<input type="checkbox" name="ISnameI"/> Name inheritance from GPID2 (NSTAT,NDATE,NLOCN)<br/>
        	<input type="checkbox" name="ISnameFmt"/> <input type="text" size="5" name="nameFmt"/> name format <br/>
        	<input type="checkbox" name="ISprefN"/> Preferred name eligibility (name types) <br/>
        	<input type="checkbox" name="ISprefID"/> Preferred ID eligibility (name types) <br/>
        	<input type="checkbox" name="ISglocn"/> Creation location (GLOCN) of germplasms imported by: <input type="text" name="locnName" size="7"/> <br/>   
        </div>
       <div id="tab3" class="tab_content">
        	<fieldset>
        		<legend>GERMPLSM</legend>
        		<input type="checkbox" name="GMSinP"/> Incorrect parent references <br/>
        		<input type="checkbox" name="GMScircR"/> Circular references <br/>
        		<input type="checkbox" name="GMSincGc"/> Incorrect germplasm creation method <br/>
        		<input type="checkbox" name="GMSgloc"/> Germplasm location <br/>
        		<input type="checkbox" name="GMSdelP"/> Deleted parent references <br/>
        		<input type="checkbox" name="GMSrepP"/> Replaced parent references <br/>		
        	</fieldset>
        	<fieldset>
        		<legend>NAMES</legend>
        		<input type="checkbox" name="GMSnon"/> No names <br/>
        		<input type="checkbox" name="GMSdupN"/> Duplicate names <br/>
        		<input type="checkbox" name="GMSposDup"/> Possible duplicate names <br/>
        		<input type="checkbox" name="GMSmethN"/> Method and name type combinations <br/>
        		<input type="checkbox" name="GMSctP"/> Count preferred IDs <br/>
        		<input type="checkbox" name="GMSprN"/> Count preferred names <br/>
        	</fieldset>
        	<fieldset>
        		<legend>Dates</legend>
        		<input type="checkbox" name="GMSgdate"/> Germplasm creation date (GDATE) <br/>
        		<input type="checkbox" name="GMSgdatePr"/> GDATE of progenitors <br/>
        		<input type="checkbox" name="GMSndate"/> Name date (NDATE) <br/>
        		<input type="checkbox" name="GMSngdate"/> NDATE vs GDATE <br/>
        		<fieldset>
        			<legend>Precision</legend>
        			<input type="radio" name="prec" value="year">Year (YYYY)</input>
        			<input type="radio" name="prec" value="ym">Year and month (YYYYMM)</input>
        			<input type="radio" name="prec" value="ymd">Year, month, and day (YYYYMMDD)</input>
        		</fieldset>
        	</fieldset>  
        </div>
        <div id="tab4" class="tab_content">
       		<fieldset>
       			<fieldset>
       				<legend>Options</legend>
       				<input type="radio" name="GMSopts" value="1"/>Include zero values
       				<input type="radio" name="GMSopts" value="2"/>Exclude zero values"
       			</fieldset>
       			<fieldset>
       				<legend><b>GMS</b></legend>
       				<button id="gmsSelectAll">Select All</button>
       				<button id="gmsDSelectAll">Deselect All</button>
       				<br/>
       				<input type="checkbox" name="GMSAttr"/> ATRIBUTS <br/>
        			<input type="checkbox" name="GMSbib"/> BIBREFS <br/>
        			<input type="checkbox" name="GMSchng"/> CHANGES <br/>
        			<input type="checkbox" name="GMSgeo"/> GEOREF <br/>
        			<input type="checkbox" name="GMSgpm"/> GERMPLSM <br/>
        			<input type="checkbox" name="GMSinstln"/> INSTLN <br/>
        			<input type="checkbox" name="GMSlistd"/> LISTDATA <br/>
        			<input type="checkbox" name="GMSloc"/> LOCATION <br/>
        			<input type="checkbox" name="GMSlistnms"/> LISTNMS <br/>
        			<input type="checkbox" name="GMSlocdes"/> LOCDES <br/>
        			<input type="checkbox" name="GMSmeth"/> METHODS<br/>
        			<input type="checkbox" name="GMSnames"/> NAMES <br/>
       				<input type="checkbox" name="GMSprog"/> PROGNTRS <br/>
        			<input type="checkbox" name="GMSsndivs"/> SNDIVS <br/>
        			<input type="checkbox" name="GMSusrs"/> USERS <br/>
        		
       			</fieldset>
       			<fieldset>
       				<legend><b>DMS</b></legend>
       				<legend><b>GMS</b></legend>
       				<button id="dmsSelectAll">Select All</button>
       				<button id="dmsDSelectAll">Deselect All</button>
       				<br/>
       				<input type="checkbox" name="DMSfactor"/> FACTOR <br/>
        			<input type="checkbox" name="DMSvariate"/> VARIATE <br/>
        			
       			</fieldset>
       			
       		</fieldset>
       			
        </div>
    </div>
    </form>
</div>
</body>
</html>