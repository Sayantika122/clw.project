<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%!
	String url, uid,control_number,department,complaint_type,complaint_subtype,complaint_desc,sl_no,dt,jsonresponse;
	Connection conn;
	PreparedStatement ps,pstemp;
	ResultSet rs,rstemp;
	HttpSession hs;
%>
<%
hs=request.getSession();
uid=(String)hs.getAttribute("userid");
control_number=request.getParameter("control_number");
department=request.getParameter("department");
complaint_type=request.getParameter("complaint_type");
complaint_subtype=request.getParameter("complaint_subtype");
complaint_desc=request.getParameter("complaint_desc");
//remarks=request.getParameter("remarks");

	//url="jdbc:oracle:thin:@(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST =10.43.10.5)(PORT = 1521))    )    (CONNECT_DATA =      (SERVICE_NAME = CLWFMIS)    )  )";
	//conn=DriverManager.getConnection(url,"accounts","accounts");
	conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","clw","clw");
	
	
	ps=conn.prepareStatement("select count(*) from ccc_complaints where to_char(complaint_date,'YYYYMM')=to_char(sysdate,'YYYYMM')");
	rs=ps.executeQuery();
	while(rs.next()){
		if(rs.getString(1).equals("0")){
			pstemp=conn.prepareStatement("select 'C'||to_char(sysdate,'MMYY')||'0001',to_char(sysdate,'DD/MM/YYYY') from dual");
			rstemp=pstemp.executeQuery();
			while(rstemp.next()){
				sl_no=rstemp.getString(1);
				dt=rstemp.getString(2);
			}
		}
		else{
			pstemp=conn.prepareStatement("select substr(max(s_no),1,5)||lpad(to_number(substr(max(s_no),6))+1,4,'0'),to_char(sysdate,'DD/MM/YYYY') from ccc_complaints");
			rstemp=pstemp.executeQuery();
			while(rstemp.next()){
				sl_no=rstemp.getString(1);
				dt=rstemp.getString(2);
			}
		}
	}
	
	ps=conn.prepareStatement("insert into ccc_complaints(s_no,complaint_date,control_number,status,complaint_type,complaint_subtype,complaint_desc,department) values(?,sysdate,?,'P',?,?,?,?)");
	ps.setString(1, sl_no);
	ps.setString(2, control_number);
	ps.setString(3, complaint_type);
	ps.setString(4, complaint_subtype);
	ps.setString(5, complaint_desc);
	ps.setString(6, department);
	ps.executeUpdate();
	
	jsonresponse="{\"slno\":\""+sl_no+"\",\"dt\":\""+dt+"\"}";
	out.println(jsonresponse);

	conn.close();
%>    
    
    
