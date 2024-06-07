/*
	Please Provide proper comments in related sections
	and keep it documented so that its easy for de-bugging
	
	
	Tags in tables for reference
	[CMS_COMPLAIN_REG]
		COMP_STAT=UP under process
				  FW forwarded with userid
				  AK to be acknowledged
				  S acknowledged
	[CMS_COMPLAIN_THREAD]
		RMK_STAT=FW forwarded
				 SN solved but not acknowledged
				 SA solved and acknowledged
*/

$(document).ready(function(){

	var toggler=1;
	$(".toggle-sidebar-btn").click(function(){
		if(toggler==1){
			$(this).css({"margin-left":"0"});
			$("#sidebar").css({"width":"0","padding":"0"});
			$("#main").css({"margin-left":"0"});
			$("#footer").css({"margin-left":"0"});
			toggler=2;
		}else{
			$(this).css({"margin-left":"105px"});
			$("#sidebar").css({"width":"300px","padding":"20px"});
			$("#main").css({"margin-left":"300px"});
			$("#footer").css({"margin-left":"300px"});
			toggler=1;
		}
	});
	
	var todaydate = new Date();
   var day = ("0" + todaydate.getDate()).slice(-2);
   var month = todaydate.toLocaleString('default', { month: 'short' });//todaydate.getMonth() + 1;
   var year = todaydate.getFullYear();
   var datestring = day + "-" + month + "-" + year;
   	$("#invDate").val(datestring);
	
	// Tooltip
	$('[data-bs-toggle="tooltip"]').tooltip();
	
	// Disable Back
	function disableBack(){window.history.forward()}
	window.onload=disableBack();
	window.onpageshow=function(evt){if(evt.persisted) disableBack()}
	
	// Menu Loading [for all pages under webPages]
	$("#sidebar").load("backgroundProcess/dynamicMenu.jsp");
	
	// Login Info Loding
	$(".logininfo").load("backgroundProcess/dynamicLogin.jsp");
	
	
	

		
		$("#regLink").click(function(){
		$(".rightsection").css({"animation-name":"flipright"});
		$(".rightsectionReg").css({"animation-name":"flipleft"});
	});
		$("#logLink").click(function(){
			$(".rightsection").css({"animation-name":"fliprightrev"});
			$(".rightsectionReg").css({"animation-name":"flipleftrev"});
		});
	
		$("#regBtn").click(function(event){
			event.preventDefault();
			
			if($("#pwds").val()!=$("#confpwds").val()){
				alert("Password and confirm password mismatched");
			}
			else{
				$("<div id='overlay'></div>").appendTo("body").animate({opacity:'0.6'},"slow");
				$("#processLoading").fadeIn("slow");
					
				setTimeout(function(){
					$.ajax({
							cache:false,
							async:false,
		 					url:"backgroundProcess/userRegistration_bg.jsp",
		 					type:"post",
		 					data:{	ctrlNo:$("#cno").val(),
		 							usrName:$("#uname").val(),
		 							deptDdown:$("#dept").val(),
		 							mobNo:$("#mob").val(),
		 							pwd:$("#pwds").val()
		 						},
		 					success:function(){
		 						alert("User registered successfully !");
		 					},
		 					error:function(request,status,error){
		 						alert(request.responseText);
		 					}
		 				});
	 				
	 				$("#processLoading").fadeOut("slow");
						$("#overlay").animate({opacity:'0'},"slow",function(){
							$(this).remove();
						});
				},2000);
		}
		});
		
		$("#saveComplaint").click(function(event){
			event.preventDefault();
			var jsonText;
			$("<div id='overlay'></div>").appendTo("body").animate({opacity:'0.6'},"slow");
				$("#processLoading").fadeIn("slow");
			setTimeout(function(){
					$.ajax({
							cache:false,
							async:false,
		 					url:"backgroundProcess/regComplaint_bg.jsp",
		 					type:"post",
		 					data:{	control_number:$("#CONTROL_NUMBER").val(),
		 						department:$("#DEPARTMENT").val(),
		 						complaint_type:$("#Complaint_Type").val(),
		 						complaint_subtype:$("#Complaint_Subtype").val(),
		 						complaint_desc:$("#COMPLAINT_DESC").val(),
		 						remarks:$("#REMARKS").val()
		 							
		 						},
		 					success:function(data){
								 jsonText=JSON.parse(data);
								 $("#S_NO").val(jsonText.slno);
								 $("#COMPLAINT_DATE").val(jsonText.dt);
		 						$("#saveModal").modal("show");
								$("#modalcid").text("Complaint Received successfully with no: "+jsonText.slno);
								$("#saveComplaint").prop("disabled", true);
		 					},
		 					error:function(request,status,error){
		 						alert(request.responseText);
		 					}
		 				});
	 				
	 				$("#processLoading").fadeOut("slow");
						$("#overlay").animate({opacity:'0'},"slow",function(){
							$(this).remove();
						});
				},2000);
		});
	

	
	// Login Validation Script
	$("#loginForm").submit(function(event){
				event.preventDefault();
				var jsonText;
				$("#dynamic-msg").removeClass("disp-none");
				$("#dynamic-msg").addClass("disp-block");
			setTimeout(function(){
 				$.ajax({
					cache:false,
					async:false,
 					url:"backgroundProcess/loginValidate.jsp",
 					type:"post",
 					data:{	uid:$("#uid").val(),
 							pwd:$("#pwd").val()},
 					success:function(data){
 						jsonText=JSON.parse(data);
 						if(jsonText.cnt.valueOf()==0){
 							$("#loginModal").modal("show");
 						}else{
 								window.location ="home.jsp";
 						}
 					},
 					error:function(request,status,error){
 						alert(request.responseText);
 					}
 				});
 				$("#dynamic-msg").removeClass("disp-block");
				$("#dynamic-msg").addClass("disp-none");
			},2000);
			});	
			
			// Change password script
	$("#chgpws").click(function(event){
		event.preventDefault();	
		$("#dynamic-msg").removeClass("disp-none");
		$("#dynamic-msg").addClass("disp-block");
	setTimeout(function(){
		$.ajax({
			cache:false,
			async:false,
			url:"../backgroundProcess/changePassword_bg.jsp",
			type:"post",
			data:{
				opwd:$("#chgpass_opwd").val(),
				npwd:$("#chgpass_npwd").val(),
				cpwd:$("#chgpass_cpwd").val()
			},
			success:function(data){
				var myobj=JSON.parse(data);
				if(myobj.cnt.valueOf()==0){
					alert("Incorrect Old Password..");
				}
				else if(myobj.cnt.valueOf()==2){
					alert("New Password and Confirm Password Mismatch..");
				}
				else if(myobj.cnt.valueOf()==1){
					alert("Password Changed Successfully..");
					window.location = "../webPages/home.jsp";
				}
				
			}
		});
			$("#dynamic-msg").removeClass("disp-block");
			$("#dynamic-msg").addClass("disp-none");
		},2000);
	});
	
//logout action
	$(document).on("click",".logout",function(event){
		event.preventDefault();
		$.ajax({
			url:"backgroundProcess/logout.jsp",
			type:"post",
			success:function(){
				alert("Logging Off !");
				window.location="index.jsp";
			}
		});
	});
	
	$("#more_c1").click(function(event){
		event.preventDefault();
		
		$.ajax({
				url:"backgroundProcess/fillContentDashLanding.jsp",
				type:"post",
				data:{	
						show_type:'C1'
						},
				success:function(data){
					$("#fill-content").html(data);
				},
				error:function(request,status,error){
					alert(request.responseText);
				}
			});
	});	
	$("#more_c2").click(function(event){
		event.preventDefault();
		
		$.ajax({
				url:"backgroundProcess/fillContentDashLanding.jsp",
				type:"post",
				data:{	
						show_type:'C2'
						},
				success:function(data){
					$("#fill-content").html(data);
				},
				error:function(request,status,error){
					alert(request.responseText);
				}
			});
	});	
	$("#more_c3").click(function(event){
		event.preventDefault();
		
		$.ajax({
				url:"backgroundProcess/fillContentDashLanding.jsp",
				type:"post",
				data:{	
						show_type:'C3'
						},
				success:function(data){
					$("#fill-content").html(data);
				},
				error:function(request,status,error){
					alert(request.responseText);
				}
			});
	});	
	$("#more_c4").click(function(event){
		event.preventDefault();
		
		$.ajax({
				url:"backgroundProcess/fillContentDashLanding.jsp",
				type:"post",
				data:{	
						show_type:'C4'
						},
				success:function(data){
					$("#fill-content").html(data);
				},
				error:function(request,status,error){
					alert(request.responseText);
				}
			});
	});	
	
	// close content
		$(document).on('click','.closecontent',function(){
			$(this).parent().remove();
		});
		
 $("#more_c1_closure").click(function(event){
		event.preventDefault();
		
		$.ajax({
				url:"backgroundProcess/fillcontentclosureAdmin.jsp",
				type:"post",
				data:{	
						show_type:'C1'
						},
				success:function(data){
					$("#fill-content").html(data);
				},
				error:function(request,status,error){
					alert(request.responseText);
				}
			});
	});	
	$("#more_c2_closure").click(function(event){
		event.preventDefault();
		
		$.ajax({
				url:"backgroundProcess/fillcontentclosureAdmin.jsp",
				type:"post",
				data:{	
						show_type:'C2'
						},
				success:function(data){
					$("#fill-content").html(data);
				},
				error:function(request,status,error){
					alert(request.responseText);
				}
			});
	});	
	$("#more_c3_closure").click(function(event){
		event.preventDefault();
		
		$.ajax({
				url:"backgroundProcess/fillcontentclosureAdmin.jsp",
				type:"post",
				data:{	
						show_type:'C3'
						},
				success:function(data){
					$("#fill-content").html(data);
				},
				error:function(request,status,error){
					alert(request.responseText);
				}
			});
	});	
	$("#more_c4_closure").click(function(event){
		event.preventDefault();
		
		$.ajax({
				url:"backgroundProcess/fillcontentclosureAdmin.jsp",
				type:"post",
				data:{	
						show_type:'C4'
						},
				success:function(data){
					$("#fill-content").html(data);
				},
				error:function(request,status,error){
					alert(request.responseText);
				}
			});
	});	
	
	$(document).on('click','.compl_click',function(event){
			var jobj;
			$("#complaintModal").modal("show");
			event.preventDefault();
			$.ajax({
				url:"backgroundProcess/fillcomplaintdtls.jsp",
				type:"post",
				data:{	
						s_no:$(this).text()
						},
				success:function(data){
					jobj=JSON.parse(data);
					$("#S_NO").val(jobj.S_NO);
					$("#COMPLAINT_DATE").val(jobj.COMPLAINT_DATE);
					$("#CONTROL_NUMBER").val(jobj.CONTROL_NUMBER);
					$("#DEPARTMENT").val(jobj.DEPARTMENT);
					$("#Complaint_Type").val(jobj.COMPLAINT_TYPE);
					$("#Complaint_Subtype").val(jobj.COMPLAINT_SUBTYPE);
					$("#COMPLAINT_DESC").val(jobj.COMPLAINT_DESC);
				},
				error:function(request,status,error){
					alert(request.responseText);
				}
			});
		});
		
		
			$("#closeComplaint").click(function(event){
			event.preventDefault();
			var jsonText;
			$("<div id='overlay'></div>").appendTo("body").animate({opacity:'0.6'},"slow");
				$("#processLoading").fadeIn("slow");
			setTimeout(function(){
					// Updating CCC_complaints table
					$.ajax({
							cache:false,
							async:false,
		 					url:"backgroundProcess/closeComplaint_bg.jsp",
		 					type:"post",
		 					data:{	
								 s_no:$("#S_NO").val(),
		 						tech_deputed:$("#TECH_DEPUTED").val(),
		 						correction_action_taken:$("#CORRECTION_ACTION_TAKEN").val(),
		 						incharge:$("#INCHARGE").val(),
		 						remarks:$("#REMARKS").val()
		 						
		 							
		 						},
		 					success:function(){
								$("#complaintModal").modal("hide");
								alert("complaint closed successfully");
								window.location ="closeComplaint.jsp";
		 					},
		 					error:function(request,status,error){
		 						alert(request.responseText);
		 					}
		 				});
		 				// updating CCC_inventory tag and ccc_equipment table
		 				if($("#equipmentRqrd").prop("checked")){
		 				$.ajax({
							cache:false,
							async:false,
		 					url:"backgroundProcess/inventoryUpdt_bg.jsp",
		 					type:"post",
		 					data:{	
								 C_no:$("#S_NO").val(),
		 						mb_sl:$("#mbFetch").val(),
		 						prc_sl:$("#prcFetch").val(),
		 						ram_sl:$("#ramFetch").val(),
		 						despatched_date:$("#despDate").val(),
		 						receiving_dept:$("#DEPARTMENT").val(),
		 						received_by:$("#CONTROL_NUMBER").val(),
		 						placed_in_cpu_serial:$("#cpuPlaced").val()
		 							
		 						},
		 					success:function(){
								var x="xx";
		 					},
		 					error:function(request,status,error){
		 						alert(request.responseText);
		 					}
		 				});
		 				}
	 				
	 				$("#processLoading").fadeOut("slow");
						$("#overlay").animate({opacity:'0'},"slow",function(){
							$(this).remove();
						});
				},2000);
		});
			
$("#addInv").click(function(event){
	       
			event.preventDefault();
			var jsonText;
			$("<div id='overlay'></div>").appendTo("body").animate({opacity:'0.6'},"slow");
				$("#processLoading").fadeIn("slow");
			setTimeout(function(){
					$.ajax({
							cache:false,
							async:false,
		 					url:"backgroundProcess/addtoInventory_bg.jsp",
		 					type:"post",
		 					data:{item_type:$("#itemType").val(),
		 						serial_number:$("#serialNo").val(),
		 						model_number:$("#modelNo").val(),	
		 						},
		 					success:function(data){
								 alert ("Added to inventory successfully");
								 $("#dynamic_inventory").append(data);
								// jsonText=JSON.parse(data);
								 //$("#serial_number").val(jsonText.slno);
								 //$("#item_type").val(jsonText.dt);
		 						//$("#model_number").modal("show");
								//$("#modalcid").text("Complaint Received successfully with no: "+jsonText.slno);
								//$("#saveComplaint").prop("disabled", true);
		 					},
		 					error:function(request,status,error){
		 						alert(request.responseText);
		 					}
		 				});
	 				
	 				$("#processLoading").fadeOut("slow");
						$("#overlay").animate({opacity:'0'},"slow",function(){
							$(this).remove();
						});
				},2000);
		});
		
		// checkbox fill codes
		
		$("#equipmentRqrd").click(function(){
			if($(this).prop("checked")){
				$("#fillEquipment").slideDown("slow");
			}else{
				$("#fillEquipment").slideUp("slow");
			}
		});
		
		
		$("#more_inv_mb").click(function(event){
		event.preventDefault();
		
		$.ajax({
				url:"backgroundProcess/showInventory_bg.jsp",
				type:"post",
				data:{	
						show_type:'MB'
						},
				success:function(data){
					$("#fill-content").html(data);
				},
				error:function(request,status,error){
					alert(request.responseText);
				}
			});
	});	
	$("#more_inv_prc").click(function(event){
		event.preventDefault();
		
		$.ajax({
				url:"backgroundProcess/showInventory_bg.jsp",
				type:"post",
				data:{	
						show_type:'PRC'
						},
				success:function(data){
					$("#fill-content").html(data);
				},
				error:function(request,status,error){
					alert(request.responseText);
				}
			});
	});	
	$("#more_inv_ram").click(function(event){
		event.preventDefault();
		
		$.ajax({
				url:"backgroundProcess/showInventory_bg.jsp",
				type:"post",
				data:{	
						show_type:'RAM'
						},
				success:function(data){
					$("#fill-content").html(data);
				},
				error:function(request,status,error){
					alert(request.responseText);
				}
			});
	});	
		
		
});

