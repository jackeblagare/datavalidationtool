<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Data Validation Tool</title>
<link rel="stylesheet" href="css/main.css"/>
<link rel="stylesheet" href="css/indexEl.css"/>
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
		$(activeTab).fadeIn(300); //Fade in the active content
		return false;
	});

});
</script>
</head>

<body>
<br/>
<div id="data" class="container">
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
       				<button id="dmsSelectAll">Select All</button>
       				<button id="dmsDSelectAll">Deselect All</button>
       				<br/>
       				<input type="checkbox" name="DMSfactor"/> FACTOR <br/>
        			<input type="checkbox" name="DMSvariate"/> VARIATE <br/>
        			
       			</fieldset>
       			
       		</fieldset>
       			
        </div>
    </div>
   
    <div id="check">
    	<p><b>Check:</b></p>
    	<input type="checkbox" name="cdb" />Central Database<br/>
    	<input type="checkbox" name="ldb" />Local Database		
    </div>
    
    <div id="output">
    	<input type="checkbox" name="createFile"/>Create file(s) with error-flagged records?<br/>
    	<fieldset>
    		<legend>Output file type</legend>
    		<input type="radio" name="file"/>Text (.txt)<br/>
    		<input type="radio" name="file"/>PDF (.pdf)
    	</fieldset>
    	<fieldset>
    		<legend>Output file name</legend>
    		<input type="radio" name="filename"/>Timestamp first <input type="checkbox" name="errorDesc"/> Include error description<br/>
    		<input type="radio" name="filename"/>Error code first
    	</fieldset>
    </div>
    
    <div id="opButtons">
    	<button>Select All Queries</button>
    	<button>Deselect All Queries</button><br/>
    	<input type="reset" value="RESET"/>
   		<input type="submit" value="RUN"/>
    
    </div>
    </form>
    
    
</div>
</body>
</html>