package datavalidation;

import java.util.*;
import java.sql.*;

public class Queries {

	public String[] queryList = new String[55];
	public int[] errorsList = new int[55];
	public int list = 0;
	public ResultSet rs;
	public Connection con;
    public Statement st;
    
    public int[] getErrors(){
    	return errorsList;
    	
    }
    
	public void callQueries(){
		try {
			con = DriverManager.getConnection("jdbc:mysql//localhost:3306/iris","root","");
			st= con.createStatement();
			for(int i = 0;i < list;i++){
				rs=st.executeQuery(queryList[i]);
				if(rs.next()){
					errorsList[i] = 1; //select statement returns data
				}
				else{
					errorsList[i] = 0;
				}
				
			} 
			
	    	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
	}
	
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
			//No SQL query found
		}
		
		else if (queryID.equals(Ids[1])) //OINDEX table (Factorid ID or Level No is zero)
		{
			//No SQL query found
		}
		
		else if (queryID.equals(Ids[2])) //Trait-Scale-Method Relationship
		{
			//No SQL query found
		}
		
		else if (queryID.equals(Ids[3])) //Duplicate records in DATA_N,DATA_C tables 
		{
			//No SQL query found
		}
		
		else if (queryID.equals(Ids[4])) //Duplicate records in LEVEL_N,LEVEL_C tables
		{
			//No SQL query found
		}
		
		else if (queryID.equals(Ids[5])) //Level inconsistency in labels of a factor
		{
			//No SQL query found
		}
		
		else if (queryID.equals(Ids[6])) //Name type occurence
		{
			//DataError-0027: Germplasm with certain name types occurring more than once
			queryList[list] = "SELECT g.gid,n.ntype,COUNT(*) as number_of_names_with_same_ntype FROM (germplsm as g INNER JOIN names as n ON g.gid = n.gid)WHERE g.grplce = 0 and n.nstat <> 9 AND n.ntype IN (1,2,3,9,11,21,1019)GROUP BY g.gid, n.ntype HAVING COUNT(n.nid) > 1";
			list++;
			//DataError-0028: Germplasm with both CRSNM and LNAME name types
			queryList[list] = "SELECT n1.gid,n1.nid as nid1,n1.ntype as ntype1,n1.nval as nval1,n1.nuid as nuid1,n2.nid as nid2,n2.ntype as ntype2,n2.nval as nval2,n2.nuid as nuid2 from (names as n1 INNER JOIN names as n2 on n1.gid = n2.gid),germplsm as g where n1.ntype = 2 and n1.nstat <> 9 and n2.ntype = 13 and n2.nstat <> 9 and n1.gid = g.gid and g.grplce = 0";
			list++;
			//DataError-0029: Germplasm with both RELNM and COLNO name types
			queryList[list] = "SELECT n1.gid,n1.nid as nid1,n1.ntype as ntype1,n1.nval as nval1,n1.nuid as nuid,n2.nid as nid2,n2.ntype as ntype2,n2.nval as nval2,n2.nuid as nuid2 from (names as n1 INNER JOIN names as n2 on n1.gid = n2.gid),germplsm as g where n1.ntype = 9 and n1.nstat <> 9 and n2.ntype = 4 and n2.nstat <> 9 and n1.gid = g.gid and g.grplce = 0";
			list++;
			
		}
		
