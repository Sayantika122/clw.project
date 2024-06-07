<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Computer||Complaints</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
	<link rel="stylesheet" type="text/css" href="cssFiles/myStyle.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hedvig+Letters+Serif:opsz@12..24&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script type="text/javascript" src="jsFiles/myScript.js"></script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="leftsection col-md-7">
				<div class="row align-items-center">
					<div class="col-md-2 text-center">
						<img src="imageFiles/IRlogo1.png" style="max-width: 100px;max-height: 100px;">
					</div>
					<div class="col-md-8">
						<h4 class="text-center" style="font-family: 'Hedvig Letters Serif', serif;">CHITTARANJAN &nbsp;LOCOMOTIVE &nbsp;WORKS</h4>
					</div>

				</div>
				

			</div>
			<div class="rightsection col-md-5">
				<br><br>
				<h4 class="text-center" style="color: #012970;">PC/PERIPHERAL &nbsp;SUPPORT</h4><br>
				<h5 class="text-center" style="color: #012970;">LOGIN</h5>
				<h6 class="text-center" style="color: #012970;">Please Sign-In to start your session</h6>
				<br><br>
				<form id="loginForm" >
					<div class="row mb-4">
						<div class="col-sm-3 text-end">
							<label for="uid" class="col-form-label"><i class="bi bi-person-fill"></i>&nbsp;User ID</label>
						</div>
						<div class="col-sm-6">
							<input class="form-control" type="text" id="uid" placeholder="Enter Control No" required>
						</div>
					</div>
					<div class="row mb-4">
						<div class="col-sm-3 text-end">
							<label for="pwd" class="col-form-label"><i class="bi bi-lock-fill"></i>&nbsp;Password</label>
						</div>
						<div class="col-sm-6">
							<input class="form-control" type="password" id="pwd" placeholder="Enter Password" required>
						</div>
					</div>
					<div class="row mb-4">
						<div class="col-sm-6 offset-sm-3">
							<input class="form-control btn btn-success" type="submit" value="Sign In">
						</div>
					</div>
					<div class="row mb-4">
						<div class="col-sm-6 offset-sm-3">
							<p style="color: #616161;">Not yet registered? <span id="regLink" style="font-weight: bold;cursor: pointer;">Signup</span> here</p>
						</div>
					</div>
					<div class="row mb-4">
						<div class="col-sm-6 offset-sm-3">
							<h6 style="color: #0D47A1;" id="dynamic-msg" class="disp-none text-center"><i class="fa fa-spinner fa-spin"></i> &nbsp;Validating User</h6>
						</div>
					</div>
				</form>
				
			</div>
			<div class="rightsectionReg col-md-5 offset-md-7">
				<br><br>
				<h4 class="text-center" style="color: #012970;">PC/PERIPHERAL &nbsp;SUPPORT</h4><br>
				<h5 class="text-center" style="color: #012970;">REGISTRATION</h5>
				<h6 class="text-center" style="color: #012970;">Please Register to get started</h6>
				<br><br>
					<form id="registerForm">
						<div class="row mb-3">
							<div class="col-sm-4 text-end">
								<label for="cno" class="col-form-label col-form-label-sm"><i class="fa fa-id-card-o" aria-hidden="true"></i>&nbsp;Control No</label>
							</div>
							<div class="col-sm-6">
								<input class="form-control form-control-sm" type="text" id="cno" name="ctrlNo" required>
							</div>
						</div>
						<div class="row mb-3">
							<div class="col-sm-4 text-end">
								<label for="uname" class="col-form-label col-form-label-sm"><i class="fa fa-pencil" aria-hidden="true"></i>&nbsp;Name</label>
							</div>
							<div class="col-sm-6">
								<input class="form-control form-control-sm" type="text" id="uname" name="usrName" required >
							</div>
						</div>
						<div class="row mb-3">
							<div class="col-sm-4 text-end">
								<label for="dept" class="col-form-label col-form-label-sm"><i class="fa fa-building" aria-hidden="true"></i>&nbsp;Department</label>
							</div>
							<div class="col-sm-6">
								<select class="form-select form-select-sm" id="dept" name="deptDdown" required>
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
						<div class="row mb-3">
							<div class="col-sm-4 text-end">
								<label for="mob" class="col-form-label col-form-label-sm"><i class="fa fa-phone" aria-hidden="true"></i>&nbsp;Mobile</label>
							</div>
							<div class="col-sm-6">
								<input class="form-control form-control-sm" type="text" id="mob" name="mobNo" required>
							</div>
						</div>
						<div class="row mb-3">
							<div class="col-sm-4 text-end">
								<label for="pwds" class="col-form-label col-form-label-sm"><i class="bi bi-lock-fill"></i>&nbsp;Password</label>
							</div>
							<div class="col-sm-6">
								<input class="form-control form-control-sm" type="password" id="pwds" name="pwd" required >
							</div>
						</div>
						<div class="row mb-3">
							<div class="col-sm-4 text-end">
								<label for="confpwds" class="col-form-label col-form-label-sm"><i class="bi bi-lock-fill"></i>&nbsp;Confirm Password</label>
							</div>
							<div class="col-sm-6">
								<input class="form-control form-control-sm" type="password" id="confpwds" name="confPwd" required>
							</div>
						</div>
						<div class="row mb-3">
							<div class="col-sm-6 offset-sm-4">
								<input id="regBtn" class="form-control btn btn-primary" type="submit" value="Register">
							</div>
						</div>
						<div class="row mb-3">
							<div class="col-sm-6 offset-sm-4">
								<p style="color: #616161;text-align: center;">Already registered? <span id="logLink" style="font-weight: bold;cursor: pointer;">Login</span></p>
							</div>
						</div>
						<div class="row mb-3">
							<div class="col-sm-6 offset-sm-4">
								<h6 style="color: #0D47A1;" id="dynamic-msg" class="disp-none text-center"><i class="fa fa-spinner fa-spin"></i> &nbsp;Registering User</h6>
							</div>
						</div>
					</form>
			</div>
		</div>
	</div>
<!-- Modal code start -->
				
						<div id="loginModal" class="modal fade" data-bs-backdrop="static" tabindex="-1">
					        <div class="modal-dialog modal-dialog-centered">
					            <div class="modal-content">
					                <div class="modal-header">
					                    <h5 class="modal-title">Message</h5>
					                </div>
					                <div class="modal-body">
					                    <p>Invalid Credentials: User ID/Password</p>
					                </div>
					                <div class="modal-footer">
					                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">OK</button>
					                </div>
					            </div>
					        </div>
					    </div>
				
				<!-- Modal code end -->
<div id="processLoading">
		<img class="ploadimg" src="imageFiles/load_indicator.gif">
</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>