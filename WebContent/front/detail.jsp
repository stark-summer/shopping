<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<jsp:include page="common/head.jsp" />
<%@ taglib uri="/struts-tags" prefix="s"%>
<body>
	<!-- Wrapper -->
	<div id="wrapper_sec">
		<!-- Header -->
		<!--navigation part   -->
		<jsp:include page="common/navigation.jsp" />
		<div class="clear"></div>
		<div id="crumb">
			<ul>
				<li><a href="index.action">首页</a>
				</li>
				<li class="last"><a href="#" class="colr bold">产品</a>
				</li>
			</ul>
		</div>
		<div class="clear"></div>
		<!-- Content Section -->
		<div id="content_sec">
			<!-- Left -->
			<jsp:include page="common/left.jsp" />
			<!-- Column 2 -->
			<div class="col2">
				<!-- Product Detail -->
				<div class="prod_detail">
					<h4 class="colr bold smallheading upper">
						<span class="arrow"><s:property
								value="commodity.commodityName" />
						</span>
					</h4>
					<div class="thumbsec">
						<div id="slider2" class="prod_gallery">
							<s:generator separator=";" val="commodity.commodityPhoto">
								<s:iterator status="status">
							         <s:if test="#status.index==1">
								        <div class="contentdiv">
											<a rel="example_group" href="../commodityImages/<s:property/>"
												title="商品图片"><img src="../commodityImages/<s:property/>"
												width="220" height="199" alt="" />
											</a>
										</div>
								     </s:if>
								</s:iterator>
							</s:generator>
						</div>
						<%-- <div class="galleryscrol">
							<a href="#" class="prevbtn">&nbsp;</a>
							<div class="anyClass" id="paginate-slider2">
								<ul>
									<s:generator separator=";" val="commodity.commodityPhoto">
										<s:iterator>
											<li><a href="#" class="toc"><img
													src="../commodityImages/<s:property/>" width="46"
													height="44" alt="" />
											</a>
											</li>
										</s:iterator>
									</s:generator>

								</ul>
							</div>
							<a href="#" class="nextbtn">&nbsp;</a>
						</div>
						<script type="text/javascript" src="js/gallery.js"></script>
						<script type="text/javascript" src="js/jcarousellite_1.0.1.js"></script> --%>
					</div>
					<div class="descshort">
						<div class="rating">
							<div class="stars">
								<a href="#">&nbsp;</a> <a href="#">&nbsp;</a> <a href="#">&nbsp;</a>
								<a href="#">&nbsp;</a> <a href="#" class="gry">&nbsp;</a>
							</div>
							<a href="#" class="reviews under">浏览<s:property
									value="commodity.viewedCount" default="0" />次</a>
							<div class="clear"></div>
							<p class="availability">
								库存:
								<s:if test="commodity.qty>0">
									<span class="bold">有货</span>
								</s:if>
								<s:else>
									<span class="bold">无货</span>
								</s:else>
							</p>
						</div>
						<div class="quickreview">
							<h6 class="colr">快速概述</h6>
							<p>
								<s:property value="commodity.quickOverride" escape="false" />
							</p>
						</div>
						<div class="prod_options">
							<p class="size">Size *</p>
							<div class="selectmenu sizeselect">
								<select name="speedC" id="speedG">
									<option value="Slower" class="whoo">Small</option>
									<option value="Slow">Medium</option>
									<option value="Slow">Large</option>
								</select>
							</div>
							<p class="color">Color *</p>
							<div class="selectmenu colorselect">
								<select name="speedC" id="speedH">
									<option value="Slower" class="whoo">Black</option>
									<option value="Slow">Red</option>
									<option value="Slow">Pink</option>
								</select>
							</div>
							<p class="qty">数量:</p>
							<div class="selectmenu qtyselect">
								<select name="speedC" id="speedI">
									<option value="1" class="whoo">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
								</select>
							</div>
						</div>
						<div class="clear"></div>
						<div class="prices">
							<s:if
								test="commodity.newPrice!=null&&commodity.newPrice<commodity.price">
								<p class="newprice colr bold">
									优惠价: ￥
									<s:property value="commodity.newPrice" />
								</p>
							</s:if>

							<p class="oldprice">
								￥
								<s:property value="commodity.price" />
							</p>
							<a href="#"
								onclick="addToCart('<s:property value="commodity.id"/>')"
								class="buttonone">加入购物车</a> <a href="#"
								onclick="addFavorites('<s:property value="commodity.id"/>')"
								class="favo">&nbsp;</a>
						</div>
						<div class="clear"></div>
					</div>
					<div class="clear"></div>
					<!-- Tabs -->
					<div class="tabs">
						<div class="tab_menu_container">
							<ul id="tab_menu">
								<li><a class="current" rel="tab_sidebar_desc">商品介绍</a>
								</li>
								<li><a class="" rel="tab_sidebar_specifications">规格参数</a>
								</li>
								<li><a class="" rel="tab_sidebar_packinglist">包装清单</a>
								</li>
								<li><a class="" rel="tab_sidebar_comments">评价</a>
								</li>
							</ul>
							<div class="clear"></div>
						</div>
						<div class="tab_container">
							<div class="tab_container_in">
								<div style="display: none;" id="tab_sidebar_desc"
									class="tab_sidebar_list">
									<s:property value="commodity.description" escape="false" />
								</div>
								<div style="display: none;" id="tab_sidebar_specifications"
									class="tab_sidebar_list">
									<s:property value="commodity.specifications" escape="false" />
								</div>
								<div style="display: none;" id="tab_sidebar_packinglist"
									class="tab_sidebar_list">
									<s:property value="commodity.packingList" escape="false" />
								</div>
								<div style="display: none;" id="tab_sidebar_comments"
									class="tab_sidebar_list">
									<s:if test="commentList.size>0">
										<s:iterator value="commentList">
											<div style="float: left;">
												<strong>用户：<s:property value="userCode" />
												</strong>
											</div>
											<div style="float: left;">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</div>
											<div>
												<div>
													<strong><s:property value="title" />
													</strong>
												</div>
												<div align="right">
													<s:property value="commentTime" />
												</div>
												<hr />
												<p align="left">
													&nbsp;&nbsp;&nbsp;&nbsp;
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
														color="red">优点：</font>
													<s:property value="advantage" />
												</p>
												<p>
													&nbsp;&nbsp;&nbsp;&nbsp;
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
														color="red">不足：</font>
													<s:property value="shortcoming" />
												</p>
												<p>
													&nbsp;&nbsp;&nbsp;&nbsp;
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font
														color="red">使用心得：</font>
													<s:property value="usageExperience" />
												</p>
											</div>
											<hr />
										</s:iterator>


									</s:if>
									<s:else>
										<p>
											<strong><font color="red"> 暂无评价</font>
											</strong>
										</p>

									</s:else>

								</div>
								<div class="clear"></div>
							</div>
						</div>
						<script type="text/javascript" src="js/tabs.js"></script>
					</div>

					<s:if test="favoritesList.size>0">

						<div class="relatedproducts">
							<h5 class="colr">You may also be interested in the following
								product(s)</h5>
							<ul class="listingprods">
								<s:iterator value="favoritesList" status="status">
									<s:if
										test="#status.count<4">
			                        <li>
			                            <a href="detail.action?id=<s:property value="commodityId"/>" onclick="addRecentlyViewed('<s:property value="commodityId"/>')" class="thumb">
			                               	<s:if test="commodityPhoto!=null">
							                   <s:generator separator=";" val="commodityPhoto" >
												   <s:iterator status="status" >
													  	<s:if test="#status.index==0">
					                	  					<img src="../commodityImages/<s:property/>" width="121" height="121"  />
													   	</s:if>
												   		
													</s:iterator>
												   
									                    </s:generator>
								                         
								              </s:if>
								              <s:else>
								                      <img src="../commodityImages/<s:property/>" width="121" height="121"  />
								               </s:else>
			                            
			                            
			                            </a>
			                            <h6><a href="detail.action?id=<s:property value="commodityId"/>" onclick="addRecentlyViewed('<s:property value="commodityId"/>')" class="colr bold"><s:property value="commodityName"/></a></h6>
			                            <div class="rating">
			                                <div class="stars">
			                                    <a href="#">&nbsp;</a>
			                                    <a href="#">&nbsp;</a>
			                                    <a href="#">&nbsp;</a>
			                                    <a href="#">&nbsp;</a>
			                                    <a href="#" class="gry">&nbsp;</a>
			                                </div>
			                                <a href="#" class="reviews">浏览<s:property value="viewedCount" default="0" />次</a>
			                            </div>
			                            <div class="prices">
			                               <s:if test="newPrice!=null&&newPrice<price">
					                           <p class="newprice">￥ <s:property value="newPrice" /></p>
					                        </s:if>
					                        <s:else>
			                                <p class="oldprice">￥ <s:property value="price" /></p>
					                        </s:else>
			                            </div>
			                            <div class="cartse">
			                                <a href="#"  onclick="addToCart('<s:property value="id"/>')"  class="buttonone">加入购物车</a>
		                           			 <a href="#" onclick="addFavorites('<s:property value="id"/>')" class="favo">&nbsp;</a>
			                            </div>
			                        </li>
		                              
		                        </s:if>
		                        <s:elseif test="#status.count==4">
		                             
			                        <li class="last">
			                           <a href="detail.action?id=<s:property value="commodityId"/>" onclick="addRecentlyViewed('<s:property value="commodityId"/>')" class="thumb">
			                               	<s:if test="commodityPhoto!=null">
							                   <s:generator separator=";" val="commodityPhoto" >
												   <s:iterator status="status" >
													  	<s:if test="#status.index==0">
					                	  					<img src="../commodityImages/<s:property/>" width="121" height="121"  />
													   	</s:if>
												   		
													</s:iterator>
												   
									                    </s:generator>
								                         
								              </s:if>
								              <s:else>
								                      <img src="../commodityImages/<s:property/>" width="121" height="121"  />
								               </s:else>
			                            
			                            
			                            </a>
			                            <h6><a href="detail.action?id=<s:property value="commodityId"/>" onclick="addRecentlyViewed('<s:property value="commodityId"/>')" class="colr bold"><s:property value="commodityName"/></a></h6>
			                            <div class="rating">
			                                <div class="stars">
			                                    <a href="#">&nbsp;</a>
			                                    <a href="#">&nbsp;</a>
			                                    <a href="#">&nbsp;</a>
			                                    <a href="#">&nbsp;</a>
			                                    <a href="#" class="gry">&nbsp;</a>
			                                </div>
			                                <a href="#" class="reviews">浏览<s:property value="viewedCount" default="0" />次</a>
			                            </div>
			                            <div class="prices">
			                               <s:if test="newPrice!=null&&newPrice<price">
				                          		 <p class="newprice">￥ <s:property value="newPrice" /></p>
					                        </s:if>
					                        <s:else>
			                                	<p class="oldprice">￥ <s:property value="price" /></p>
					                        </s:else>
			                            </div>
			                            <div class="cartse">
			                               <a href="#"  onclick="addToCart('<s:property value="id"/>')"  class="buttonone">加入购物车</a>
			                            	<a href="#" onclick="addFavorites('<s:property value="id"/>')" class="favo">&nbsp;</a>
			                            </div>
			                        </li>
		                        
		                        </s:elseif>
		                     
		                     </s:iterator>
		                    </ul>
		                </div>
                
                </s:if>
            </div>
        </div>
        <div class="clear"></div>
        
    </div>
    <div class="clear"></div>
    <!-- Footer -->
      <jsp:include page="common/bottom.jsp"/>
    <div class="clear"></div>
