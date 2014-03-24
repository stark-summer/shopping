<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib uri="/struts-tags" prefix="s"%>
<jsp:include page="common/head.jsp" />

<body>
	<!-- Wrapper -->
	<div id="wrapper_sec">
		<!-- Header -->
		<!--navigation part   -->
		<jsp:include page="common/navigation.jsp" />
		<div class="clear"></div>
		<div id="crumb">
			<ul>
				<li><a href="#">首页</a>
				</li>
				<li class="last"><a href="#" class="colr bold">用户信息中心</a>
				</li>
			</ul>
		</div>
		<div class="clear"></div>
		<!-- Content Section -->
		<div id="content_sec">

			<div class="static">
				<table border="0" cellpadding="0" cellspacing="0">
					<tbody>
						<tr>
							<th align="left"><font size="3">用户基本信息</font></th>
						</tr>
						<tr>
							<th><span class="txt">用户账号：<font color="red">*</font>
							</span>
							</th>
							<td><input id="userCode" name="userCode" type="text"
								class="inputSize" readonly="readonly" />
							</td>
						</tr>

						<tr>
							<th><span class="txt">真实姓名：<font color="red">*</font>
							</span>
							</th>
							<td><input id="userName" name="userName" type="text"
								class="inputSize" /><span id="userNameInfo"
								style="display: none"><font color="red">请填写真是姓名</font>
							</span>
							</td>
						</tr>
						<tr>
							<th><span class="txt">性别：<font color="red">*</font>
							</span>
							</th>
							<td><span class="txt"> &nbsp;&nbsp;&nbsp;&nbsp;<input
									type="radio" id="sex" name="sex" value="0" checked="checked" />男
									&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id="sex" name="sex"
									value="1" />女 </span> <span id="sexnfo" style="display: none"><font
									color="red">请选择性别</font>
							</span></td>
						</tr>
						<tr>
							<th><span class="txt">电子邮箱：<font color="red">*</font>
							</span>
							</th>
							<td><input id="email" name="email" type="text"
								class="inputSize" /><span id="emailInfo" style="display: none"><font
									color="red">请填写电子邮件</font>
							</span>
							</td>
						</tr>
						<tr>
							<th><span class="txt">手机号码：<font color="red">*</font>
							</span>
							</th>
							<td><input id="mobile" name="mobile" type="text"
								class="inputSize" /><span id="mobileInfo" style="display: none"><font
									color="red">请填写手机号码</font>
							</span>
							</td>
						</tr>
						<tr>
							<th><span class="txt">身份证：<font color="red">*</font>
							</span>
							</th>
							<td><input id="idCart" name="idCart" type="text"
								class="inputSize" /><span id="idCartInfo" style="display: none"><font
									color="red">请填写身份证号码</font>
							</span>
							</td>
						</tr>

						<tr>
							<th><span class="txt">用户地址：<font color="red">*</font>
							</span>
							</th>
							<td><input id="address" name="address" type="text"
								class="inputAddressSize" /><span id="addressInfo"
								style="display: none"><font color="red">请填写收货地址</font>
							</span>
							</td>
						</tr>

						<tr>
							<th align="left"><font size="3">选填信息</font></th>
						</tr>
						<tr>
							<th><span class="txt">生日：</span>
							</th>
							<td><input id="birthday" name="birthday" class="inputSize"
								style="width: 100px; height: 18px"
								onfocus="WdatePicker({isShowClear:true,readOnly:true,lang:'<s:property value="datePickerLocale"/>'})"
								readonly="readonly" /></td>
						</tr>
						<tr>
							<th><span class="txt">兴趣爱好：</span>
							</th>
							<td><textarea id="hobbies" name="hobbies" rows="5" cols="50"></textarea>
							</td>
						</tr>
					</tbody>


				</table>

				<hr />
				<hr />
				<hr />
				<div align="right">
					<a href="#" id="updateInfoBtn" class="addOrderBtn">提交</a>
				</div>


			</div>

		</div>
		<div class="clear"></div>
		<!-- Footer -->
		<jsp:include page="common/bottom.jsp" />
		<div class="clear"></div>
	</div>
</body>
</html>
