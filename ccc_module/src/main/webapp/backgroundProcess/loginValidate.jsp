<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%!
	Connection conn;
static String url="";
PreparedStatement ps;
ResultSet rs;
String uid,pwd,jsonresponse;
HttpSession hs;
%>
<%
hs=request.getSession();
	
uid=request.getParameter("uid");
hs.setAttribute("userid", uid);
pwd=request.getParameter("pwd");	Class.forName("oracle.jdbc.driver.OracleDriver");
//url ="jdbc:oracle:thin:@(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST =10.43.10.5)(PORT = 1521))    )    (CONNECT_DATA =      (SERVICE_NAME = CLWFMIS)    )  )";
//conn=DriverManager.getConnection(url,"accounts","accounts");
	
conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","clw","clw"); 
	
ps=conn.prepareStatement("select count(*) from CCC_USERS where CONTROL_NUMBER=? and USER_PASSWORD=?");
ps.setString(1, uid);
ps.setString(2, pwd);
rs=ps.executeQuery();
while(rs.next()){
if(rs.getString(1).equals("0")){
hs.setAttribute("userid", "anonymous");
}
		
jsonresponse="{\"cnt\":\""+rs.getString(1)+"\"}";
out.println(jsonresponse);
}
conn.close();
%>