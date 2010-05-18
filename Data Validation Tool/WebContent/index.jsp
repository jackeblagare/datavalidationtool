<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>Data Validation Tool</title>
		<link rel="stylesheet" href="css/main.css"/>	
		<link rel="stylesheet" href="css/indexEl.css"/>
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/utils.js"></script>
	</head>

	<body>
		<br/>
		<div id="data" class="container">
			<form method="post" action="process.jsp" > <!-- FORM -->
    			<ul class="tabs">
        			<li><a href="#tab1">Data Management System</a></li>
        			<li><a href="#tab2">Implementation-specific</a></li>
        			<li><a href="#tab3">Genealogy Management System</a></li>
        			<li><a href="#tab4">Database foreign key references by table</a></li>
        			<li><a href="#tab5">Advanced Query</a></li>
    			</ul>
    			
    			<div class="tab_container">
        			<div id="tab1" class="tab_content">
        				<input type="checkbox" name="DMSgid" disabled="disabled"/> Check GIDs in DMS that have been replaced in the GMS <br/>
        				<input type="checkbox" name="DMSoindex" disabled="disabled"/> OINDEX table (Factorid ID or Level No is zero) <br/>
        				<input type="checkbox" name="DMStraitS" disabled="disabled"/> Trait-Scale-Method Relationship <br/>
        				<input type="checkbox" name="DMSduplData" disabled="disabled"/> Duplicate records in DATA_N,DATA_C tables <br/>
        				<input type="checkbox" name="DMSduplLevel" disabled="disabled"/> Duplicate records in LEVEL_N,LEVEL_C tables <br/>
        				<input type="checkbox" name="DMSlevel" disabled="disabled"/> Level inconsistency in labels of a factor <br/>
        	
        			</div>
        
        			<div id="tab2" class="tab_content">
        				<input type="checkbox" name="ISnameT"/> Name type occurence <br/>
        				<input type="checkbox" name="ISnameS"/> Name sharing (ACCNO,ITEST,GACC,RELNM) <br/>
        				<input type="checkbox" name="ISnameTGACC"/> Name type GACC (Genebank accession) <br/>
        				<input type="checkbox" name="ISnameI"/> Name inheritance from GPID2 (NSTAT,NDATE,NLOCN)<br/>
        				<input type="checkbox" name="ISnameFmt"/> <input type="text" size="5" name="nameFmt" value="IRGC"/> name format <br/>
        				<input type="checkbox" name="ISprefN"/> Preferred name eligibility (name types) <br/>
        				<input type="checkbox" name="ISprefID"/> Preferred ID eligibility (name types) <br/>
        				<input type="checkbox" name="ISglocn"/> Creation location (GLOCN) of germplasms imported by: <input type="text" name="locnName" size="7" value="IRRI"/> <br/>   
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
        						<input type="radio" name="prec" value="year"/>Year (YYYY)
        						<input type="radio" name="prec" value="ym"/>Year and month (YYYYMM)
        						<input type="radio" name="prec" value="ymd"/>Year, month, and day (YYYYMMDD)
        					</fieldset>
        			</fieldset>  
        		</div>
        
        		<div id="tab4" class="tab_content">
       				<fieldset>
       					<fieldset>
       						<legend>Options</legend>
       						<input type="radio" name="GMSopts" value="1" disabled="disabled"/>Include zero values
       						<input type="radio" name="GMSopts" value="2" disabled="disabled"/>Exclude zero values
       					</fieldset>
       					<fieldset id="gmsField">
       						<legend><b>GMS</b></legend>
       						<a class="button" id="gmsSelectAll" href="#" disabled="disabled"><span>Select All</span></a> 
       						<a class="button" id="gmsDSelectAll" href="#" disabled="disabled"><span>Deselect All</span></a> 
       						<br/><br/>
       						<input type="checkbox" name="GMSAttr" disabled="disabled"/> ATRIBUTS <br/>
        					<input type="checkbox" name="GMSbib" disabled="disabled"/> BIBREFS <br/>
        					<input type="checkbox" name="GMSchng" disabled="disabled"/> CHANGES <br/>
        					<input type="checkbox" name="GMSgeo" disabled="disabled"/> GEOREF <br/>
        					<input type="checkbox" name="GMSgpm" disabled="disabled"/> GERMPLSM <br/>
        					<input type="checkbox" name="GMSinstln" disabled="disabled"/> INSTLN <br/>
        					<input type="checkbox" name="GMSlistd" disabled="disabled"/> LISTDATA <br/>
        					<input type="checkbox" name="GMSloc" disabled="disabled"/> LOCATION <br/>
        					<input type="checkbox" name="GMSlistnms" disabled="disabled"/> LISTNMS <br/>
        					<input type="checkbox" name="GMSlocdes" disabled="disabled"/> LOCDES <br/>
        					<input type="checkbox" name="GMSmeth" disabled="disabled"/> METHODS<br/>
        					<input type="checkbox" name="GMSnames" disabled="disabled"/> NAMES <br/>
       						<input type="checkbox" name="GMSprog" disabled="disabled"/> PROGNTRS <br/>
        					<input type="checkbox" name="GMSsndivs" disabled="disabled"/> SNDIVS <br/>
        					<input type="checkbox" name="GMSusrs" disabled="disabled"/> USERS <br/>
        		
       					</fieldset>
       					<fieldset id="dmsField">
       						<legend><b>DMS</b></legend>
       						<a class="button" id="dmsSelectAll" href="#" disabled="disabled"><span>Select All</span></a> 
       						<a class="button" id="dmsDSelectAll" href="#" disabled="disabled"><span>Deselect All</span></a>
       						<br/><br/>
       						<input type="checkbox" name="DMSfactor" disabled="disabled" /> FACTOR <br/>
        					<input type="checkbox" name="DMSvariate" disabled="disabled" /> VARIATE <br/>
       					</fieldset>
       				</fieldset>
        		</div>
        
        		<div id="tab5" class="tab_content">
        			<table id="connection">
						<tr>
							<td>Host:</td>
							<td><input type="text" name="host" id="host" value="localhost"/></td>
						</tr>
						<tr>
							<td>Username:</td>
							<td><input type="text" name="username" id="username" value="root"/></td>
						</tr>
						<tr>
							<td>Password:</td>
							<td><input type="password" id="pwd" name="pwd"/></td>
						</tr>
						<tr>
							<td>Port:</td>
							<td><input type="text" name="port" id="port" value="3306"/></td>
						</tr>
						<tr>
							<td>Database:</td>
							<td><input type="text" name="dbase" id="dbase" value="iris"/></td>
						</tr>
					</table>
					<div id="queryIc">
						<img src="images/query.png" height="30"/>
					</div>
					<h3 id="sqltxt">SQL Query</h3>
					<textarea rows="7" cols="50" id="sql" name="sql"></textarea><br/>
					<p></p><br/>
       			 </div>
    		</div>
    	
    			<br />
    			<a class="button" id="selectAllQ" href="#"><span>Select All Queries</span></a> 
    			<a class="button" id="deselectAllQ" href="#"><span>Deselect All Queries</span></a>
    			<br />
 	 			<hr />
 	 			<br />
 	 			 			
    			<input class="button" type="reset" value="RESET"/>
   				<input class="button" id="run" type="submit" value="RUN"/> 
    	    
    	    </form>
		</div>

	</body>
</html>