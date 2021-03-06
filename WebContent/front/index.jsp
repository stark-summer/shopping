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
		<!--navigate part   -->
		<jsp:include page="common/navigation.jsp" />
		<div class="clear"></div>
		<!-- Banner -->
		<div id="banner">
			<div id="slider1" class="sliderwrapper">
				<s:iterator value="commodityListByLatestTime">

					<div class="contentdiv">
						<a href="detail.action?id=<s:property value="id"/>"
							onclick="addRecentlyViewed('<s:property value="id"/>')"
							class="thumb"> <s:if test="commodityPhoto!=null">
								<s:generator separator=";" val="commodityPhoto">
									<s:iterator status="status">
										<s:if test="#status.index==0">
											<img src="../commodityImages/<s:property/>" width="940px"
												height="300px" />
										</s:if>

									</s:iterator>

								</s:generator>

							</s:if> <s:else>
								<img src="../commodityImages/<s:property/>" width="900px"
									height="300px" />
							</s:else> </a>
					</div>

				</s:iterator>
			</div>
			<div id="paginate-slider1" class="pagination"></div>
			<script type="text/javascript" src="js/banner.js"></script>
		</div>
		<div class="clear"></div>
		<!-- Content Section -->
		<div id="content_sec">
			<!-- Categories Section -->
			<div class="catsecs">
				<s:if test="commodityListByCommentCountAndSalesCount.size>0">
					<ul>
						<s:iterator value="commodityListByCommentCountAndSalesCount"
							status="status">

							<s:if test="#status.count<=6">

								<s:if test="#status.index==2||#status.index==5">
        	        <li class="last">
	                	<a href="detail.action?id=<s:property value="id"/>" onclick="addRecentlyViewed('<s:property value="id"/>')" class="thumb">

	                	 		 <s:if test="commodityPhoto!=null">
			                          <s:generator separator=";" val="commodityPhoto" >
								   		<s:iterator status="status" >
									   		<s:if test="#status.index==0">
	                	  						<img src="../commodityImages/<s:property/>" width="300px" height="154px" />
									   		</s:if>
										</s:iterator>
			                         </s:generator>
		                         </s:if>
		                         <s:else>
		                           <img src="../commodityImages/<s:property/>" width="300px" height="154px" />
		                         </s:else>
	                	</a>
	                    <h3><a href="detail.action?id=<s:property value="id"/>" onclick="addRecentlyViewed('<s:property value="id"/>')" class="colr"><s:property value="commodityName"/></a></h3>
               	    </li>
        	     </s:if>
        	     <s:else>
        	      <li>
                	<a href="detail.action?id=<s:property value="id"/>"  onclick="addRecentlyViewed('<s:property value="id"/>')"class="thumb">
                	
                	 <s:if test="commodityPhoto!=null">
                          <s:generator separator=";" val="commodityPhoto" >
					   		<s:iterator status="status" >
						   		<s:if test="#status.index==0">
              	  						<img src="../commodityImages/<s:property/>" width="300px" height="154px" />
						   		</s:if>
							</s:iterator>
                         </s:generator>
		                         
		             </s:if>
		             
		             <s:else>
		                   <img src="../commodityImages/<s:property/>" width="300px" height="154px" />
		             </s:else>            
                	
                	</a>
                    <h3><a href="detail.action?id=<s:property value="id"/>"  onclick="addRecentlyViewed('<s:property value="id"/>')"class="colr"><s:property value="commodityName"/></a></h3>
                  </li>
        	    
        	     </s:else>
        	    
        	   
				</s:if>
             </s:iterator>
             
            </ul>
    	  </s:if>

			</div>

			<div class="clear"></div>
			<!-- Slider -->
			<div class="featuredslider">



				<div class="slidhead">
					<h4 class="colr">FEATURED PRODUCTS</h4>
					<a href="listing.action" class="viewall">显示所有</a>
				</div>
				<div class="slidercont">

					<a href="#" class="prevbtn">&nbsp;</a>
					<div class="anyClass">

						<ul>
							<s:if
								test="commodityListByCategoryCodeAndCommentCountAndSalesCount.size>0">

								<s:iterator
									value="commodityListByCategoryCodeAndCommentCountAndSalesCount">

									<li><a href="detail.action?id=<s:property value="id"/>"
										onclick="addRecentlyViewed('<s:property value="id"/>')"
										class="thumb"> <s:if test="commodityPhoto!=null">
												<s:generator separator=";" val="commodityPhoto">
													<s:iterator status="status">
														<s:if test="#status.index==1">
															<img src="../commodityImages/<s:property/>" width="121"
																height="121" alt="<s:property/>" />
														</s:if>

													</s:iterator>

												</s:generator>

											</s:if> </a>
										<h6>
											<a href="detail.action?id=<s:property value="id"/>"
												onclick="addRecentlyViewed('<s:property value="id"/>')"
												class="colr bold"><s:property value="commodityName" />
											</a>
										</h6>
										<div class="rating">
											<div class="stars">
												<a href="#">&nbsp;</a> <a href="#">&nbsp;</a> <a href="#">&nbsp;</a>
												<a href="#">&nbsp;</a> <a href="#" class="gry">&nbsp;</a>
											</div>
											<a href="#" class="reviews">1 Review(s)</a>
										</div>
										<div class="prices">
											<s:if test="newPrice!=null">
												<p class="newprice colr">
													￥
													<s:property value="newPrice" />
												</p>
											</s:if>
											<s:else>
												<p class="newprice colr"></p>
											</s:else>

											<p class="oldprice">
												￥
												<s:property value="price" />
											</p>
										</div>
										<div class="cartse">
											<a onclick="addToCart('<s:property value="id"/>')"
												class="buttonone">加入购物车</a> <a href="#"
												onclick="addFavorites('<s:property value="id"/>')"
												class="favo">&nbsp;</a>
										</div></li>



								</s:iterator>


							</s:if>

						</ul>



					</div>
					<a href="#" class="nextbtn">&nbsp;</a>




				</div>
				<script type="text/javascript" src="js/sliderscript.js"></script>
			</div>
		</div>
		<div class="clear"></div>
		<jsp:include page="common/bottom.jsp" />
		<div class="clear"></div>
	</div>
</body>
</html>
<script>

   function addToCart(id){
	   if(id!=''&&id.length>0){
		   jQuery.ajax({
				type : "post",
				url : "shoppingCartJson_addShoppingCart.action",
				dataType : 'text',
				data : {commodityId:id},
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
