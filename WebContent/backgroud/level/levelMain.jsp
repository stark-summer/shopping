<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>

<title>级别信息管理</title>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<script type="text/javascript" src="../js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui-1.7.custom.min.js"></script>
<script type="text/javascript" src="../js/DatePicker/WdatePicker.js"></script>

<link href="../images/skin.css" rel="stylesheet" type="text/css" />
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



<style type="text/css">
<!--
.STYLE1 {
	color: #000000
}
-->
</style>

<script language="javascript">
   

	//选择所有的复选框
	function checkAll() {
		var selectFlags = document.getElementsByName("selectFlag");
		for (var i=0; i<selectFlags.length; i++) {
			//selectFlags[i].checked = document.getElementById("ifAll").checked;
			//采用getElementsByName代替getElementById
			selectFlags[i].checked = document.getElementsByName("ifAll")[0].checked;
		}
	}
   $(document).ready(function()
   {
	   
       $("#addBtn").click(function(){
		   var ret = window.showModalDialog("level_toAddLevel.action", null, "dialogWidth:550px;dialogHeight:590px;help:no;status:no");
			
		   if (ret) {
			// 重新加载页面信息
			window.location.reload();
			
		   }
		});
       //提交查询操作按钮
       $("#queryBtn").click(function(){
    	 //取得查询操作中的级别账账号
    	  var levelCode=$("#levelCode").attr("value");
    	  //取得查询操作中的级别姓名
    	  var levelName=$("#levelName").attr("value");
    	  //取得查询操作中的起始时间
    	  var startTime=$("#startTime").val();
    	  //取得查询操作中的结束时间
    	  var endTime=$("#endTime").val();
    	 
    	  window.self.location="level_levelMain.action?levelQuery.levelCode=" + levelCode+"&levelQuery.levelName="+levelName+"&levelQuery.startTime="+startTime+"&levelQuery.endTime="+endTime;
    		  
       });
       
       $("#updateBtn").click(function(){
    	   
    	var selectFlags = document.getElementsByName("selectFlag");
   		//计数器
   		var count = 0;
   		//记录选中的checkbox索引账号
   		var index = 0;
   		for (var i=0; i<selectFlags.length; i++) {
   			if (selectFlags[i].checked) {
   			    //记录选中的checkbox
   				count++;
   				index = i;
   			}
   		}
   		if(count == 0) {
   			alert("请选择需要修改的数据！");
   			return;
   		}
   		if (count > 1) {
   			alert("一次只能修改一个级别！");
   			return;
   		}
   		var selectFlagValue=selectFlags[index].value;
   		//window.self.location="toLevelModify.action?id=" + selectFlags[index].value;
   		 // 获取添加页面的返回值
        var ret = window.showModalDialog("level_toUpdateLevel.action?level.id=" +selectFlagValue, null, "dialogWidth:550px;dialogHeight:590px;help:no;status:no");
        if (ret) {
            // 重新加载页面信息
            window.location.reload();
        }
   		
    	   
       });
       
       $("#deleteBtn").click(function(){
    	var selectFlags = document.getElementsByName("selectFlag");
   		//计数器
   		var count = 0;
   		//记录选中的checkbox索引账号
   		var index = 0;
   		var ids=new Array();
   		for (var i=0; i<selectFlags.length; i++) {
   			if (selectFlags[i].checked) {
   			    //记录选中的checkbox
   				ids[count]=selectFlags[count].value;
   				count++;
   				index = i;
   			}
   		}
   		if(count == 0) {
   			alert("请选择需要删除的数据！");
   			return;
   		}
   		else if(count==1){
   			var selectFlagValue=selectFlags[index].value;
   	   		
      	  // 获取添加页面的返回值
           var ret = window.showModalDialog("level_toDeleteLevel.action?level.id=" +selectFlagValue, null, "dialogWidth:550px;dialogHeight:590px;help:no;status:no");
           if (ret) {
               // 重新加载页面信息
               window.location.reload();
           }
   		}
   		else if (count > 1&&ids.length>1) {
   			 
   		  if (confirm("确认删除级别?")) {
              jQuery.post('levelJson_deleteLevels.action', {ids:ids}, function(json) {
                  if (json != null && json != '') {
                      var result = eval(json);           //包数据解析为json 格式
                      if (result == "true") {
                          alert("删除成功!");
                          window.location.reload();
                      } else {
                          alert("删除失败!");
                          window.location.reload();
                      }
                  } else {
                      alert("异步处理异常，返回值为空!");
                  }
              });
          }
   			
   			
   		}
   		
    	   
       });
       //清空查询操作按钮
       $("#cleanBtn").click(function(){
           //取得查找操作的级别账账号   
    	   $("#levelCode").val("");
    	   //取得查询操作的级别名
             $("#levelName").val("");
             //取得查询操作的起始时间
             $("#startTime").val("");
             //取得查询操作的结束时间
             $("#endTime").val("");
             
       });
       
       $("#topPageBtn").click(function(){
    	   window.self.location="level_levelMain.action?page=1";
    	   
       });
       
	  $("#previousPageBtn").click(function(){
	    	   
	    	   window.self.location="level_levelMain.action?page=<s:property value="levelList.getPreviousPage()"/>";
	    	   
	       });
	  
	  $("#btnNextPage").click(function(){
		   
		   window.self.location="level_levelMain.action?page=<s:property value="levelList.getNextPage()"/>";
		   
	  });
	  
	  $("#bottomPageBtn").click(function(){
		   
		   window.self.location="level_levelMain.action?page=<s:property value="levelList.getEndRow()"/>";
		   
	  });
       
   });
        
