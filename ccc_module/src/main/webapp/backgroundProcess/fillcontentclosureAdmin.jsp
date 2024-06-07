<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%!
	Connection conn;
static String url="";
PreparedStatement ps,ps1;
ResultSet rs;
String uid,show_type,var;
HttpSession hs;
%>
<%
	hs=request.getSession();
	uid=(String)hs.getAttribute("userid");
	show_type=request.getParameter("show_type");
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	//url ="jdbc:oracle:thin:@(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST =10.43.10.5)(PORT = 1521))    )    (CONNECT_DATA =      (SERVICE_NAME = CLWFMIS)    )  )";
	//conn=DriverManager.getConnection(url,"accounts","accounts");
	conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","clw","clw");
	
	
	if(show_type.equals("C1")){
		var="PC_Problem";
	}else if(show_type.equals("C2")){
		var="Printer_Problem";
	}else if(show_type.equals("C3")){
		var="Software_Problem";
	}else if(show_type.equals("C4")){
		var="LAN_Problem";
	}
	
	ps=conn.prepareStatement("select s_no,to_char(complaint_date,'DD/MM/YYYY'),control_number,department,complaint_type,complaint_subtype,complaint_desc from ccc_complaints where status='P' and complaint_type=?");
	ps.setString(1, var);
	rs=ps.executeQuery();
	%>
		<div style="margin-top:2%;border-top:3px solid #97A0B3;border-radius:1%;">
			<h5 style="margin-top:1%;margin-left:1%;display:inline-block;">Complaint Closure <span style="font-size:16px;"><%=var%></span></h5>
			<h6 class="closecontent" style="cursor:pointer;color:#97A0B3;float:right;margin-top:1%;margin-right:1%;"><i class="fa fa-close"></i></h6>
			<hr>
			<table class="table table-bordered table-sm">
				<thead>
					<tr>
						<th style="font-size:12px;">Serial No</th>
						<th style="font-size:12px;">Dated</th>	
						<th style="font-size:12px;">Control No</th>	
						<th style="font-size:12px;">Department</th>
						<th style="font-size:12px;">Complaint Type</th>
						<th style="font-size:12px;">Complaint Subtype</th>	
						<th style="font-size:12px;">Description</th>		
					</tr>
				</thead>
				<tbody>
					<%
						while(rs.next()){
							%>
								<tr>
									<td class="compl_click" style="font-size:12px;color:#012970;font-weight:bold;"><%=rs.getString(1)==null?"":rs.getString(1)%></td>
									<td style="font-size:12px;color:#012970;font-weight:bold;"><%=rs.getString(2)==null?"":rs.getString(2)%></td>
									<td style="font-size:12px;color:#012970;font-weight:bold;"><%=rs.getString(3)==null?"":rs.getString(3)%></td>
									<td style="font-size:12px;color:#012970;font-weight:bold;"><%=rs.getString(4)==null?"":rs.getString(4)%></td>
									<td style="font-size:12px;color:#012970;font-weight:bold;"><%=rs.getString(5)==null?"":rs.getString(5)%></td>
									<td style="font-size:12px;color:#012970;font-weight:bold;"><%=rs.getString(6)==null?"":rs.getString(6)%></td>
									<td style="font-size:12px;color:#012970;font-weight:bold;"><%=rs.getString(7)==null?"":rs.getString(7)%></td>
							    </tr>
							<%
						}
					%>
				</tbody>
			</table>
		</div>
	<%
	conn.close();
%>