<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%!
	Connection conn;
	HttpSession hs;
	String uid,colsession,utypesession;
%>
<%
	hs=request.getSession();
	uid="anonymous";
	colsession="anonymous";
	utypesession="anonymous";
	hs.setAttribute("userid", uid);
	//hs.setAttribute("colony", uid);
	hs.setAttribute("usertype", uid);
%>
