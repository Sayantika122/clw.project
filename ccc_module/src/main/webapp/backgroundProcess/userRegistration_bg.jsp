<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%!
	String url,usrName,ctrlNo,deptDdown,mobNo,pwd,confPwd;
	Connection conn;
	PreparedStatement ps;
%>
<%
usrName=request.getParameter("usrName");
ctrlNo=request.getParameter("ctrlNo");
deptDdown=request.getParameter("deptDdown");
mobNo=request.getParameter("mobNo");
pwd=request.getParameter("pwd");
confPwd=request.getParameter("confPwd");
	Class.forName("oracle.jdbc.driver.OracleDriver");// mandatory line
	//url ="jdbc:oracle:thin:@(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST =10.43.10.5)(PORT = 1521))    )    (CONNECT_DATA =      (SERVICE_NAME = CLWFMIS)    )  )";
	//conn=DriverManager.getConnection(url,"accounts","accounts");
	    conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","clw","clw");
	    
	ps=conn.prepareStatement("insert into CCC_USERS(CONTROL_NUMBER, USER_NAME, DEPARTMENT, MOBILE_NUMBER, USER_PASSWORD, USER_TYPE, ACTIVE_STATUS) values(?,?,?,?,?,'U','A')");
	ps.setString(1, ctrlNo);
	ps.setString(2, usrName);
	ps.setString(3, deptDdown);
	ps.setString(4, mobNo);
	ps.setString(5, pwd);
	ps.executeUpdate();
	conn.close();
%>