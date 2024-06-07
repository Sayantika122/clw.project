<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%!
	String url, uid,C_no,mb_sl,prc_sl,ram_sl,despatched_date,receiving_dept,received_by,placed_in_cpu_serial,jsonresponse;
	Connection conn;
	PreparedStatement ps,pstemp;
	ResultSet rs,rstemp;
	HttpSession hs;
%>
<%
hs=request.getSession();
uid=(String)hs.getAttribute("userid");
C_no=request.getParameter("C_no");
mb_sl=request.getParameter("mb_sl");
prc_sl=request.getParameter("prc_sl");
ram_sl=request.getParameter("ram_sl");
despatched_date=request.getParameter("despatched_date");
receiving_dept=request.getParameter("receiving_dept");
received_by=request.getParameter("received_by");
placed_in_cpu_serial=request.getParameter("placed_in_cpu_serial");


	//url="jdbc:oracle:thin:@(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST =10.43.10.5)(PORT = 1521))    )    (CONNECT_DATA =      (SERVICE_NAME = CLWFMIS)    )  )";
	//conn=DriverManager.getConnection(url,"accounts","accounts");
	
	conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","clw","clw"); 
	
	
	if(mb_sl.equals("NA")){
		// No action
	}else{
		ps=conn.prepareStatement("UPDATE ccc_inventory SET consumed = 'Y' WHERE serial_no=?");
		ps.setString(1, mb_sl);
		ps.executeUpdate();
		ps=conn.prepareStatement("insert into ccc_equipment_usage(s_no,serial_no,despatched_date,receiving_dept,received_by,placed_in_cpu_serial) values(?,?,?,?,?,?)");
		ps.setString(1, C_no);
		ps.setString(2, mb_sl);
		ps.setString(3, despatched_date);
		ps.setString(4, receiving_dept);
		ps.setString(5, received_by);
		ps.setString(6, placed_in_cpu_serial);
		ps.executeUpdate();
	} 
	if(prc_sl.equals("NA")){
		// No action
	}else{
		ps=conn.prepareStatement("UPDATE ccc_inventory SET consumed = 'Y' WHERE serial_no=?");
		ps.setString(1, prc_sl);
		ps.executeUpdate();
		ps=conn.prepareStatement("insert into ccc_equipment_usage(s_no,serial_no,despatched_date,receiving_dept,received_by,placed_in_cpu_serial) values(?,?,?,?,?,?)");
		ps.setString(1, C_no);
		ps.setString(2, prc_sl);
		ps.setString(3, despatched_date);
		ps.setString(4, receiving_dept);
		ps.setString(5, received_by);
		ps.setString(6, placed_in_cpu_serial);
		ps.executeUpdate();
	} 
	if(ram_sl.equals("NA")){
		// No action
	}else{
		ps=conn.prepareStatement("UPDATE ccc_inventory SET consumed = 'Y' WHERE serial_no=?");
		ps.setString(1, ram_sl);
		ps.executeUpdate();
		ps=conn.prepareStatement("insert into ccc_equipment_usage(s_no,serial_no,despatched_date,receiving_dept,received_by,placed_in_cpu_serial) values(?,?,?,?,?,?)");
		ps.setString(1, C_no);
		ps.setString(2, ram_sl);
		ps.setString(3, despatched_date);
		ps.setString(4, receiving_dept);
		ps.setString(5, received_by);
		ps.setString(6, placed_in_cpu_serial);
		ps.executeUpdate();
	} 

	
	conn.close();
%>    
    
    