		else if (queryID.equals(Ids[7])) //Name sharing (ACCNO,ITEST,GACC,RELNM)
		{
			//DataError-0030A: Multiple germplasms sharing the same name (ACCNO)
			queryList[list] = "SELECT n1.nval,n1.ntype,g1.grplce,Count(n1.GID) AS Number_of_germplasm_sharing_this_name FROM names AS n1 INNER JOIN germplsm AS g1 ON n1.GID = g1.GID WHERE n1.ntype=1 AND g1.grplce=0 GROUP BY n1.nval, n1.ntype, g1.grplce HAVING count(n1.gid) > 1";
			list++;
			//DataError-0030B: Multiple germplasms sharing the same name (ITEST)
			queryList[list] = "SELECT n1.nval,n1.ntype,g1.grplce,Count(n1.GID) AS Number_of_germplasm_sharing_this_name FROM names AS n1 INNER JOIN germplsm AS g1 ON n1.GID = g1.GID WHERE n1.ntype=11 AND g1.grplce=0 GROUP BY n1.nval, n1.ntype, g1.grplce HAVING count(n1.gid) > 1";
			list++;
			//DataError-0030C: Multiple germplasms sharing the same name (GACC)
			queryList[list] = "SELECT n1.nval,n1.ntype,g1.grplce,Count(n1.GID) AS Number_of_germplasm_sharing_this_name FROM names AS n1 INNER JOIN germplsm AS g1 ON n1.GID = g1.GID WHERE n1.ntype=21 AND g1.grplce=0 GROUP BY n1.nval, n1.ntype, g1.grplce HAVING count(n1.gid) > 1";
			list++;
			//DataError-0030D: Germplasm sharing a RELNM (release name) with another germplasm in the SAME country
			queryList[list] = "SELECT n1.gid,n1.nid,n1.nval,g1.germuid,n2.gid AS gid_2,n2.nid AS gid2_nid,g2.germuid as gid2_germuid FROM (names as n1 INNER JOIN germplsm as g1 ON n1.gid = g1.gid),(names as n2 INNER JOIN germplsm as g2 ON n2.gid = g2.gid),location as l WHERE n1.ntype = 4 and n1.nstat <> 9 and n2.ntype = 4 and n2.nstat <> 9 and l.ltype = 405 and n1.nval = n2.nval and g1.glocn = g2.glocn and n1.gid <> n2.gid and g2.grplce <> g1.gid and g1.glocn = l.locid";
			list++;
		}
		
		else if (queryID.equals(Ids[8])) //Name type GACC (Genebank accession)
		{
			//DataError-0036A: Genebank accessions (name type GACC) with MTYPE <> Management (MAN)
			queryList[list] = "SELECT g.gid as germplsm_gid,g.methn as germplsm_methn,m.mtype as method_mtype,n.nval as names_nval,u.uname as icis_user FROM names as n,(germplsm AS g INNER JOIN methods AS m ON g.methn = m.mid),users as u WHERE n.ntype = 21 and n.nstat <> 9 and g.gid = n.gid and g.grplce = 0 and m.mtype <> 'MAN' and g.germuid = u.userid";
			list++;
			//DataError-0036B: Genebank accessions (name type GACC) with MGID = 0
			queryList[list] = "SELECT g.gid as germplsm_gid,g.methn as germplsm_methn,g.mgid,m.mtype as method_mtype,n.nval as names_nval,u.uname as icis_user FROM names as n,(germplsm AS g INNER JOIN methods AS m ON g.methn = m.mid),users as u WHERE n.ntype = 21 and n.nstat <> 9 and g.gid = n.gid and g.grplce = 0 and g.mgid = 0 and g.germuid = u.userid";
			list++;
			//DataError-0036C: Genebank accessions (name type GACC) with GPID1 <> MGID.
			queryList[list] = "SELECT g.gid,n.nval,g.gpid1,g.mgid,m.gpid1 as gpid1_of_mgid,u.uname as icis_user FROM names as n,(germplsm AS g INNER JOIN germplsm as m ON g.mgid = m.gid),users as u Where n.ntype = 21 and n.nstat <> 9 and n.gid = g.gid and g.gpid1 <> g.mgid and g.grplce = 0 and m.gpid1 = 0 and g.germuid = u.userid";
			list++;
			//DataError-0036D: Genebank accessions (name type GACC) with GPID1 <> MGID'S GPID1
			queryList[list] = "SELECT g.gid,n.nval,g.gpid1,g.mgid,m.gpid1 as gpid1_of_mgid,u.uname as icis_user FROM names as n,(germplsm AS g INNER JOIN germplsm as m ON g.mgid = m.gid),users as u Where n.ntype = 21 and n.nstat <> 9 and n.gid = g.gid and m.gpid1 <>  0 and g.grplce = 0 and g.gpid1 <> m.gpid1 and g.germuid = u.userid";
			list++;
			//DataError-0036E: International Rice Genebank Collection (IRGC) accession with Cross Name (NTYPE = 2)
			queryList[list] = "SELECT g.gid,n.nval,n.ntype,u.uname as icis_user FROM names as n INNER JOIN germplsm AS g ON n.gid = g.gid, users as u Where n.ntype = 2 and n.nstat <> 9 and g.grplce = 0 and LEFT(n.nval,4) = 'IRGC' and g.germuid = u.userid";
			list++;
		}
		
