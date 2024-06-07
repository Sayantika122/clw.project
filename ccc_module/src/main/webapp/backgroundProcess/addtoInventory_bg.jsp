<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%!
	String url, uid,item_type,model_number,serial_number,jsonresponse;
	Connection conn;
	PreparedStatement ps,pstemp;
	ResultSet rs,rstemp;
	HttpSession hs;
%>
<%
hs=request.getSession();
uid=(String)hs.getAttribute("userid");
item_type=request.getParameter("item_type");
model_number=request.getParameter("model_number");
serial_number=request.getParameter("serial_number");

	//url="jdbc:oracle:thin:@(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST =10.43.10.5)(PORT = 1521))    )    (CONNECT_DATA =      (SERVICE_NAME = CLWFMIS)    )  )";
	//conn=DriverManager.getConnection(url,"accounts","accounts");
	
   conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","clw","clw");
	
	ps=conn.prepareStatement("insert into ccc_inventory(item_type,model_no,serial_no,consumed) values(?,?,?,'N')");
	ps.setString(1, item_type);
	ps.setString(2, model_number);
	ps.setString(3, serial_number);
	
	
	ps.executeUpdate();

	conn.close();
%>    
    
    <tr>
									<td style="font-size:12px;color:#357A38;font-weight:bold;"><%=item_type==null?"":item_type%></td>
									<td style="font-size:12px;color:#357A38;font-weight:bold;"><%=model_number==null?"":model_number%></td>
									<td style="font-size:12px;color:#357A38;font-weight:bold;"><%=serial_number==null?"":serial_number%></td>
									<td style="font-size:12px;color:#357A38;font-weight:bold;">Y</td>
									<td style="font-size:12px;color:#357A38;font-weight:bold;"></td>
									<td style="font-size:12px;color:#357A38;font-weight:bold;"></td>
									
			   </tr>
	<%
		if(item_type.equals("MotherBoard")){
			%>
				<script>
					$("#IA1").text(parseInt($("#IA1").text())+1);
					$("#IT1").text(parseInt($("#IT1").text())+1);
				</script>
			<%
		}else if(item_type.equals("Processor")){
			%>
				<script>
					$("#IA2").text(parseInt($("#IA2").text())+1);
					$("#IT2").text(parseInt($("#IT2").text())+1);
				</script>
			<%
		}else if(item_type.equals("RAM")){
			%>
				<script>
					$("#IA3").text(parseInt($("#IA3").text())+1);
					$("#IT3").text(parseInt($("#IT3").text())+1);
				</script>
			<%
		}
	%>