</div>
</body>
</html>
<script>

   function addToCart(id){
	   var commodityNum=$("#speedI").val();
	   if(id!=''&&id.length>0&&commodityNum!=''&&commodityNum.length>0){
		   jQuery.ajax({
				type : "post",
				url : "shoppingCartJson_addShoppingCart.action",
				dataType : 'text',
				data : {commodityId:id,commodityNum:commodityNum},
				success : function(json) {
					
					if (json != null && json != '') {
						var member = eval(json); //包数据解析为json 格式
						var jsons = member.split("*");
						if (jsons[0] == "true") {
							alert('加入成功!');
						} else {
							if (undefined != jsons[1]) {
								alert(jsons[1]);
								if('您还没有登录'==jsons[1]){
									window.self.location="toLogin.action";
								}
							} else {
								alert("加入失败！");
							}
						}
					} else {
						alert("异步处理异常，返回值为空！");
					}
				}
			});
		   
	   }
	   
   }
   
   function addFavorites(id){
   	if(id.length>0&&id!=''){
   		jQuery.ajax({
			type : "post",
			url : "favoritesJson_addFavorites.action",
			dataType : 'text',
			data : {commodityId:id},
			success : function(json) {

				if (json != null && json != '') {
					var member = eval(json); //包数据解析为json 格式
					var jsons = member.split("*");
					if (jsons[0] == "true") {
						alert('收藏成功!');
					} else {
						if (undefined != jsons[1]) {
							alert(jsons[1]);
						} else {
							alert("收藏失败！");
						}
					}
				} else {
					alert("异步处理异常，返回值为空！");
				}
			}
		});
   	}
   	
   }
 
   function addRecentlyViewed(id){
	  	if(id.length>0&&id!=''){
	   		jQuery.ajax({
				type : "post",
				url : "recentlyViewedJson_addRecentlyViewed.action",
				dataType : 'text',
				data : {commodityId:id},
				success : function(json) {

					if (json != null && json != '') {
						var member = eval(json); //包数据解析为json 格式
						var jsons = member.split("*");
						if (jsons[0] == "false") {
							if('notlogin'!=jsons[i]){
								
								if (undefined != jsons[1]) {
										alert(jsons[1]);
									} else {
										alert("添加浏览失败！");
									}
								}
							}
					} else {
						alert("异步处理异常，返回值为空！");
					}
				}
			});
	   	}
	
	}


</script>
 