		else if (queryID.equals(Ids[9])) //Name inheritance from GPID2 (NSTAT,NDATE,NLOCN)
		{
			//DataError-0014: MAN germplasm with inherited name from GPID2 but NSTAT not inherited
			queryList[list] = "SELECT n.nid,n.gid,n.nval,n.nstat,g.gpid2 as gpid2_gid,n2.nstat as gpid2_nstat,u.uname as icis_user from names AS n INNER JOIN germplsm g on n.gid = g.gid,names as n2,methods as m,users as u where g.methn = m.mid and m.mtype = 'MAN' and n2.nval = n.nval and g.grplce = 0 and n2.gid = g.gpid2 and n2.nstat <> n.nstat and n2.nstat = 1 and n.nstat <> 9 and g.germuid = u.userid ";
			list++;
			//DataError-0015: Germplasm with inherited name from GPID2 but NDATE not inherited
			queryList[list] = "SELECT n.nid,n.gid,n.nval,n.ndate,g.gpid2 as gpid2_gid,n2.ndate as gpid2_ndate,u.uname as icis_user from names AS n INNER JOIN germplsm g on n.gid = g.gid,names as n2,users as u where n2.nval = n.nval and g.grplce = 0 and n2.gid = g.gpid2 and n2.ndate <> n.ndate and n2.ndate <> 0 and n.nstat <> 9 AND g.germuid = u.userid";
			list++;
			//DataError-0016: Germplasm with inherited name from GPID2 but NLOCN not inherited
			queryList[list] = "SELECT n.nid,n.gid,n.nval,n.nlocn,g.gpid2 as gpid2_gid,n2.nlocn as gpid2_nlocn,u.uname as icis_user from names AS n INNER JOIN germplsm g on n.gid = g.gid,names as n2,methods as m,users as u where g.methn = m.mid and m.mtype = 'MAN' and n2.nval = n.nval and g.grplce = 0 and n2.gid = g.gpid2 and n2.nlocn <> n.nlocn and n.nstat <> 9 and g.germuid = u.userid";
			list++;
		}
		
		else if (queryID.equals(Ids[10])) //name format
		{
			//No SQL query found
		}
		
		else if (queryID.equals(Ids[11])) //Preferred name eligibility (name types)
		{
			//DataError-0019: Germplasm with invalid name type as preferred name
			queryList[list] = "SELECT n.gid,n.nstat,n.ntype,n.nval,u.uname as icis_user FROM names as n INNER JOIN germplsm as g ON n.gid = g.gid,(SELECT gid from names group by gid having count(nid) > 1) as x,users as u WHERE n.nstat = 1 and n.ntype NOT IN (2,4,5,6,20)and g.grplce = 0 and n.gid = x.gid and n.nuid = u.userid";
			list++;
		}
		
		else if (queryID.equals(Ids[12])) //Preferred ID eligibility (name types)
		{
			//DataError-0021: Germplasm with invalid name type as preferred ID
			queryList[list] = "SELECT n.gid,n.nstat,n.ntype,n.nval,u.uname as icis_user FROM (names as n INNER JOIN germplsm as g on n.nid = g.gid),(SELECT gid from names group by gid having count(nid) > 1) as x,users as u WHERE n.nstat = 8 and g.grplce = 0 and n.ntype NOT IN (1,21,11,1019,5,9)and n.gid = x.gid and n.nuid = u.userid";
			list++;
			//DataError-0022: Germplasm with preferred ID not unique for the given name type
			queryList[list] = "SELECT n1.gid,n1.nid,n1.nstat,n1.nval,n2.gid as gid_2,n2.nid as gid2_nid,n2.nstat as gid2_nstat,n2.nval as gid2_nval from names as n1,names as n2 where n1.gid <> n2.gid and (n1.nstat = 8 or n2.nstat = 8)and n1.nstat <> 9 and n2.nstat <> 9 and n1.nval = n2.nval and n1.ntype = n2.ntype";
			list++;
		}
		
