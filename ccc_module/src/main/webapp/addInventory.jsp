<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%!
	Connection conn;
static String url="";
PreparedStatement psstr,psqtr,ps;
ResultSet rs,rs1;
String uid,col,utype,colvar,cno_var,dept_var,motherBoard_avail,motherBoard_tot,processor_avail,processor_tot,ram_avail,ram_tot;
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
	
	 ps=conn.prepareStatement("select count(*) from ccc_inventory where item_type='MotherBoard' and consumed='N'");
	 rs1=ps.executeQuery();
	 while(rs1.next()){
		 motherBoard_avail=rs1.getString(1);
	 }
	 ps=conn.prepareStatement("select count(*) from ccc_inventory where item_type='MotherBoard'");
	 rs1=ps.executeQuery();
	 while(rs1.next()){
		 motherBoard_tot=rs1.getString(1);
	 }
	 
	 ps=conn.prepareStatement("select count(*) from ccc_inventory where item_type='Processor' and consumed='N'");
	 rs1=ps.executeQuery();
	 while(rs1.next()){
		 processor_avail=rs1.getString(1);
	 }
	 ps=conn.prepareStatement("select count(*) from ccc_inventory where item_type='Processor'");
	 rs1=ps.executeQuery();
	 while(rs1.next()){
		 processor_tot=rs1.getString(1);
	 }
	 
	 ps=conn.prepareStatement("select count(*) from ccc_inventory where item_type='Ram' and consumed='N'");
	 rs1=ps.executeQuery();
	 while(rs1.next()){
		 ram_avail=rs1.getString(1);
	 }
	 ps=conn.prepareStatement("select count(*) from ccc_inventory where item_type='Ram'");
	 rs1=ps.executeQuery();
	 while(rs1.next()){
		 ram_tot=rs1.getString(1);
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
			<h1>Add Inventory</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">Inventory</li>
					<li class="breadcrumb-item active">Add Inventory</li>
				</ol>
			</nav>   
		</div>
		<div class="pagecontent">
			<!-- 
				PAGE DESIGN STATS			
			 -->
			 <h6 class="mb-4">Available Resources</h6>
			 <div class="row  mb-3">
				<div class="col-md-3 " style="border:2px solid #455A64;border-radius:10px;">
					<h5 style="color:#455A64;text-align:center;">MotherBoard</h5>
					<h6 style="color:#455A64;text-align:center;"><span id="IA1"><%=motherBoard_avail%></span> of <span id="IT1"><%=motherBoard_tot%></span> available <span id="more_inv_mb" style="color:#37474F;" ><i class="fa fa-eye" aria-hidden="true"></i></span></h6>
					
				</div>
				<div class="col-md-3 offset-md-1 " style="border:2px solid #455A64;border-radius:10px;">
					<h5 style="color:#455A64;text-align:center;">Processor</h5>
					<h6 style="color:#455A64;text-align:center;"><span id="IA2"><%=processor_avail%></span> of <span id="IT2"><%=processor_tot%></span> available <span id="more_inv_prc" style="color:#37474F;" ><i class="fa fa-eye" aria-hidden="true"></i></span></h6>
					
				</div>
				<div class="col-md-3 offset-md-1 " style="border:2px solid #455A64;border-radius:10px;">
					<h5 style="color:#455A64;text-align:center;">RAM</h5>
					<h6 style="color:#455A64;text-align:center;"><span id="IA3"><%=ram_avail%></span> of <span id="IT3"><%=ram_tot%></span> available <span id="more_inv_ram" style="color:#37474F;" ><i class="fa fa-eye" aria-hidden="true"></i></span></h6>
					
				</div>
				
			</div>
			 <div id="fill-content">
			
			</div>
			 
			 <form>
			 	<div class="row  mb-2 mt-2">
			 		<div class="col-md-2 text-end">
			 			<label class="col-form-label">Item Type</label>
			 		</div>
			 		<div class="col-md-5">
			 		  				<select class="form-select" id="itemType" >
										<option value="NA">--Select--</option>
										<option value="MotherBoard">MotherBoard</option>
										<option value="Processor">Processor</option>
										<option value="Ram">Ram</option>
									</select>
			 		</div>
			 	</div>
				<div class="row  mb-2 mt-2">
			 		<div class="col-md-2 text-end">
			 			<label class="col-form-label">Model Number</label>
			 		</div>
			 		<div class="col-md-5">
			 		  		<input type="text" id="modelNo" class="form-control">
			 		</div>
			 	</div>
			 	<div class="row  mb-2 mt-2">
			 		<div class="col-md-2 text-end">
			 			<label class="col-form-label">Serial Number</label>
			 		</div>
			 		<div class="col-md-5">
			 		  		<input type="text" id="serialNo" class="form-control">
			 		</div>
			 	</div>
				<div class="row  mt-2 mb-2">
					<div class="col-md-3 offset-md-4">
							<button class="btn btn-success" type="button" id="addInv">Add Inventory</button>
					</div>
					<div class="col-md-1">
							<button type="button" id="add_inventory" class="btn btn-sm btn-primary" data-bs-toggle="tooltip" data-bs-placement="left" title="Reset Form"><i class="fa fa-refresh"></i></button>
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