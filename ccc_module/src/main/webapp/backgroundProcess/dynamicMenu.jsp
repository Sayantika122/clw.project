<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%!
	Connection conn;
static String url="";
PreparedStatement ps;
ResultSet rs;
String uid,uname,udesig,colony,usertype;
HttpSession hs;
%>
<%
	hs=request.getSession();

  uid=(String)hs.getAttribute("userid");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	//url ="jdbc:oracle:thin:@(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST =10.43.10.5)(PORT = 1521))    )    (CONNECT_DATA =      (SERVICE_NAME = CLWFMIS)    )  )";
	//conn=DriverManager.getConnection(url,"accounts","accounts");
	
	conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","clw","clw"); 
	
	
	ps=conn.prepareStatement("select department,user_type from ccc_users where control_number=?");
	ps.setString(1, uid);
	rs=ps.executeQuery();
	while(rs.next()){
		usertype=rs.getString(2);
		hs.setAttribute("usertype", usertype);
	}
	conn.close();
	
	
		if(usertype.equals("U")){
			%>
				<ul class="sidebar-nav" id="sidebar-nav">
					<li class="nav-item">
						<a class="nav-link collapsed position-relative" data-bs-target="#home-nav" data-bs-toggle="collapse" href="#">
							<i class="fa fa-tachometer" aria-hidden="true"></i><span>&nbsp;&nbsp;Dashboard</span><i class="fa fa-angle-down position-absolute end-0" aria-hidden="true"></i>
						</a>
						<ul id="home-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
							<li>
								<a href="home.jsp">
									<i class="fa fa-circle-o" aria-hidden="true"></i><span>&nbsp;&nbsp;Pending Status</span>
								</a>
							</li>
						</ul>
					</li>
					
					<li class="nav-item">
						<a class="nav-link collapsed position-relative" data-bs-target="#transaction-nav" data-bs-toggle="collapse" href="#">
							<i class="fa fa-leanpub" aria-hidden="true"></i><span>&nbsp;&nbsp;Complaints</span><i class="fa fa-angle-down position-absolute end-0" aria-hidden="true"></i>
						</a>
						<ul id="transaction-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
							<li>
								<a href="regComplaint.jsp">
									<i class="fa fa-circle-o" aria-hidden="true"></i><span>&nbsp;&nbsp;Register Complaints</span>
								</a>
							</li>
							
						</ul>
					</li>
					
					

					<li class="nav-item">
						<a class="nav-link collapsed position-relative" data-bs-target="#accounts-nav" data-bs-toggle="collapse" href="#">
							<i class="fa fa-question-circle-o" aria-hidden="true"></i><span>&nbsp;&nbsp;Help</span><i class="fa fa-angle-down position-absolute end-0" aria-hidden="true"></i>
						</a>
						<ul id="accounts-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
							<li class="userguide">
								<a href="#">
									<i class="fa fa-circle-o" aria-hidden="true"></i><span>&nbsp;&nbsp;Download User Guide</span>
								</a>
							</li>
						</ul>
					</li>
				</ul>
			<%
		}else if(usertype.equals("A")){
			%>
				<ul class="sidebar-nav" id="sidebar-nav">
					<li class="nav-item">
						<a class="nav-link collapsed position-relative" data-bs-target="#home-nav" data-bs-toggle="collapse" href="#">
							<i class="fa fa-tachometer" aria-hidden="true"></i><span>&nbsp;&nbsp;Dashboard</span><i class="fa fa-angle-down position-absolute end-0" aria-hidden="true"></i>
						</a>
						<ul id="home-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
							<li>
								<a href="home.jsp">
									<i class="fa fa-circle-o" aria-hidden="true"></i><span>&nbsp;&nbsp;Pending Status</span>
								</a>
							</li>
						</ul>
					</li>
					
					<li class="nav-item">
						<a class="nav-link collapsed position-relative" data-bs-target="#inventory-nav" data-bs-toggle="collapse" href="#">
							<i class="fa fa-database" aria-hidden="true"></i><span>&nbsp;&nbsp;Inventory</span><i class="fa fa-angle-down position-absolute end-0" aria-hidden="true"></i>
						</a>
						<ul id="inventory-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
							
							<li>
								<a href="addInventory.jsp">
									<i class="fa fa-circle-o" aria-hidden="true"></i><span>&nbsp;&nbsp;Add Inventory</span>
								</a>
							</li>
							
						</ul>
					</li>
					
					<li class="nav-item">
						<a class="nav-link collapsed position-relative" data-bs-target="#transaction-nav" data-bs-toggle="collapse" href="#">
							<i class="fa fa-leanpub" aria-hidden="true"></i><span>&nbsp;&nbsp;Complaints</span><i class="fa fa-angle-down position-absolute end-0" aria-hidden="true"></i>
						</a>
						<ul id="transaction-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
							
							<li>
								<a href="regComplaint.jsp">
									<i class="fa fa-circle-o" aria-hidden="true"></i><span>&nbsp;&nbsp;Register Complaints</span>
								</a>
							</li>
							<li>
								<a href="closeComplaint.jsp">
									<i class="fa fa-circle-o" aria-hidden="true"></i><span>&nbsp;&nbsp;Complaint Closure</span>
								</a>
							</li>
						</ul>
					</li>

					<li class="nav-item">
						<a class="nav-link collapsed position-relative" data-bs-target="#accounts-nav" data-bs-toggle="collapse" href="#">
							<i class="fa fa-question-circle-o" aria-hidden="true"></i><span>&nbsp;&nbsp;Help</span><i class="fa fa-angle-down position-absolute end-0" aria-hidden="true"></i>
						</a>
						<ul id="accounts-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
							<li class="userguide">
								<a href="#">
									<i class="fa fa-circle-o" aria-hidden="true"></i><span>&nbsp;&nbsp;Download User Guide</span>
								</a>
							</li>
						</ul>
					</li>
				</ul>
			<%
		}
	
%>