		else if (queryID.equals(Ids[13])) //Creation location (GLOCN) of germplasms imported by:
		{
			//No SQL query found
		}
		
		else if (queryID.equals(Ids[14])) //Incorrect parent references
		{
			//DataError-0001: Unknown group source
			queryList[list] = "SELECT g.gid,g.gnpgs,g.methn,g.gpid1,g.gpid2,u.uname as icis_user FROM germplsm AS g INNER JOIN users as u ON g.germuid = u.userid Where g.gnpgs = -1 And g.gpid1 = 0 and g.grplce = 0 And g.gpid2 <> 0";
			list++;
			//DataError-0002: Germplasm with non-generative group source
			queryList[list] = "SELECT g1.gid,m1.mname,g1.gpid2,g1.gpid1,m2.mname as method_of_gpid1,g2.gnpgs as gnpgs_of_gpid1,g2.gpid1 as gpid1_of_gpid1,u.uname as icis_user FROM ((germplsm as g1 INNER JOIN names as n1 ON g1.gid = n1.gid) inner join methods as m1 on g1.methn = m1.mid) INNER JOIN ( (germplsm as g2 INNER JOIN names as n2 ON g2.gid = n2.gid) inner join methods as m2 on g2.methn = m2.mid) on g2.gid = g1.gpid1,users as u Where n1.nstat = 1 And g1.gnpgs = -1And g1.gpid1 <> 0 And g1.grplce = 0 And g2.gnpgs = -1And g2.gpid1 <> 0 and g1.germuid = u.userid"; 
			list++;
		}
		
		else if (queryID.equals(Ids[15])) //Circular references
		{
			//DataError-0003: 1st level circular reference
			//GPID 1
			queryList[list] = "SELECT g.gid,g.gpid1,u.uname as icis_user FROM germplsm as g, users as u WHERE g.gid = g.gpid1 and g.germuid = u.userid and g.grplce = 0";
			list++;
			//GPID 2
			queryList[list] = "SELECT g.gid,g.gpid2,u.uname as icis_user FROM germplsm as g, users as u WHERE g.gid = g.gpid2 and g.germuid = u.userid and g.grplce = 0";
			list++;
			//DataError-0004: 2nd level circular reference
			//GPID 1
			queryList[list] = "SELECT g1.gid,g1.gpid1,g2.gpid1 as p1_gpid1,u.uname as icis_user FROM germplsm as g1 INNER JOIN germplsm AS g2 ON (g1.gpid1 = g2.gid) AND (g1.gid = g2.gpid1), users as u Where g1.gnpgs = -1 and g1.germuid = u.userid And g1.grplce = 0";
			list++;
			//GPID 2
			queryList[list] = "SELECT g1.gid,g1.gpid2,g2.gpid2 as p2_gpid2,u.uname as icis_user FROM germplsm as g1 INNER JOIN germplsm AS g2 ON (g1.gpid2 = g2.gid) AND (g1.gid = g2.gpid2), users as u Where g1.gnpgs = -1 and g1.germuid = u.userid And g1.grplce = 0";
			list++;
			//DataError-0005: 3rd level circular reference
			//GPID 1
			queryList[list] = "SELECT g1.gid,g1.gpid1,g2.gpid1 as p1_gpid1,g3.gpid1 as p1_p1_gpid1,u.uname as icis_user FROM (germplsm as g1 INNER JOIN germplsm AS g2 ON g1.gpid1 = g2.gid) INNER JOIN germplsm AS g3 ON (g3.gpid1 = g1.gid) AND (g2.gpid1 = g3.gid), users as u Where g1.gnpgs = -1 and g1.germuid = u.userid And g1.grplce = 0";
			list++;
			//GPID 2
			queryList[list] = "SELECT g1.gid,g1.gpid2,g2.gpid2 as p2_gpid2,g3.gpid2 as p2_p2_gpid2,u.uname as icis_user FROM (germplsm as g1 INNER JOIN germplsm AS g2 ON g1.gpid2 = g2.gid) INNER JOIN germplsm AS g3 ON (g3.gpid2 = g1.gid) AND (g2.gpid2 = g3.gid),users as u Where g1.gnpgs = -1 and g1.germuid = u.userid And g1.grplce = 0";
			list++;
		}
		
