<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%!
	String url, uid,show_type,var;
	Connection conn;
	PreparedStatement ps,pstemp;
	ResultSet rs,rstemp;
	HttpSession hs;
%>
<%
hs=request.getSession();
uid=(String)hs.getAttribute("userid");
show_type=request.getParameter("show_type");

	//url="jdbc:oracle:thin:@(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST =10.43.10.5)(PORT = 1521))    )    (CONNECT_DATA =      (SERVICE_NAME = CLWFMIS)    )  )";
	//conn=DriverManager.getConnection(url,"accounts","accounts");
	conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","clw","clw");
	
	
	if(show_type.equals("MB")){
		var="MotherBoard";
	}else if(show_type.equals("PRC")){
		var="Processor";
	}else if(show_type.equals("RAM")){
		var="Ram";
	}
	
	ps=conn.prepareStatement("select item_type,model_no,A.serial_no,consumed,s_no,placed_in_cpu_serial from ccc_inventory A left outer join ccc_equipment_usage B on A.serial_no=B.serial_no where item_type=? order by A.serial_no");
	ps.setString(1, var);
	rs=ps.executeQuery();
	%>
		<div style="margin-top:2%;border-top:3px solid #97A0B3;border-radius:1%;">
			<h5 style="margin-top:1%;margin-left:1%;display:inline-block;">Inventory <span style="font-size:16px;"><%=var%></span></h5>
			<h6 class="closecontent" style="cursor:pointer;color:#97A0B3;float:right;margin-top:1%;margin-right:1%;"><i class="fa fa-close"></i></h6>
			<hr>
			<table class="table table-bordered table-sm">
				<thead>
					<tr>
						<th style="font-size:12px;">Item type</th>
						<th style="font-size:12px;">Model#</th>	
						<th style="font-size:12px;">Serial#</th>	
						<th style="font-size:12px;">Available</th>
						<th style="font-size:12px;">Placed in CPU Serial#</th>
						<th style="font-size:12px;">Vide Complaint#</th>	
							
					</tr>
				</thead>
				<tbody id="dynamic_inventory">
				<%
				while(rs.next()){
					
					if(rs.getString(4).equals("Y"))
					{				
				%>
				<tr>
									<td style="font-size:12px;color:#AA2E25;font-weight:bold;"><%=rs.getString(1)==null?"":rs.getString(1)%></td>
									<td style="font-size:12px;color:#AA2E25;font-weight:bold;"><%=rs.getString(2)==null?"":rs.getString(2)%></td>
									<td style="font-size:12px;color:#AA2E25;font-weight:bold;"><%=rs.getString(3)==null?"":rs.getString(3)%></td>
									<td style="font-size:12px;color:#AA2E25;font-weight:bold;"><%=rs.getString(4)==null?"":rs.getString(4)%></td>
									<td style="font-size:12px;color:#AA2E25;font-weight:bold;"><%=rs.getString(5)==null?"":rs.getString(5)%></td>
									<td style="font-size:12px;color:#AA2E25;font-weight:bold;"><%=rs.getString(6)==null?"":rs.getString(6)%></td>
									
			   </tr>
			   <%
					}
			   else
			   {
			   %>
			   <tr>
									<td style="font-size:12px;color:#357A38;font-weight:bold;"><%=rs.getString(1)==null?"":rs.getString(1)%></td>
									<td style="font-size:12px;color:#357A38;font-weight:bold;"><%=rs.getString(2)==null?"":rs.getString(2)%></td>
									<td style="font-size:12px;color:#357A38;font-weight:bold;"><%=rs.getString(3)==null?"":rs.getString(3)%></td>
									<td style="font-size:12px;color:#357A38;font-weight:bold;"><%=rs.getString(4)==null?"":rs.getString(4)%></td>
									<td style="font-size:12px;color:#357A38;font-weight:bold;"><%=rs.getString(5)==null?"":rs.getString(5)%></td>
									<td style="font-size:12px;color:#357A38;font-weight:bold;"><%=rs.getString(6)==null?"":rs.getString(6)%></td>
									
			    </tr>
			    <%
			   }
				}
			    %>
				
				</tbody>
			</table>
		</div>
	<%
	conn.close();
%> 