</script>

</head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<body>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="17" height="29" valign="top"
				background="../images/mail_leftbg.gif"><img
				src="../images/left-top-right.gif" width="17" height="29" />
			</td>
			<td width="935" height="29" valign="top"
				background="../images/content-bg.gif"><table width="100%"
					height="31" border="0" cellpadding="0" cellspacing="0"
					class="left_topbg" id="table2">
					<tr>
						<td height="31"><div class="titlebt">级别信息管理</div>
						</td>
					</tr>
				</table>
			</td>
			<td width="16" valign="top" background="../images/mail_rightbg.gif"><img
				src="../images/nav-right-bg.gif" width="16" height="29" />
			</td>
		</tr>
		<tr>
			<td height="71" valign="middle"
				background="../images/mail_leftbg.gif">&nbsp;</td>
			<td valign="top" bgcolor="#F7F8F9">
				<form name="levelform" id="levelform">
					<div align="center">
						<table width="95%" border="0" cellspacing="0" cellpadding="0"
							height="35">
							<tr>
								<td class="p1" height="18" nowrap="nowrap">&nbsp;</td>
							</tr>
							<tr>
								<td width="522" class="p1" height="17" nowrap="nowrap">当前位置：级别管理</td>
							</tr>
						</table>
						<hr width="100%" align="center">
					</div>

					<table width="100%" cellpadding="0" cellspacing="0"
						class="table_two" id="table1">
						<tr>
							<td>级别代码</td>
							<td><input type="text" id="levelCode"
								name="levelQuery.levelCode"
								value="<s:property value="levelQuery.levelCode"/>" />
							</td>
							<td>级别名</td>
							<td><input type="text" id="levelName"
								name="levelQuery.levelName"
								value="<s:property value="levelQuery.levelName" />" />
							<td>起始时间</td>
							<td><input type="text" id="startTime"
								name="levelQuery.startTime"
								value="<s:date name="levelQuery.startTime" format="yyyy-MM-dd"/>"
								style="width: 100px; height: 18px"
								onFocus="WdatePicker({isShowClear:true,readOnly:true,lang:'<s:property value="datePickerLocale"/>'})"
								readonly /> 结束时间 <input type="text" id="endTime"
								name="levelQuery.endTime"
								value="<s:date name="levelQuery.endTime" format="yyyy-MM-dd" />"
								style="width: 100px; height: 18px"
								onFocus="WdatePicker({isShowClear:true,readOnly:true,lang:'<s:property value="datePickerLocale"/>'})"
								readonly />
							</td>
						</tr>

						<tr>
							<td colspan="6" align="center"><input type="button"
								id="queryBtn" value="查询" /> <input type="button" id="cleanBtn"
								value="清空" /></td>
						</tr>
					</table>
					<hr>
					<table width="95%" height="20" border="0" align="center"
						cellspacing="0" class="rd1" id="toolbar">
						<tr>
							<td width="49%" class="rd3"><span class="STYLE1">级别列表</span>
							</td>
							<td width="27%" nowrap="nowrap" class="rd3">&nbsp;&nbsp;
								<div align="right"></div></td>
						</tr>
					</table>
					<table width="95%" border="1" cellspacing="0" cellpadding="0"
						align="center" class="table1">
						<tr>
							<td width="10%" class="rd6"><input type="checkbox"
								name="ifAll" onClick="checkAll()">
							</td>
							<td width="25%" class="rd6" align="center">级别代码</td>
							<td width="25%" class="rd6" align="center">级别名</td>
							<td width="20%" class="rd6" align="center">起始点</td>
							<td width="20%" class="rd6" align="center">终止点</td>
						</tr>

						<s:if test="levelList.size>0">

							<s:iterator value="levelList">
								<tr>
									<td class="left_txt2"><input type="checkbox"
										name="selectFlag" class="checkbox1"
										value="<s:property value="id"/>"></td>
									<td class="left_txt2" align="center"><s:property
											value="levelCode" />
									</td>
									<td class="left_txt2" align="center"><s:property
											value="levelName" />
									</td>
									<td class="left_txt2" align="center"><s:property
											value="startPoint" />
									</td>
									<td class="left_txt2" align="center"><s:property
											value="endPoint" />
									</td>
								</tr>


							</s:iterator>
						</s:if>
						<s:else>
							<tr>
								<td colspan="6" align="center">暂无记录</td>
							</tr>

						</s:else>

					</table>
					<table width="95%" height="30" border="0" align="center"
						cellpadding="0" cellspacing="0" class="rd1">
						<tr>

							<td nowrap="nowrap" class="rd3" height="2">
								<div align="left">
									<font>&nbsp;共&nbsp;<s:property
											value="levelList.getTotalPage()" /> &nbsp;页</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<font>当前第</font>&nbsp;
									<s:property value="levelList.getIndex()" />
									<font>页</font>
								</div></td>
							<td nowrap="nowrap" class="rd3">
								<div align="right">
									<s:if test="levelList.isFirstPage()">
										<input name="btnTopPage" class="button1" type="button"
											id="topPageBtn" value="|&lt;&lt; " title="首页"
											disabled="disabled">

									</s:if>
									<s:else>
										<input name="btnTopPage" class="button1" type="button"
											id="topPageBtn" value="|&lt;&lt; " title="首页">
									</s:else>
									<s:if test="levelList.isPreviousPageAvailable()">
										<input name="btnPreviousPage" class="button1" type="button"
											id="previousPageBtn" value=" &lt;  " title="上页"
											onClick="previousPage()">
									</s:if>
									<s:else>
										<input name="btnPreviousPage" class="button1" type="button"
											id="previousPageBtn" value=" &lt;  " title="上页"
											disabled="disabled" onClick="previousPage()">

									</s:else>
									<s:if test="levelList.isNextPageAvailable()">
										<input name="nextPageBtn" class="button1" type="button"
											id="btnNextPage" value="  &gt; " title="下页"
											onClick="nextPage()">
									</s:if>
									<s:else>

										<input name="nextPageBtn" class="button1" type="button"
											id="btnNextPage" value="  &gt; " title="下页"
											onClick="nextPage()" disabled="disabled">
									</s:else>


									<s:if test="levelList.isLastPage()">
										<input name="btnBottomPage" class="button1" type="button"
											id="bottomPageBtn" value=" &gt;&gt;|" title="尾页"
											disabled="disabled" onClick="bottomPage()">
									</s:if>
									<s:else>
										<input name="btnBottomPage" class="button1" type="button"
											id="bottomPageBtn" value=" &gt;&gt;|" title="尾页"
											onClick="bottomPage()">
									</s:else>

									<input name="addBtn" type="button" class="button1" id="addBtn"
										value="添加" /> <input name="modifyBtn" class="button1"
										type="button" id="updateBtn" value="修改" /> <input
										name="deleteBtn" class="button1" type="button" id="deleteBtn"
										value="删除" />
								</div></td>
						</tr>
					</table>
					<p>&nbsp;</p>
				</form>&nbsp;</td>
			<td background="../images/mail_rightbg.gif">&nbsp;</td>
		</tr>
		<tr>
			<td valign="middle" background="../images/mail_leftbg.gif"><img
				src="../images/buttom_left2.gif" width="17" height="17" />
			</td>
			<td height="17" valign="top" background="../images/buttom_bgs.gif"><img
				src="../images/buttom_bgs.gif" width="17" height="17" />
			</td>
			<td background="../images/mail_rightbg.gif"><img
				src="../images/buttom_right2.gif" width="16" height="17" />
			</td>
		</tr>
	</table>

</body>
</html>
