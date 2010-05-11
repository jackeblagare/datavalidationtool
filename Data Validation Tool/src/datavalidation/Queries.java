package datavalidation;

import java.util.*;

public class Queries {

	public String[] queryList = new String[50];
	public int list = 0;
	
	public void mapQuery(String queryID) 
	{
		String[] Ids = {
		"DMSgid","DMSoindex","DMStraitS","DMSduplData","DMSduplLevel","DMSlevel","ISnameT","ISnameS"
		,"ISnameTGACC","ISnameI","ISnameFmt","ISprefN","ISprefID","ISglocn","GMSinP","GMScircR","GMSincGc","GMSgloc"
		,"GMSdelP","GMSrepP","GMSnon","GMSdupN","GMSposDup","GMSmethN","GMSctP","GMSprN","GMSgdate","GMSgdatePr","GMSndate"
		,"GMSngdate","GMSAttr","GMSbib","GMSchng","GMSgeo","GMSgpm","GMSinstln","GMSlistd","GMSloc","GMSlistnms","GMSlocdes"
		,"GMSmeth","GMSnames","GMSprog","GMSsndivs","GMSusrs"
		};
		
		if(queryID.equals(Ids[0])) //Check GIDs in DMS that have been replaced in the GMS
		{
			
		}
		
		else if (queryID.equals(Ids[1])) //OINDEX table (Factorid ID or Level No is zero)
		{
			
		}
		
		else if (queryID.equals(Ids[2])) //Trait-Scale-Method Relationship
		{
		
		}
		
		else if (queryID.equals(Ids[3])) //Duplicate records in DATA_N,DATA_C tables 
		{
			queryList[list] = "";
			list++;
		}
		
		else if (queryID.equals(Ids[4])) //Duplicate records in LEVEL_N,LEVEL_C tables
		{
		
		}
		
		else if (queryID.equals(Ids[5])) //Level inconsistency in labels of a factor
		{
		
		}
		
		else if (queryID.equals(Ids[6])) //Name type occurence
		{
		
		}
		
		else if (queryID.equals(Ids[7])) //Name sharing (ACCNO,ITEST,GACC,RELNM)
		{}
		
		else if (queryID.equals(Ids[8])) //Name type GACC (Genebank accession)
		{}
		
		else if (queryID.equals(Ids[9])) //Name inheritance from GPID2 (NSTAT,NDATE,NLOCN)
		{}
		
		else if (queryID.equals(Ids[10])) //name format
		{}
		
		else if (queryID.equals(Ids[11])) //Preferred name eligibility (name types)
		{}
		
		else if (queryID.equals(Ids[12])) //Preferred ID eligibility (name types)
		{}
		
		else if (queryID.equals(Ids[13])) //Creation location (GLOCN) of germplasms imported by:
		{}
		
		else if (queryID.equals(Ids[14])) //Incorrect parent references
		{
			queryList[list] = "SELECT g.gid,g.gnpgs,g.methn,g.gpid1,g.gpid2,u.uname as icis_user FROM germplsm AS g INNER JOIN users as u ON g.germuid = u.userid Where g.gnpgs = -1 And g.gpid1 = 0 and g.grplce = 0 And g.gpid2 <> 0";
			list++;
			queryList[list] = "SELECT g1.gid,m1.mname,g1.gpid2,g1.gpid1,m2.mname as method_of_gpid1,g2.gnpgs as gnpgs_of_gpid1,g2.gpid1 as gpid1_of_gpid1,u.uname as icis_user FROM ((germplsm as g1 INNER JOIN names as n1 ON g1.gid = n1.gid) inner join methods as m1 on g1.methn = m1.mid) INNER JOIN ( (germplsm as g2 INNER JOIN names as n2 ON g2.gid = n2.gid) inner join methods as m2 on g2.methn = m2.mid) on g2.gid = g1.gpid1,users as u Where n1.nstat = 1 And g1.gnpgs = -1And g1.gpid1 <> 0 And g1.grplce = 0 And g2.gnpgs = -1And g2.gpid1 <> 0 and g1.germuid = u.userid"; 
			list++;
		}
		
		else if (queryID.equals(Ids[15])) //Circular references
		{}
		
		else if (queryID.equals(Ids[16])) //Incorrect germplasm creation method
		{
			
		}
		
		else if (queryID.equals(Ids[17])) //Germplasm location
		{}
		
		else if (queryID.equals(Ids[18])) //Deleted parent references 
		{
			queryList[list] = "SELECT g.gid as gid,g.gpid1 as deleted_gpid1,u.uname as icis_user FROM germplsm AS g INNER JOIN germplsm as p1 ON g.gpid1 = p1.gid, users as u Where g.grplce = 0 and g.germuid = u.userid and p1.grplce = p1.gid";
			list++;
			queryList[list] = "SELECT g.gid as gid,g.gpid2 as deleted_gpid2, u.uname as icis_user FROM germplsm AS g INNER JOIN germplsm as p2 ON g.gpid2 = p2.gid, users as u Where g.grplce = 0 and g.germuid = u.userid and p2.grplce = p2.gid";
			list++;
			queryList[list] = "SELECT g.gid as gid,g.mgid as deleted_mgid,u.uname as icis_user FROM germplsm AS g INNER JOIN germplsm as m ON g.mgid = m.gid, users as u Where g.grplce = 0 and g.germuid and u.userid and m.grplce = m.gid ";
			list++;
		}
		
		else if (queryID.equals(Ids[19])) //Replaced parent references
		{
			queryList[list] = "select g.gid as gid,g.gpid1 as original_gpid1,p1.grplce as change_gpid1_to,u.uname as icis_user from germplsm as g INNER JOIN germplsm as p1 on g.gpid1 = p1.gid,users as u where g.grplce = 0 and p1.grplce <> 0 and p1.grplce <> p1.gid and g.germuid = u.userid ";
			list++;
			queryList[list] = "select g.gid as gid,g.gpid2 as original_gpid2,p2.grplce as change_gpid2_to,u.uname as icis_user FROM germplsm as g INNER JOIN germplsm as p2 on g.gpid2 = p2.gid, users as u WHERE g.grplce = 0 and p2.grplce <> 0 and p2.grplce <> p2.gid and g.germuid = u.userid ";
			list++;
			queryList[list] = "select g.gid as gid,g.mgid as original_mgid,m.grplce as change_mgid_to,u.uname as icis_user from germplsm as g inner join germplsm as m on g.mgid = m.gid,users as u where g.grplce = 0 and m.grplce <> 0 and m.grplce <> m.gid and g.germuid = u.userid ";
			list++;
		}
		
		else if (queryID.equals(Ids[20])) //No names
		{}
		
		else if (queryID.equals(Ids[21])) //Duplicate names
		{}
		
		else if (queryID.equals(Ids[22])) //Possible duplicate names
		{}
		
		else if (queryID.equals(Ids[23])) //Method and name type combinations
		{}
		
		else if (queryID.equals(Ids[24])) //Count preferred IDs 
		{}
		
		else if (queryID.equals(Ids[25])) //Count preferred names 
		{}
		
		else if (queryID.equals(Ids[26])) //Germplasm creation date (GDATE)
		{}
		
		else if (queryID.equals(Ids[27])) //Germplasm creation date (GDATE)
		{}
		
		else if (queryID.equals(Ids[28])) //Name date (NDATE)
		{}
		
		else if (queryID.equals(Ids[29])) //NDATE vs GDATE
		{}
		
		else if (queryID.equals(Ids[30])) //ATRIBUTS
		{}
		
		else if (queryID.equals(Ids[31])) //BIBREFS
		{}
		
		else if (queryID.equals(Ids[32])) //CHANGES
		{}
		
		else if (queryID.equals(Ids[33])) //GEOREF
		{}
		
		else if (queryID.equals(Ids[34])) //GERMPLSM
		{}
		
		else if (queryID.equals(Ids[35])) //INSTLN
		{}
		
		else if (queryID.equals(Ids[36])) //LISTDATA
		{}
		
		else if (queryID.equals(Ids[37])) //LOCATION
		{}
		
		else if (queryID.equals(Ids[38])) //LISTNMS
		{}
		
		else if (queryID.equals(Ids[39])) //LOCDES
		{}
		
		else if (queryID.equals(Ids[40])) //METHODS
		{}
		
		else if (queryID.equals(Ids[41])) //NAMES
		{}
		
		else if (queryID.equals(Ids[42])) //PROGNTRS
		{}
		
		else if (queryID.equals(Ids[43])) //SNDIVS
		{}
		
		else if (queryID.equals(Ids[44])) //USERS
		{}
		
	}
	
	public String[] getQueryList(){
		
		return queryList;
		
	}
	
}
