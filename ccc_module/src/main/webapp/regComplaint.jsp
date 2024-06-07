<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%!
	Connection conn;
static String url="";
PreparedStatement psstr,psqtr;
ResultSet rs;
String uid,col,utype,colvar,cno_var,dept_var;
HttpSession hs;
%>
<%
	hs=request.getSession();
	uid=(String)hs.getAttribute("userid");
	
	utype=(String)hs.getAttribute("usertype");

	//url="jdbc:oracle:thin:@(DESCRIPTION = (ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST =10.43.10.5)(PORT = 1521))    )    (CONNECT_DATA =      (SERVICE_NAME = CLWFMIS)    )  )";
	//conn=DriverManager.getConnection(url,"accounts","accounts");
	
	conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","clw","clw");
	
	psstr=conn.prepareStatement("select control_number,department from ccc_users where control_number=?");
	psstr.setString(1, uid);
	rs=psstr.executeQuery();
	while(rs.next()){
		cno_var=rs.getString(1);
		dept_var=rs.getString(2);
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
			<h1>Register Complaints</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">Complaints</li>
					<li class="breadcrumb-item active">Register Complaints</li>
				</ol>
			</nav>   
		</div>
		<div class="pagecontent">
			<!-- 
				PAGE DESIGN STATS			
			 -->
			 <form>
			 	<div class="row mt-2 mb-2">
			 		<div class="col-md-2 text-end">
			 			<label class="col-form-label col-form-label-sm">Sl.no</label>
			 		</div>
			 		<div class="col-md-3">
			 		  <input class="form-control form-control-sm" type= "text" id="S_NO" disabled> 
			 		</div>
			 		<div class="col-md-2 text-end">
			 			<label class="col-form-label col-form-label-sm">Complaint Date</label>
			 		</div>
			 		<div class="col-md-3">
			 		  <input class="form-control form-control-sm" type= "text" id="COMPLAINT_DATE" disabled> 
			 		</div>
			 	</div>
			 	
			 	<%
			 		if(utype.equals("A")){
			 	%>
			 		<div class="row mt-2 mb-2">
			 		<div class="col-md-2 text-end">
			 			<label class="col-form-label col-form-label-sm">Control Number</label>
			 		</div>
			 		<div class="col-md-3">
			 		  <input class="form-control form-control-sm" type= "text" id="CONTROL_NUMBER"> 
			 		</div>
			 		<div class="col-md-2 text-end">
			 			<label class="col-form-label col-form-label-sm">Department</label>
			 		</div>
			 		<div class="col-md-3">
			 		  			<select class="form-select form-select-sm" id="DEPARTMENT">
									<option value="NA">--Select--</option>
									<option value="Accounts">Accounts</option>
									<option value="Stores">Stores</option>
									<option value="Mechanical">Mechanical</option>
									<option value="Electrical">Electrical</option>
									<option value="Medical">Medical</option>
									<option value="RPF">RPF</option>
								</select>
			 		</div>
			 	</div>
			 	<%
			 		}else{
			 	%>
			 		<div class="row mt-2 mb-2">
			 		<div class="col-md-2 text-end">
			 			<label class="col-form-label col-form-label-sm">Control Number</label>
			 		</div>
			 		<div class="col-md-3">
			 		  <input class="form-control form-control-sm" type= "text" id="CONTROL_NUMBER" disabled value="<%=cno_var%>"> 
			 		</div>
			 		<div class="col-md-2 text-end">
			 			<label class="col-form-label col-form-label-sm">Department</label>
			 		</div>
			 		<div class="col-md-3">
			 		  <input class="form-control form-control-sm" type= "text" id="DEPARTMENT" disabled value="<%=dept_var%>"> 
			 		</div>
			 	</div>
			 	<%
			 		}
			 	%>
			 	
			 
	
	      
	           <div class="row mt-2 mb-2">
			 		<div class="col-md-2 text-end">
			 			<label class="col-form-label col-form-label-sm">Complaint Type</label>
			 		</div>
			 		<div class="col-md-3">
			 		  <select class="form-select form-select-sm" id="Complaint_Type" name="Complaint_Type">
									<option value="NA">--Select--</option>
									<option value="PC_Problem">PC Problem</option>
									<option value="Printer_Problem">Printer Problem</option>
									<option value="Software_Problem">Software Problem</option>
									<option value="LAN_Problem">LAN Problem</option>
									</select>
			 		</div>
			 		<div class="col-md-2 text-end">
			 			<label class="col-form-label col-form-label-sm">Complaint Sub-type</label>
			 		</div>
			 		<div class="col-md-3">
			 		  	<select class="form-select form-select-sm" id="Complaint_Subtype" name="Complaint_Subtype">
									<option value="NA">--Select--</option>
									<option value="others">others</option>
								    </select>
			 		</div>
			 	</div>
			 	
			 	
			 	
			 	
			 	<div class="row  mb-2">
			 		<div class="col-md-2 text-end">
			 			<label class="col-form-label col-form-label-sm">Complaint Description</label>
			 		</div>
			 		<div class="col-md-8">
			 		  <textarea class="form-control" id="COMPLAINT_DESC" rows="2"></textarea>
			 		</div>
			 		
			 	</div>
			 	
			 	

				<div class="row  mb-2">
				<div class="col-md-3 offset-md-5">
						<button class="btn btn-success" type="button" id="saveComplaint">Lodge Complaint</button>
				</div>
				<div class="col-md-1 offset-md-3">
						<button type="button" id="clearComplaint" class="btn btn-sm btn-primary" data-bs-toggle="tooltip" data-bs-placement="left" title="Reset Form"><i class="fa fa-refresh"></i></button>
				</div>
			</div>

     </form>
			<!-- Modal start-->
						<div id="saveModal" class="modal fade" data-bs-backdrop="static" tabindex="-1">
					        <div class="modal-dialog modal-dialog-centered">
					            <div class="modal-content">
					                <div class="modal-header">
					                    <h5 class="modal-title">Success</h5>
					                </div>
					                <div class="modal-body">
					                    <p id="modalcid"></p>
					                </div>
					                <div class="modal-footer">
					                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">OK</button>
					                </div>
					            </div>
					        </div>
					    </div>
			<!-- Modal end -->
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
  <div id="processLoading">
		<img class="ploadimg" src="imageFiles/load_indicator.gif">
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>