		else if (queryID.equals(Ids[16])) //Incorrect germplasm creation method
		{
			//DataError-0006A: Incorrect germplasm method (Method = DER but GNPGS <> -1)
			queryList[list] = "SELECT g.gid,g.methn,m.mtype,g.gnpgs,g.grplce,u.uname as icis_user FROM germplsm as g INNER JOIN methods as m ON g.methn = m.mid,users as u WHERE m.mtype='DER' AND g.gnpgs<>-1 and g.germuid = u.userid and g.grplce = 0";
			list++;
			//DataError-0006B: Incorrect germplasm method (Method = GEN but GNPGS < 0)	
			queryList[list] = "SELECT g.gid,g.methn,m.mtype,g.gnpgs,g.grplce,u.uname FROM germplsm as g INNER JOIN methods as m ON g.METHN = m.MID,users as u WHERE m.mtype='GEN' and g.germuid = u.userid AND g.gnpgs<0 and g.grplce = 0";
			list++;
		}
		
		else if (queryID.equals(Ids[17])) //Germplasm location
		{
			//DataError-0023B: Germplasm with GLOCN different from GLOCN of GPID2 (METHOD <> IMPORT)
			queryList[list] = "SELECT g.gid,g.methn,g.glocn,p2.gid AS gpid2,p2.glocn AS gpid2_glocn,u.uname as icis_user FROM germplsm AS g INNER JOIN germplsm AS p2 ON g.gpid2 = p2.gid,users as u WHERE g.grplce = 0 and g.methn <> 62 and g.germuid = u.userid and g.glocn <> p2.glocn";
			list++;
		}
		
		else if (queryID.equals(Ids[18])) //Deleted parent references 
		{
			//DataError-0007A: Germplasm with deleted parent references (GPID1)
			queryList[list] = "SELECT g.gid as gid,g.gpid1 as deleted_gpid1,u.uname as icis_user FROM germplsm AS g INNER JOIN germplsm as p1 ON g.gpid1 = p1.gid, users as u Where g.grplce = 0 and g.germuid = u.userid and p1.grplce = p1.gid";
			list++;
			//DataError-0007B: Germplasm with deleted parent references (GPID2)
			queryList[list] = "SELECT g.gid as gid,g.gpid2 as deleted_gpid2, u.uname as icis_user FROM germplsm AS g INNER JOIN germplsm as p2 ON g.gpid2 = p2.gid, users as u Where g.grplce = 0 and g.germuid = u.userid and p2.grplce = p2.gid";
			list++;
			//DataError-0007C: Germplasm with deleted parent references (MGID)
			queryList[list] = "SELECT g.gid as gid,g.mgid as deleted_mgid,u.uname as icis_user FROM germplsm AS g INNER JOIN germplsm as m ON g.mgid = m.gid, users as u Where g.grplce = 0 and g.germuid and u.userid and m.grplce = m.gid ";
			list++;
		}
		
		else if (queryID.equals(Ids[19])) //Replaced parent references
		{
			//DataError-0015A: Germplasm with replaced parent references (GPID1)
			queryList[list] = "SELECT g.gid as gid,g.gpid1 as original_gpid1,p1.grplce as change_gpid1_to,u.uname as icis_user from germplsm as g INNER JOIN germplsm as p1 on g.gpid1 = p1.gid,users as u where g.grplce = 0 and p1.grplce <> 0 and p1.grplce <> p1.gid and g.germuid = u.userid ";
			list++;
			//DataError-0015B: Germplasm with replaced parent references (GPID2)
			queryList[list] = "SELECT g.gid as gid,g.gpid2 as original_gpid2,p2.grplce as change_gpid2_to,u.uname as icis_user FROM germplsm as g INNER JOIN germplsm as p2 on g.gpid2 = p2.gid, users as u WHERE g.grplce = 0 and p2.grplce <> 0 and p2.grplce <> p2.gid and g.germuid = u.userid ";
			list++;
			//DataError-0015C: Germplasm with replaced parent references (MGID)
			queryList[list] = "SELECT g.gid as gid,g.mgid as original_mgid,m.grplce as change_mgid_to,u.uname as icis_user from germplsm as g inner join germplsm as m on g.mgid = m.gid,users as u where g.grplce = 0 and m.grplce <> 0 and m.grplce <> m.gid and g.germuid = u.userid ";
			list++;
		}
		
