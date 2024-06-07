<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%!
	Connection conn;
static String url="";
PreparedStatement ps;
ResultSet rs;
String uid,pc,prnt,sw,lan,colsession,utypesession;
HttpSession hs;
%>
<%
	hs=request.getSession();
	uid=(String)hs.getAttribute("userid");

	//url="jdbc:oracle:thin:@(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST =10.43.10.5)(PORT = 1521))    )    (CONNECT_DATA =      (SERVICE_NAME = CLWFMIS)    )  )";
	//conn=DriverManager.getConnection(url,"accounts","accounts");
	
	conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","clw","clw");
	
	
	ps=conn.prepareStatement("select count(*) from ccc_complaints where status='P' and complaint_type='PC_Problem'");
	rs=ps.executeQuery();
	while(rs.next()){
		pc=rs.getString(1);
	}
	ps=conn.prepareStatement("select count(*) from ccc_complaints where status='P' and complaint_type='Printer_Problem'");
	rs=ps.executeQuery();
	while(rs.next()){
		prnt=rs.getString(1);
	}
	ps=conn.prepareStatement("select count(*) from ccc_complaints where status='P' and complaint_type='Software_Problem'");
	rs=ps.executeQuery();
	while(rs.next()){
		sw=rs.getString(1);
	}
	ps=conn.prepareStatement("select count(*) from ccc_complaints where status='P' and complaint_type='LAN_Problem'");
	rs=ps.executeQuery();
	while(rs.next()){
	   lan=rs.getString(1);
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Computer||Complaints</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
	
	 <!-- Google Fonts -->
  		<link href="https://fonts.gstatic.com" rel="preconnect">
  		<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
	
	<link rel="stylesheet" type="text/css" href="cssFiles/myStyle.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script type="text/javascript" src="jsFiles/myScript.js"></script>
</head>
<body class="d-flex flex-column min-vh-100">
	<header class="header" >
		<nav class="navbar fixed-top">
			<div class="container-fluid">
				<a href="#" class="navbar-brand fw-bold">
					<img src="imageFiles/IRlogo.png" style="width:55px;height:50px;padding:0;margin:0;">
					CCC
				</a>
				<span class="toggle-sidebar-btn"><i class="fa fa-bars" aria-hidden="true"></i></span>
				<h4 class="mx-auto">Chittaranjan Locomotive Works</h4>
				<div class="logininfo">
				
				</div>
			</div>
		</nav>
	</header>
	<aside class="sidebar" id="sidebar">
		
	</aside>
	
	<main class="main" id="main">
		<div class="pagetitle">
			<h1>Pending Status</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">Dashboard</li>
					<li class="breadcrumb-item active">Pending Status</li>
				</ol>
			</nav>
		</div>
		<div class="pagecontent">
			<div class="row mt-3 mb-2">
				<div class="col-md-3 colClass" style="background-color: #F39C11;">
					<h1 style="display:inline-block;color:#FDDDAE;"><%=pc%></h1>
					<h1 style="color:#FDDDAE;;float: right;margin-right: 3%;font-size: 4em;"><i class="fa fa-desktop" aria-hidden="true"></i></h1>
					<h6 style="color:#FDDDAE;">PC Issue</h6>
					<h6 id="more_c1" style="margin-top:8%;margin-bottom:0;margin-left:0;padding:2%;text-align: center;background-color: #f9ce88;color:white;">More Info <i class="fa fa-arrow-circle-right"></i></h6>
				</div>
				<div class="col-md-3 colClass"  style="background-color: #3598DB;">
					<h1 style="display:inline-block;color:#B8DAF3;"><%=prnt%></h1>
					<h1 style="color:#B8DAF3;float: right;margin-right: 3%;font-size: 4em;"><i class="fa fa-print" aria-hidden="true"></i></h1>
					<h6 style="color:#B8DAF3;">Printer Issue</h6>
					<h6 id="more_c2" style="margin-top:8%;margin-bottom:0;margin-left:0;padding:2%;text-align: center;background-color: #9bcbeb;color:white;">More Info <i class="fa fa-arrow-circle-right"></i></h6>
				</div>
				<div class="col-md-3 colClass"  style="background-color: #E84C3D;">
					<h1 style="display:inline-block;color:#F5C0BA;"><%=sw%></h1>
					<h1 style="color:#F5C0BA;float: right;margin-right: 3%;font-size: 4em;"><i class="fa fa-cogs" aria-hidden="true"></i></h1>
					<h6 style="color:#F5C0BA;">Software Issue</h6>
					<h6 id="more_c3" style="margin-top:8%;margin-bottom:0;margin-left:0;padding:2%;text-align: center;background-color: #f4a59d;color:white;">More Info <i class="fa fa-arrow-circle-right"></i></h6>
				</div>
				<div class="col-md-3 colClass"  style="background-color: #1BBC9B;">
					<h1 style="display:inline-block;color:#8ddecd;"><%=lan%></h1>
					<h1 style="color:#8ddecd;float: right;margin-right: 3%;font-size: 4em;"><i class="fa fa-wifi" aria-hidden="true"></i></h1>
					<h6 style="color:#8ddecd;">LAN Issue</h6>
					<h6 id="more_c4" style="margin-top:8%;margin-bottom:0;margin-left:0;padding:2%;text-align: center;background-color:#8ddecd ;color:white;">More Info <i class="fa fa-arrow-circle-right"></i></h6>
				</div>
			</div>
			<div id="fill-content">
			
			</div>
		</div>
		
	</main>
	
	<footer id="footer" class="footer mt-auto">
	    <div class="copyright">
	      &copy; Copyright <strong><span>IT CENTER CLW/CRJ</span></strong>. All Rights Reserved
	    </div>
	    <div class="credits">
	      Designed by <span style="color:#2979FF;">IT CENTER CLW/CRJ</span>
	    </div>
  </footer>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>