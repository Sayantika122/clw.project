<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%!
	Connection conn;
static String url="";
PreparedStatement ps,psdata;
ResultSet rs,rsdata;
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
			<h1>Complaint Closure</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">Complaints</li>
					<li class="breadcrumb-item active">Complaints Closure</li>
				</ol>
			</nav>
		</div>
		<div class="pagecontent">
			<h6 class="mb-4">Basic Categories</h6>
			<div class="row mt-3 mb-2">
				<div class="col-md-2 colClass1 rounded-circle" style="border:2px solid #F39C11;">
					<h1 style="color:#F39C11;margin-top:-15%;font-size: 3em;text-align:center;"><i class="fa fa-desktop" aria-hidden="true"></i></h1>
					<h1 style="color:#F39C11;text-align:center;"><%=pc%> <span class="h6">PC </span><span id="more_c1_closure" style="color:#37474F;" class="h6"><i class="fa fa-eye" aria-hidden="true"></i></span></h1>
					
				</div>
				<div class="col-md-2 offset-md-1 colClass1 rounded-circle" style="border:2px solid #3598DB;">
					<h1 style="color:#3598DB;margin-top:-15%;font-size: 3em;text-align:center;"><i class="fa fa-print" aria-hidden="true"></i></h1>
					<h1 style="color:#3598DB;text-align:center;"><%=prnt%> <span class="h6">Printer </span><span id="more_c2_closure" style="color:#37474F;" class="h6"><i class="fa fa-eye" aria-hidden="true"></i></span></h1>
					
				</div>
				<div class="col-md-2 offset-md-1 colClass1 rounded-circle" style="border:2px solid #E84C3D;">
					<h1 style="color:#E84C3D;margin-top:-15%;font-size: 3em;text-align:center;"><i class="fa fa-cogs" aria-hidden="true"></i></h1>
					<h1 style="color:#E84C3D;text-align:center;"><%=sw%> <span class="h6">Software </span><span id="more_c3_closure" style="color:#37474F;" class="h6"><i class="fa fa-eye" aria-hidden="true"></i></span></h1>
					
				</div>
				<div class="col-md-2 offset-md-1 colClass1 rounded-circle" style="border:2px solid #1BBC9B;">
					<h1 style="color:#1BBC9B;margin-top:-15%;font-size: 3em;text-align:center;"><i class="fa fa-wifi" aria-hidden="true"></i></h1>
					<h1 style="color:#1BBC9B;text-align:center;"><%=lan%> <span class="h6">LAN </span><span id="more_c4_closure" style="color:#37474F;" class="h6"><i class="fa fa-eye" aria-hidden="true"></i></span></h1>
					
				</div>
			</div>
			<div id="fill-content">
			
			</div>
			
			<!-- Modal code start -->
				
						<div id="complaintModal" class="modal fade" data-bs-backdrop="static" tabindex="-1">
					        <div class="modal-dialog modal-xl modal-dialog-centered">
					            <div class="modal-content">
					                <div class="modal-header">
					                    <h5 class="modal-title">Complaint Details</h5>
					                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					                </div>
					                <div class="modal-body">
					                    		
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
			 	
			 	
			 		<div class="row mt-2 mb-2">
			 		<div class="col-md-2 text-end">
			 			<label class="col-form-label col-form-label-sm">Control Number</label>
			 		</div>
			 		<div class="col-md-3">
			 		  <input class="form-control form-control-sm" type= "text" id="CONTROL_NUMBER" disabled> 
			 		</div>
			 		<div class="col-md-2 text-end">
			 			<label class="col-form-label col-form-label-sm">Department</label>
			 		</div>
			 		<div class="col-md-3">
			 		  			<select class="form-select form-select-sm" id="DEPARTMENT" disabled>
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
	           <div class="row mt-2 mb-2">
			 		<div class="col-md-2 text-end">
			 			<label class="col-form-label col-form-label-sm">Complaint Type</label>
			 		</div>
			 		<div class="col-md-3">
			 		  <select class="form-select form-select-sm" id="Complaint_Type" name="Complaint_Type" disabled>
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
			 		  	<select class="form-select form-select-sm" id="Complaint_Subtype" name="Complaint_Subtype" disabled>
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
			 		  <textarea class="form-control" id="COMPLAINT_DESC" rows="2" disabled></textarea>
			 		</div>
			 		
			 	</div>
			 	
			 	<div class="row mt-2 mb-2">
			 		<div class="col-md-2 text-end">
			 			<label class="col-form-label col-form-label-sm">Tech Deputed</label>
			 		</div>
			 		<div class="col-md-3">
			 		  <input class="form-control form-control-sm" type= "text" id="TECH_DEPUTED" > 
			 		</div>
			 		<div class="col-md-2 text-end">
			 			<label class="col-form-label col-form-label-sm">Incharge</label>
			 		</div>
			 		<div class="col-md-3">
			 		  <input class="form-control form-control-sm" type= "text" id="INCHARGE"> 
			 		</div>
			 	</div>
			 	
			 <div class="row  mb-2">
			 		<div class="col-md-2 text-end">
			 			<label class="col-form-label col-form-label-sm">Remarks</label>
			 		</div>
			 		<div class="col-md-8">
			 		  <textarea class="form-control" id="REMARKS" rows="2"></textarea>
			 		</div>
			 		
			 	</div> 
			 	
			 	
			 	
			 	
			 	<div class="row  mb-2">
			 		<div class="col-md-2 text-end">
			 			<label class="col-form-label col-form-label-sm">Correction Action Taken</label>
			 		</div>
			 		<div class="col-md-8">
			 		  <textarea class="form-control" id="CORRECTION_ACTION_TAKEN" rows="2"></textarea>
			 		</div>
			 		
			 	</div>
			 	<div class="row mb-2 align-items-center">
			 		<div class="col-md-2 text-end">
			 			<label class="col-form-label col-form-label-sm">Equipment Needed</label><br>
			 		</div>
			 		<div class="col-md-3">
			 			<input type="checkbox" id="equipmentRqrd">
			 		</div>
			 	</div>
			 	<div id="fillEquipment">
			 		<div class="row mt-2 mb-2">
			 			<div class="col-md-2 text-end">
				 			<label class="col-form-label col-form-label-sm">MotherBoard</label>
				 		</div>
				 		<div class="col-md-2">
				 		  			<select class="form-select form-select-sm" id="mbFetch">
										<option value="NA">--Select--</option>
										<%
											psdata=conn.prepareStatement("select serial_no from ccc_inventory where consumed='N' and item_type='MotherBoard'");
											rsdata=psdata.executeQuery();
											while(rsdata.next()){
										%>
											<option value="<%=rsdata.getString(1)%>"><%=rsdata.getString(1)%></option>
										<%
											}
										%>
									</select>
				 		</div>
				 		<div class="col-md-1 text-end">
				 			<label class="col-form-label col-form-label-sm">Processor</label>
				 		</div>
				 		<div class="col-md-2">
				 		  			<select class="form-select form-select-sm" id="prcFetch">
										<option value="NA">--Select--</option>
										<%
											psdata=conn.prepareStatement("select serial_no from ccc_inventory where consumed='N' and item_type='Processor'");
											rsdata=psdata.executeQuery();
											while(rsdata.next()){
										%>
											<option value="<%=rsdata.getString(1)%>"><%=rsdata.getString(1)%></option>
										<%
											}
										%>
									</select>
				 		</div>
				 		<div class="col-md-1 text-end">
				 			<label class="col-form-label col-form-label-sm">RAM</label>
				 		</div>
				 		<div class="col-md-2">
				 		  			<select class="form-select form-select-sm" id="ramFetch">
										<option value="NA">--Select--</option>
										<%
											psdata=conn.prepareStatement("select serial_no from ccc_inventory where consumed='N' and item_type='Ram'");
											rsdata=psdata.executeQuery();
											while(rsdata.next()){
										%>
											<option value="<%=rsdata.getString(1)%>"><%=rsdata.getString(1)%></option>
										<%
											}
										%>
									</select>
				 		</div>
			 		</div>
			 		<div class="row mt-2 mb-2">
			 			<div class="col-md-2 text-end">
				 			<label class="col-form-label col-form-label-sm">Placed in CPU Slno.</label>
				 		</div>
				 		<div class="col-md-2">
				 		  			<input type="text" class="form-control form-control-sm" id="cpuPlaced">
				 		</div>
				 		<div class="col-md-1 text-end">
				 			<label class="col-form-label col-form-label-sm">Despatched</label>
				 		</div>
				 		<div class="col-md-2">
				 		  			<input type="text" class="form-control form-control-sm" id="despDate" placeholder="DD/MM/YYYY">
				 		</div>
			 		</div>
			 	</div>
			 	
			 	<div class="row  mb-2">
				<div class="col-md-3 offset-md-5">
						<button class="btn btn-success" type="button" id="closeComplaint">Close Complaint</button>
				</div>
				<div class="col-md-1 offset-md-3">
						<button type="button" id="clearComplaint" class="btn btn-sm btn-primary" data-bs-toggle="tooltip" data-bs-placement="left" title="Reset Form"><i class="fa fa-refresh"></i></button>
				</div>
			</div>

     </form>
										    
					                </div>
					                
					            </div>
					        </div>
					    </div>
				
				<!-- Modal code end -->
			
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