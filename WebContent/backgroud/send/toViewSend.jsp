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

<title>更新配送信息</title>

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
									<td class="left_txt">当前位置：更新配送</td>
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
												<td width="90%" valign="top"><span class="left_txt2">在这里，您可以更新新配送</span><span
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
												<td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;配送信息设置</td>
											</tr>
										</table></td>

								</tr>
								<tr>
									<td>
										<form id="updateSend_form">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">

												<tr>
													<td width="50%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">配送代码<font color="red">*</font>:&nbsp;&nbsp;&nbsp;</td>

													<td width="50%" height="30" bgcolor="#f2f2f2"><input
														type="hidden" name="send.id"
														value="<s:property value="send.id"/>" /> <input
														type="text" id="sendCode" name="send.sendCode"
														value="<s:property value="send.sendCode"/>" size="30"
														readonly="readonly" /></td>
												</tr>

												<tr>
													<td width="50%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">配送类别<font color="red">*</font>:&nbsp;&nbsp;&nbsp;</td>


													<td width="50%" height="30" bgcolor="#f2f2f2"><select
														id="typeCode" name="send.typeCode" disabled="disabled">
															<s:iterator value="sendTypeList">
																<s:if test="send.typeCode==sendTypeCode">
																	<option value="<s:property value="sendTypeCode" />"
																		selected="selected">
																		<s:property value="sendTypeName" />
																	</option>
																</s:if>
																<s:else>
																	<option value="<s:property value="sendTypeCode" />">
																		<s:property value="sendTypeName" />
																	</option>
																</s:else>
															</s:iterator>
													</select></td>

												</tr>


												<tr>
													<td width="50%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">订单号:&nbsp;&nbsp;&nbsp;</td>


													<td width="50%" height="30" bgcolor="#f2f2f2"><input
														type="text" id="orderCode" name="send.orderCode"
														value="<s:property value="send.orderCode"/>" size="30"
														readonly="readonly" /></td>

												</tr>

												<tr>
													<td width="50%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">商品名:&nbsp;&nbsp;&nbsp;</td>


													<td width="50%" height="30" bgcolor="#f2f2f2"><input
														type="text" id="commodityName" name="send.commodityName"
														value="<s:property value="send.commodityName"/>" size="30"
														readonly="readonly" /></td>

												</tr>




												<tr>
													<td width="50%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">承运商<font color="red">*</font>:&nbsp;&nbsp;&nbsp;</td>

													<td width="50%" height="30" bgcolor="#f2f2f2"><select
														id="carrierCode" name="send.carrierCode"
														disabled="disabled">
															<s:iterator value="carrierList">
																<s:if test="send.carrierCode==carrierCode">
																	<option value="<s:property value="carrierCode" />"
																		selected="selected">
																		<s:property value="carrierName" />
																	</option>
																</s:if>
																<s:else>
																	<option value="<s:property value="carrierCode" />">
																		<s:property value="carrierName" />
																	</option>
																</s:else>
															</s:iterator>
													</select></td>
												<tr>
												<tr>
													<td width="50%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">处理信息<font color="red">*</font>:&nbsp;&nbsp;&nbsp;</td>

													<td width="50%" height="30" bgcolor="#f2f2f2">
													
													<table class="left_txt2">
												         <tbody>
													         <s:if test="sendList.size>0">
													         <tr>
													           <td width="40%">处理时间</td>
													           <td width="40%">处理信息</td>
													           <td width="20%">操作人</td>
													         </tr>
													        <s:iterator value="sendList">
													         <tr>
													           <td><s:date name="dealTime" format="yyyy-MM-dd HH:mm:ss"/></td>
													           <td><s:property value="dealInformation" default="暂无相关信息" /></td>
													           <td><s:property value="operator" default="无" /> </td>
													         </tr>
													         </s:iterator>
													         </s:if>
													         <s:else>
													              <span class="txt"><font color="red" size="3">暂无订单状态信息</font></span>
													         </s:else>
													         
												        </tbody>
												        
												     </table>
														
														</td>

												</tr>

												<tr>
													<td width="50%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">备注:&nbsp;&nbsp;&nbsp;</td>

													<td width="50%" height="30" bgcolor="#f2f2f2">
														<textarea id="remark" name="send.remark" cols="25" rows="5"
															readonly="readonly"><s:property value="send.remark" /></textarea>
													</td>

												</tr>


												<tr>
													<td height="30" colspan="3">&nbsp;</td>

												</tr>

												<tr>
													<td colspan="2" width="50%" height="30" align="center"
														bgcolor="#f2f2f2" class="left_txt2"><input
														type="button" value="关闭" id="cancelBtn" name="cancelBtn" />
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