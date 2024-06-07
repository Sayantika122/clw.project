<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%!
	Connection conn;
static String url="";
PreparedStatement ps;
ResultSet rs;
String uid,uname,ushort,udesig;
HttpSession hs;
%>
<%
	hs=request.getSession();

  uid=(String)hs.getAttribute("userid");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	//url ="jdbc:oracle:thin:@(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST =10.43.10.5)(PORT = 1521))    )    (CONNECT_DATA =      (SERVICE_NAME = CLWFMIS)    )  )";
	//conn=DriverManager.getConnection(url,"accounts","accounts");
	conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","clw","clw"); 
	ps=conn.prepareStatement("select user_name,department,substr(user_name,1,1)||'.'||substr(user_name,instr(user_name,' ')+1) from ccc_users where control_number=? and active_status='A'");
	ps.setString(1, uid);
	rs=ps.executeQuery();
	while(rs.next()){
		uname=rs.getString(1);
		udesig=rs.getString(2);
		ushort=rs.getString(3);
	}
	conn.close();
	
	if(uid.equals("anonymous")){
%>
	<a class="nav-link1 nav-profile d-flex align-items-center pe-0" href="login.jsp">
			<i class="fa fa-sign-in" aria-hidden="true"></i>
           <span class="d-none d-md-block ps-2">Login</span>
    </a>
<%
	}else{
%>
	<a class="nav-link1 nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            		<img src="imageFiles/avatar.png" style="width:40px;height:40px;" alt="Profile" class="rounded-circle">
            		<span class="d-none d-md-block dropdown-toggle ps-2"><%=ushort%></span>
          		</a>
          		<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
		            <li class="dropdown-header">
		              <h6><%=uname%></h6>
		              <span><%=udesig%></span>
		            </li>
		            <li>
		              <hr class="dropdown-divider">
		            </li>
					<li>
		              <a class="dropdown-item d-flex align-items-center" href="changePassword.jsp">
		                <i class="bi bi-gear"></i>
		                <span>Change Password</span>
		              </a>
		            </li>
		            <li>
		              <hr class="dropdown-divider">
		            </li>
					<li class="logout">
		              <a class="dropdown-item d-flex align-items-center" href="#">
		                <i class="bi bi-box-arrow-right"></i>
		                <span>Log Out</span>
		              </a>
		            </li>
		
		          </ul>
<%
	}
%>