		else if (queryID.equals(Ids[20])) //No names
		{
			//DataError-0008: Germplasm with no NAMES records 
			queryList[list] = "SELECT a.gid as germplsm_gid,a.methn as germplsm_method,a.glocn as germplsm_location,u.uname as icis_user from germplsm as a,users as u where a.grplce = 0 and a.germuid = u.userid and not exists (select * from names n where n.gid = a.gid) ";
			list++;
		}
		
		else if (queryID.equals(Ids[21])) //Duplicate names
		{
			//DataError-0032: Germplasm with duplicate names 
			queryList[list] = "SELECT a.gid,a.nval,a.ntype,a.nid,u.uname as icis_user from names a, users as u where exists ( select * from names b where a.gid = b.gid and a.ntype=b.ntype and a.nval = b.nval and a.nuid <> b.nuid and a.nstat <> 9 and b.nstat <> 9) and a.nuid = u.userid order by g.gid, a.nval, u.uname";
			list++;
			queryList[list] = "SELECT a.gid,a.nval,a.ntype,a.nid,u.uname as icis_user from names a, users as u where exists( select * from names b where a.gid = b.gid and a.ntype=b.ntype and a.nval = b.nval and a.nuid = b.nuid and a.nid <> b.nid and a.nstat <> 9 and b.nstat <> 9) and a.nuid = u.userid order by a.gid, a.nval, u.uname";
			list++;
		}
		
		else if (queryID.equals(Ids[22])) //Possible duplicate names
		{
			//DataError-0010: Germplasm with possible duplicate names (NTYPE-NSTAT combination occurring more than once)
			queryList[list] = "SELECT a.gid,a.ntype,a.nstat,a.nval,a.nid,u.uname as icis_user from names a, users as u where exists( select * from names b where a.gid = b.gid and a.ntype = b.ntype and a.nstat = b.nstat and a.nval <> b.nval and a.nstat <> 9 and b.nstat <> 9)and a.nuid = u.userid order by a.gid,a.nval";
			list++;
		}
		
		else if (queryID.equals(Ids[23])) //Method and name type combinations
		{
			//DataError-0024: Invalid method-name type combination for method GEN (generative)
			queryList[list] = "SELECT g.gid,m.mtype,n.ntype,u.fcode,n.nval,g.germuid,n.nuid FROM (germplsm AS g INNER JOIN methods AS m ON g.methn = m.mid),(names as n INNER JOIN udflds as u on n.ntype = u.fldno)WHERE m.mtype = 'GEN' and g.grplce = 0 and g.gid = n.gid and n.nstat <> 9 AND u.ftable = 'NAMES' AND u.fcode NOT IN ('CRSNM','UNCRS','UNRES')";
			list++;
			//DataError-0025: Invalid method-name type combination for method DER (derivative)
			queryList[list] = "SELECT g.gid,m.mtype,n.ntype,u.fcode,n.nval,g.germuid,n.nuid FROM (germplsm AS g INNER JOIN methods AS m ON g.methn = m.mid),(names as n INNER JOIN udflds as u on n.ntype = u.fldno)WHERE m.mtype = 'DER' and g.grplce = 0 and g.gid = n.gid and n.nstat <> 9 AND u.ftable = 'NAMES' AND u.FCODE NOT IN ('RELNM','DRVNM','CVNAM','CVABR','NTEST','LNAME','ADVNM','ACVNM','AABBR','OLDMUT1','OLDMUT2','ELITE','UNRES') ";
			list++;
			//DataError-0026: Invalid method-name type combination for method MAN (maintenance)
			queryList[list] = "SELECT g.gid,m.mtype,n.ntype,u.fcode,n.nval,g.germuid,n.nuid FROM (germplsm AS g INNER JOIN methods AS m ON g.methn = m.mid),(names as n INNER JOIN udflds as u on n.ntype = u.fldno)WHERE m.mtype = 'MAN' and g.grplce = 0 and g.gid = n.gid and n.nstat <> 9 AND u.ftable = 'NAMES' AND u.FCODE NOT IN ('ACCNO','RELNM','CVNAM','CVABR','COLNO','FACCN','ITEST','NTEST','LNAME','TACC','ADVNM','ACVNM','ELITE','GACC','DACCN','LCNAM','CIATGB')";
			list++;
		}
		
