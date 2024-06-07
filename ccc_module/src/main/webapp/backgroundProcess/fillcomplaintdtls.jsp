<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%!
	Connection conn;
static String url="";
PreparedStatement ps,ps1;
ResultSet rs;
String uid,s_no,var,jsontxt;
HttpSession hs;
%>
<%
	hs=request.getSession();
	uid=(String)hs.getAttribute("userid");
	s_no=request.getParameter("s_no");
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	//url ="jdbc:oracle:thin:@(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST =10.43.10.5)(PORT = 1521))    )    (CONNECT_DATA =      (SERVICE_NAME = CLWFMIS)    )  )";
	//conn=DriverManager.getConnection(url,"accounts","accounts");
	
	conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","clw","clw");
	

	ps=conn.prepareStatement("select S_NO, to_char(COMPLAINT_DATE,'DD/MM/YYYY'), CONTROL_NUMBER, COMPLAINT_TYPE, COMPLAINT_SUBTYPE, COMPLAINT_DESC, DEPARTMENT from ccc_complaints where s_no=?");
	
	ps.setString(1, s_no);
	rs=ps.executeQuery();
	while (rs.next()){
		jsontxt="{\"S_NO\":\""+rs.getString(1)+"\",\"COMPLAINT_DATE\":\""+rs.getString(2)+"\",\"CONTROL_NUMBER\":\""+rs.getString(3)+"\",\"COMPLAINT_TYPE\":\""+rs.getString(4)+"\",\"COMPLAINT_SUBTYPE\":\""+rs.getString(5)+"\",\"COMPLAINT_DESC\":\""+rs.getString(6)+"\",\"DEPARTMENT\":\""+rs.getString(7)+"\"}";
		out.print(jsontxt);
	}
	
	conn.close();
%>