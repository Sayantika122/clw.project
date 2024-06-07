<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%!
	String url, uid,control_number,s_no,department,complaint_type,complaint_subtype,complaint_desc,sl_no,dt,jsonresponse,complaint_date,tech_deputed,correction_action_taken,incharge,remarks;
	Connection conn;
	PreparedStatement ps,pstemp;
	ResultSet rs,rstemp;
	HttpSession hs;
%>
<%
hs=request.getSession();
uid=(String)hs.getAttribute("userid");
s_no=request.getParameter("s_no");
tech_deputed=request.getParameter("tech_deputed");
correction_action_taken=request.getParameter("correction_action_taken");
incharge=request.getParameter("incharge");
remarks=request.getParameter("remarks");



	//url="jdbc:oracle:thin:@(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST =10.43.10.5)(PORT = 1521))    )    (CONNECT_DATA =      (SERVICE_NAME = CLWFMIS)    )  )";
	//conn=DriverManager.getConnection(url,"accounts","accounts");
	
	conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","clw","clw");
	

	
	ps=conn.prepareStatement("UPDATE ccc_complaints SET tech_deputed=?,correction_action_taken=?,incharge=?,remarks=?,status='C' WHERE s_no=?");
	ps.setString(1, tech_deputed);
	ps.setString(2, correction_action_taken);
	ps.setString(3, incharge);
	ps.setString(4, remarks);
	ps.setString(5, s_no);
	ps.executeUpdate();


	conn.close();
%>    
    
    
