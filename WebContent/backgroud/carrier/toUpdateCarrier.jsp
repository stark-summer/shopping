<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="../css/jquery-ui-1.7.custom.css" rel="stylesheet"
	type="text/css" />
<script src="../js/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="../js/jquery-ui-1.7.custom.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/DatePicker/WdatePicker.js"></script>

<script type="text/javascript">

	$(document).ready(function() {
		
		$("#carrierName").blur(function(){
			var carrierName = $("#carrierName").val();
			if (carrierName.length == 0 || carrierName == "") {
				$("#carrierNameAlert").html("<font size='5' color='red'>×</font>");
			}else{
				$("#carrierNameAlert").html("<font size='5' color='green'>√</font>");
			}
		});
		
		$("#carrierName").click(function(){
			$("#carrierNameAlert").html("");
		});
		
		$("#mobile").blur(function(){
			var mobile = $("#mobile").val();
			if (mobile.length == 0 || mobile == "") {
				$("#mobileAlert").html("<font size='5' color='red'>×</font>");
			}else{
				 var reg =/^((\+86)|(86))?(1)\d{10}$/;
                 if(!mobile.match(reg))
                 {
                     $("#mobile").focus();
                     $("#mobileAlert").html("<font size='5' color='red'>×</font>");
                     return false;
                 }else{
					$("#mobileAlert").html("<font size='5' color='green'>√</font>");
                 }

			}
		});
		
		$("#mobile").click(function(){
			$("#mobileAlert").html("");
		});
		
		$("#email").blur(function(){
			var email = $("#email").val();
			if (email.length == 0 || email == "") {
				$("#emailAlert").html("<font size='5' color='red'>×</font>");
			}else{
				 var pattern =/^[a-zA-Z0-9_\-]{1,}@[a-zA-Z0-9_\-]{1,}\.[a-zA-Z0-9_\-.]{1,}$/;
                 if(!pattern.exec(email))
                  {
                       $("#email").focus();
                       $("#emailAlert").html("<font size='5' color='red'>×</font>");
                      return false;
                  }else{
	    				$("#emailAlert").html("<font size='5' color='green'>√</font>");
                  }
			}
		});
		
		$("#email").click(function(){
			$("#emailAlert").html("");
		});
		
		$("#contacter").blur(function(){
			var contacter = $("#contacter").val();
			if (contacter.length == 0 || contacter == "") {
				$("#contacterAlert").html("<font size='5' color='red'>×</font>");
			}else{
				$("#contacterAlert").html("<font size='5' color='green'>√</font>");
			}
		});
		
		$("#contacter").click(function(){
			$("#contacterAlert").html("");
		});
		
		$("#address").blur(function(){
			var address = $("#address").val();
			if (address.length == 0 || address == "") {
				$("#addressAlert").html("<font size='5' color='red'>×</font>");
			}else{
				$("#addressAlert").html("<font size='5' color='green'>√</font>");
			}
		});
		
		$("#address").click(function(){
			$("#addressAlert").html("");
		});
		
		
		$("#updateBtn").click(function() {
			var carrierCode = $("#carrierCode").val();
			if (carrierCode.length == 0 || carrierCode == "") {
				$("#carrierCodeInfo").show();
				$("#carrierCodeAlert").html("<font size='5' color='red'>×</font>");
				$("#carrierCode").focus();
				return false;
			}else{
				$("#carrierCodeInfo").hide();
				$("#carrierCodeAlert").html("<font size='5' color='green'>√</font>");
				
			}
			var carrierName = $("#carrierName").val();
			if (carrierName.length == 0 || carrierName == "") {
				$("#carrierNameInfo").show();
				$("#carrierNameAlert").html("<font size='5' color='red'>×</font>");
				$("#carrierName").focus();
				return false;
			}else{
				$("#carrierNameInfo").hide();
				$("#carrierNameAlert").html("<font size='5' color='green'>√</font>");
				
			}
			var mobile = $("#mobile").val();
			if (mobile.length == 0 || mobile == "") {
				$("#mobileInfo").show();
				$("#mobileAlert").html("<font size='5' color='red'>×</font>");
				$("#mobile").focus();
				return false;
			}else{
				 var reg =/^((\+86)|(86))?(1)\d{10}$/;
                 if(!mobile.match(reg))
                 {
                     $("#mobile").focus();
					$("#mobileInfo").hide();
                     $("#mobileAlert").html("<font size='5' color='red'>×</font>");
                     return false;
                 }else{
					$("#mobileAlert").html("<font size='5' color='green'>√</font>");
                 }
			}
			
			var email = $("#email").val();
			if (email.length == 0 || email == "") {
				$("#emailInfo").show();
				$("#emailAlert").html("<font size='5' color='red'>×</font>");
				$("#email").focus();
				return false;
			}else{
				 var pattern =/^[a-zA-Z0-9_\-]{1,}@[a-zA-Z0-9_\-]{1,}\.[a-zA-Z0-9_\-.]{1,}$/;
                 if(!pattern.exec(email))
                  {
                       $("#email").focus();
					   $("#emailInfo").hide();
                       $("#emailAlert").html("<font size='5' color='red'>×</font>");
                      return false;
                  }else{
	    				$("#emailAlert").html("<font size='5' color='green'>√</font>");
                  }
				
			}
			
			var contacter = $("#contacter").val();
			if (contacter.length == 0 || contacter == "") {
				$("#contacterInfo").show();
				$("#contacterAlert").html("<font size='5' color='red'>×</font>");
				$("#contacter").focus();
				return false;
			}else{
				$("#contacterInfo").hide();
				$("#contacterAlert").html("<font size='5' color='green'>√</font>");
				
			}
			var address = $("#address").val();
			if (address.length == 0 || address == "") {
				$("#addressInfo").show();
				$("#addressAlert").html("<font size='5' color='red'>×</font>");
				$("#address").focus();
				return false;
			}else{
				$("#addressInfo").hide();
				$("#addressAlert").html("<font size='5' color='green'>√</font>");
				
			}
			
			

			jQuery.ajax({
				type : "post",
				url : "carrierJson_updateCarrier.action",
				dataType : 'text',
				data : $('#updateCarrier_form').serialize(),
				success : function(json) {

					if (json != null && json != '') {
						var member = json; //包数据解析为json 格式
						var jsons = member.split("*");
						 
						if (eval(jsons[0]) == "true") {
							alert('更新成功!');
							window.close();
							window.returnValue = true;
						} else {
							if (undefined != jsons[1]) {
								alert(jsons[1]);
							} else {
								alert("更新失败！");
							}
							window.close();
							window.returnValue = true;
						}
					} else {
						alert("异步处理异常，返回值为空！");
					}
				}
			});
		});

		$("#cancelBtn").click(function() {
			window.close();
			window.returnValue = false;

		});
	});