		else if (queryID.equals(Ids[24])) //Count preferred IDs 
		{
			//DataError-0011: Germplasm with no preferred ID (NSTAT=8) and no existing preferred English name
			queryList[list] = "SELECT a.gid as gid,u.uname as icis_user from germplsm a, users u where not exists (select * from names b where a.gid = b.gid and b.nstat = 8)and not exists (select * from names c where a.gid = c.gid and c.nstat = 1)and a.germuid = u.userid";
			list++;
			//DataError-0020: Germplasm with multiple preferred IDs (NSTAT=8)
			queryList[list] = "SELECT distinct a.gid as gid,u.uname as icis_user from names a, users u where exists(select * from names b where a.gid = b.gid and a.nstat=b.nstat and a.nstat = 8 and a.nid<>b.nid and a.nstat<>9 and b.nstat<>9)and a.nuid = u.userid order by a.gid";
			list++;
		}
		
		else if (queryID.equals(Ids[25])) //Count preferred names 
		{
			//DataError-0017: Germplasm with multiple preferred English names (NSTAT=1)
			queryList[list] = "SELECT distinct a.gid as gid,u.uname as icis_user from names a, users u where exists(select * from names b where a.gid = b.gid and a.nstat=b.nstat and a.nstat = 1 and a.nid<>b.nid and a.nstat<>9 and b.nstat<>9)and a.nuid = u.userid order by a.gid";
			list++;
			//DataError-0018: Germplasm with no preferred English name (NSTAT=1) and no existing preferred ID
			queryList[list] = "SELECT a.gid as gid,u.uname as icis_user from germplsm a, users u where not exists (select * from names b where a.gid = b.gid and b.nstat = 1)and not exists (select * from names c where a.gid = c.gid and c.nstat = 8)and a.germuid = u.userid";
			list++;
		}
		
		else if (queryID.equals(Ids[26])) //Germplasm creation date (GDATE)
		{
			//DataError-0034A: Germplasm with METHOD = IMPORT but with no germplasm creation date
			queryList[list] = "SELECT gid,gdate,methn,grplce,u.uname as icis_user FROM germplsm, users as u where methn = 62 and gdate = 0 and germuid = u.userid and grplce = 0";
			list++;
			//DataError-0034B: Germplasm with incorrect creation date (GDATE) format
			queryList[list] = "SELECT gid,gdate,methn,grplce,u.uname as icis_user FROM germplsm,users as u where gdate <> 0 and grplce = 0 and germuid = u.userid and len(gdate) <> 8";
			list++;
			//DataError-0034C: Germplasm with creation date (GDATE) after current date
			queryList[list] = "SELECT gid,gdate,methn,grplce,u.uname as icis_user FROM germplsm, users as u where gdate <> 0 and grplce = 0 and len(gdate) = 8 and gdate > [YYYYMMDD] and germuid = u.userid";
			list++;
		}
		
		else if (queryID.equals(Ids[27])) //GDATE of progenitors
		{
			//DataError-0012: Germplasm with germplasm creation date (GDATE) earlier than GDATE of parent (GPID1, GPID2 or both)
			queryList[list] = "SELECT c1.gid,c1.gdate,p1.gid as gpid1,p1.gdate as gpid1_gdate,p2.gid as gpid2,p2.gdate as gpid2_gdate,u.uname as icis_user from (germplsm as c1 inner join germplsm as p1 on c1.gpid1 = p1.gid),(germplsm as c2 inner join germplsm as p2 on c2.gpid2 = p2.gid),users as u where c1.grplce = 0 and c1.gid = c2.gid and c1.grplce = 0 and c1.gdate <> 0 and c2.gdate <> 0 and c1.germuid = u.userid and ( (p1.gdate > c1.gdate and mid(cstr(p1.gdate),1,) <> mid(cstr(c1.gdate),1,)) or (p2.gdate > c2.gdate and mid(cstr(p2.gdate),1,) <> mid(cstr(c2.gdate),1,)))";
			list++;
			//DataError-0013: Germplasm with germplasm creation date (GDATE) earlier than GDATE of MGID
			queryList[list] = "SELECT c.gid,c.gdate,mt.mtype,mg.gid as mgid,mg.gdate as mgid_gdate,u.uname as icis_user FROM germplsm AS c INNER JOIN germplsm AS mg ON c.mgid = mg.gid,methods as mt,users as u where c.grplce = 0 and c.methn = mt.mid and mt.mtype = 'MAN' and c.gdate <> 0 and mg.gdate > c.gdate and c.germuid = u.userid and mid(cstr(mg.gdate),1,) <> mid(cstr(c.gdate),1,)";
			list++;
			
		}
		
		else if (queryID.equals(Ids[28])) //Name date (NDATE)
		{
			//DataError-0035A: Germplasm with incorrect name date (NDATE) format
			queryList[list] = "SELECT n.nid,n.gid,n.ndate,u.uname as icis_user FROM names as n INNER JOIN germplsm as g ON n.gid = g.gid,users as u where n.ndate <> 0 and n.nstat <> 9 and g.grplce = 0 and len(n.ndate) <> 8 and n.nuid = u.userid";
			list++;
			//DataError-0035B: Germplasm with NAME date (NDATE) after current date
			queryList[list] = "SELECT n.nid,n.gid,n.ndate,u.uname as icis_user FROM names as n INNER JOIN germplsm as g ON n.gid = g.gid, users as u where n.ndate <> 0 and n.nstat <> 9 and g.grplce = 0 and len(gdate) = 8 and n.ndate > [YYYYMMDD] and n.nuid = u.userid";
			list++;
		}
		
		else if (queryID.equals(Ids[29])) //NDATE vs GDATE
		{
			//DataError-0033: Germplasm with non-inherited name but name date (NDATE) earlier than germplasm creation date (GDATE)
			queryList[list] = "select n.nid,n.gid,n.nval,n.nstat,n.ndate,g.gdate,n.nlocn,u.uname as icis_user from names as n inner join germplsm as g on n.gid = g.gid,users as u where n.ndate <> 0 and g.gdate <> 0 and g.grplce = 0 and n.nuid = u.userid and n.ndate < g.gdate and not exists (select * from names b where b.gid=g.gpid2 and n.nval = b.nval)and mid(cstr(n.ndate),1,) <> mid(cstr(g.gdate),1,)";
			list++;
		}
		
		else if (queryID.equals(Ids[30])) //ATRIBUTS
		{
			//No SQL query found
		}
		
		else if (queryID.equals(Ids[31])) //BIBREFS
		{
			//No SQL query found
		}
		
		else if (queryID.equals(Ids[32])) //CHANGES
		{
			//No SQL query found
		}
		
		else if (queryID.equals(Ids[33])) //GEOREF
		{
			//No SQL query found
		}
		
		else if (queryID.equals(Ids[34])) //GERMPLSM
		{
			//No SQL query found
		}
		
		else if (queryID.equals(Ids[35])) //INSTLN
		{
			//No SQL query found
		}
		
		else if (queryID.equals(Ids[36])) //LISTDATA
		{
			//No SQL query found
		}
		
		else if (queryID.equals(Ids[37])) //LOCATION
		{
			//No SQL query found
		}
		
		else if (queryID.equals(Ids[38])) //LISTNMS
		{
			//No SQL query found
		}
		
		else if (queryID.equals(Ids[39])) //LOCDES
		{
			//No SQL query found
		}
		
		else if (queryID.equals(Ids[40])) //METHODS
		{
			//No SQL query found
		}
		
		else if (queryID.equals(Ids[41])) //NAMES
		{
			//No SQL query found
		}
		
		else if (queryID.equals(Ids[42])) //PROGNTRS
		{
			//No SQL query found
		}
		
		else if (queryID.equals(Ids[43])) //SNDIVS
		{
			//No SQL query found
		}
		
		else if (queryID.equals(Ids[44])) //USERS
		{
			//No SQL query found
		}
		
	}
	
	public String[] getQueryList(){
		
		return queryList;
		
	}
	
}