</script>

<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #F8F9FA;
}
-->
</style>

<title>更新承运商信息</title>

<link href="../images/skin.css" rel="stylesheet" type="text/css" />
<body>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="17" height="29" valign="top"
				background="../images/mail_leftbg.gif"><img
				src="../images/left-top-right.gif" width="17" height="29" /></td>
			<td width="935" height="29" valign="top"
				background="../images/content-bg.gif"><table width="100%"
					height="31" border="0" cellpadding="0" cellspacing="0"
					class="left_topbg" id="table2">
					<tr>


					</tr>
				</table></td>
			<td width="16" valign="top" background="../images/mail_rightbg.gif"><img
				src="../images/nav-right-bg.gif" width="16" height="29" /></td>
		</tr>
		<tr>
			<td height="71" valign="middle"
				background="../images/mail_leftbg.gif">&nbsp;</td>
			<td valign="top" bgcolor="#F7F8F9"><table width="100%"
					height="138" border="0" cellpadding="0" cellspacing="0">

					<tr>
						<td height="13" valign="top">&nbsp;</td>
					</tr>
					<tr>
						<td valign="top"><table width="98%" border="0" align="center"
								cellpadding="0" cellspacing="0">
								<tr>
									<td class="left_txt">当前位置：更新承运商</td>
								</tr>

								<tr>
									<td height="20"><table width="100%" height="1" border="0"
											cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
											<tr>
												<td></td>
											</tr>
										</table></td>
								</tr>
								<tr>
									<td>
										<table width="100%" height="55" border="0" cellpadding="0"
											cellspacing="0">

											<tr>
												<td width="10%" height="55" valign="middle"><img
													src="../images/title.gif" width="54" height="55"></td>
												<td width="90%" valign="top"><span class="left_txt2">在这里，您可以更新新承运商</span><span
													class="left_txt3">！</span><br>
												</td>
											</tr>
										</table></td>
								</tr>
								<tr>

									<td>&nbsp;</td>
								</tr>
								<tr>
									<td><table width="100%" height="31" border="0"
											cellpadding="0" cellspacing="0" class="nowtable">
											<tr>
												<td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;承运商信息设置</td>
											</tr>
										</table></td>

								</tr>
								<tr>
									<td>
										<form id="updateCarrier_form">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">

												<tr>
													<td width="50%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">承运商代码<font color="red">*</font>:&nbsp;&nbsp;&nbsp;</td>

													<td width="50%" height="30" bgcolor="#f2f2f2"><input
														type="hidden" name="carrier.id"
														value="<s:property value="carrier.id"/>" /> <input
														type="text" id="carrierCode" name="carrier.carrierCode"
														value="<s:property value="carrier.carrierCode"/>"
														size="30" readonly="readonly" /> <span
														id="carrierCodeAlert"></span>
														<div id="carrierCodeInfo"></div></td>
												</tr>

												<tr>
													<td width="50%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">承运商名<font color="red">*</font>:&nbsp;&nbsp;&nbsp;</td>

													<td width="50%" height="30" bgcolor="#f2f2f2"><input
														type="text" id="carrierName" name="carrier.carrierName"
														value="<s:property value="carrier.carrierName"/>"
														size="30" /> <span id="carrierNameAlert"></span></td>

												</tr>


												<tr>
													<td width="50%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">联系电话<font color="red">*</font>:&nbsp;&nbsp;&nbsp;</td>

													<td width="50%" height="30" bgcolor="#f2f2f2"><input
														type="text" id="mobile" name="carrier.mobile" size="30"
														value="<s:property value="carrier.mobile"/>" /> <span
														id="mobileAlert"></span></td>
												</tr>

												<tr>
													<td width="50%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">E-Mail<font color="red">*</font>:&nbsp;&nbsp;&nbsp;</td>

													<td width="50%" height="30" bgcolor="#f2f2f2"><input
														type="text" id="email" name="carrier.email" size="30"
														value="<s:property value="carrier.email"/>" /> <span
														id="emailAlert"></span></td>

												</tr>


												<tr>
													<td width="50%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">联系人<font color="red">*</font>:&nbsp;&nbsp;&nbsp;</td>

													<td width="50%" height="30" bgcolor="#f2f2f2"><input
														type="text" id="contacter" name="carrier.contacter"
														size="30" value="<s:property value="carrier.contacter"/>" />
														<span id="contacterAlert"></span></td>

												</tr>

												<tr>
													<td width="50%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">地址<font color="red">*</font>:&nbsp;&nbsp;&nbsp;</td>

													<td width="50%" height="30" bgcolor="#f2f2f2"><input
														type="text" id="address" name="carrier.address" size="30"
														value="<s:property value="carrier.address"/>" /> <span
														id="addressAlert"></span></td>

												</tr>

												<tr>
													<td width="50%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">备注:&nbsp;&nbsp;&nbsp;</td>

													<td width="50%" height="30" bgcolor="#f2f2f2"><textarea
															id="remark" name="carrier.remark" cols="25" rows="5">
															<s:property value="carrier.remark" />
														</textarea></td>

												</tr>


												<tr>
													<td height="30" colspan="3">&nbsp;</td>

												</tr>

												<tr>
													<td width="50%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2"><input type="button" value="取消更新"
														id="cancelBtn" name="cancelBtn" />
														&nbsp;&nbsp;&nbsp;&nbsp;</td>

													<td width="50%" height="30" bgcolor="#f2f2f2">
														&nbsp;&nbsp;&nbsp;<input type="button" value="提交更新"
														id="updateBtn" />
													</td>

												</tr>
											</table>
										</form>
									</td>
								</tr>



							</table>
						</td>
					</tr>
				</table>
			</td>
	</table>

</body>
</html>