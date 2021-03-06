package com.haos.web.action.shoppingcart.json;

import java.util.Map;
import org.apache.commons.lang.xwork.StringUtils;

import com.haos.common.util.action.BaseAction;
import com.haos.common.util.page.ResultCollection;
import com.haos.domain.order.Order;
import com.haos.domain.send.Send;
import com.haos.domain.shoppingcart.ShoppingCart;
import com.haos.service.commodity.CommodityService;
import com.haos.service.order.OrderService;
import com.haos.service.shoppingcart.ShoppingCartService;
import com.opensymphony.xwork2.ActionContext;


/**
 *  Shopping Cart JsonAction
 * @author WangYue
 *
 */
public class ShoppingCartJsonAction extends BaseAction {
   // private final static Log logger = LogFactory.getLog(CommodityJsonAction.class);
    
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
     * commodity category Service interface
     */
    private CommodityService commodityService;
    
    /**
     * shopping cart information service interface
     */
    private ShoppingCartService shoppingCartService;
    
    /**
     * order information service  information 
     */
    private OrderService orderService;
    
    
    /**
     * json return result
     */
    private String result;
    
    /**
     * alert information
     */
    private String resultMsg;
    
    
    /**
     * shopping cart id
     */
    private  Long id;
    /**
     * commodity id
     */
    private Long commodityId;
    /**
     * commodity number
     */
    
    private Long commodityNum;
    
    
    Map<String,Object> map;
    
    
    /**
     * shopping cart remark
     */
    private String remark;
    
    /**
     * consignee
     */
    private String consignee;
    
    /**
     * address
     */
    private String address;
    /**
     * user mobile
     */
    private String mobile;
    
    /**
     * user email
     */
    private String email;
    
    /**
     * user zip code
     */
    private String zipCode;
    
    /**
     * send type code
     */
    private String sendTypeCode;
    
    /**
     * carrier code
     */
    private String carrierCode;
    
    
    /**
     * payment method
     */
    private int  paymentMethod;
    /** 
     * shipping method
     */
    private int shippingMethod;

    /**
     * add shopping cart 
     *
     * @return
     */
    public String addShoppingCart() {
    	
    	// commodity id is null and >0
        if (null!=commodityId&&commodityId>0) {
        	map=ActionContext.getContext().getSession();  //get session
    		String userCode=(String)map.get("userCode");  //get user code from session
        	if(!StringUtils.isBlank(userCode)){
        		
        		ShoppingCart shoppingCart = new ShoppingCart();
        		shoppingCart.setCommodityId(commodityId); //set commodity id
        		shoppingCart.setUserCode(userCode);  //set user code
        		if(null!=commodityNum&&commodityNum>0){
        			shoppingCart.setCommodityNum(commodityNum); //set commodity number
        		}
        		if(!StringUtils.isBlank(remark)){
        			shoppingCart.setRemark(remark);  //set shopping cart remark
        		}
        		ResultCollection shoppingCartResult=shoppingCartService.addShoppingCart(shoppingCart);  //call addShoppingCart() method
        		if(null!=shoppingCartResult){
        			if(shoppingCartResult.getSuccess()){
        				result="true";
        			}else{
        				result="false";
        			}
        		}else{
        			result="false";
        		}
        	} else{
    			result="false*您还没有登录";
        	}
        		 
        } else {
            result = "false*商品编号不正确";
        }
        return "out";
    }
    
    
    /**
     * update shopping cart commodity number
     * @return
     */
    public String updateShoppingCartCommodityNum(){
    	//commodity number>0?
    	if(commodityNum>0){
    		map=ActionContext.getContext().getSession();  //get session
    		String userCode =(String)map.get("userCode");  //get user code from session
            if(!StringUtils.isBlank(userCode)){
            	//id >0?
            	if(null!=id&&id>0){
            		ShoppingCart shoppingCart= new ShoppingCart(); //new ShoppingCart object name is shoppingCart
            		shoppingCart.setId(id); //set shopping cart id
            		shoppingCart.setCommodityNum(commodityNum); //set commodity number
            		
            		ResultCollection shoppingCartResult=shoppingCartService.updateShoppingCartCommodityNum(shoppingCart);// call updateShoppingCartCommodityNum mehtod
            		
            		if(null!=shoppingCartResult&&shoppingCartResult.getSuccess()){
            			 ResultCollection totalPriceResult= shoppingCartService.queryShoppingCartByUserCode(userCode);
            			 result=((Double)totalPriceResult.get("totalPrice")).toString();
            		}else{
            			result="false";
            		}
            	}else{
            		result="false";
            	}
            	
            }else{
            	result="false";
            }
    		
    	}else{
    		
    		result="false";
    	}
    	
    	return "out";
    }
    
    
    /**
     * delete shopping cart by id
     * @return
     */
    public String deleteShoppingCartById(){
    	if(null!=id&&id>0){
    		map=ActionContext.getContext().getSession(); //get session
    		String userCode =(String)map.get("userCode");  //get user code from session
            if(!StringUtils.isBlank(userCode)){
                 ResultCollection shoppingCartResult=shoppingCartService.deleteShoppingCartById(id);  //call deleteShoppingCartById() method
                 if(null!=shoppingCartResult&&shoppingCartResult.getSuccess()){
                	 ResultCollection totalPriceResult= shoppingCartService.queryShoppingCartByUserCode(userCode);
        			 result=((Double)totalPriceResult.get("totalPrice")).toString();
         		}else{
         			result="false";
         		}
            	
            }else{
            	result="false";
            }
    	}
    	
    	return "out";
    }

    /**
     *  check out
     * @return
     */
    public String checkout(){
    	Order order = new Order(); // new Order object value name is order
    	map=ActionContext.getContext().getSession();  //get session from map object
    	String userCode=(String)map.get("userCode");  //get user code from session
    	if(!StringUtils.isBlank(userCode)){
    		order.setUserCode(userCode);  //set user code 
    	}
    	
    	String userName=(String) map.get("userName");
    	if(!StringUtils.isBlank(userName)){
    		order.setUserName(userName);  //set user name 
    	}
        if(!StringUtils.isBlank(consignee)){
    		order.setConsignee(consignee); //set consignee
    	}
        
        if(!StringUtils.isBlank(address)){
    		order.setAddress(address); //set address
    	}
        
        if(!StringUtils.isBlank(mobile)){
    		order.setMobile(mobile); //set mobile
    	}
        
        if(!StringUtils.isBlank(email)){
    		order.setEmail(email); //set email
    	}
        if(!StringUtils.isBlank(zipCode)){
    		order.setZipCode(zipCode); //set zipCode
    	}
        if(paymentMethod>0){
        	order.setPaymentMethod(paymentMethod); //set payment method
        }
        
        if(shippingMethod>0){
        	order.setShippingMethod(shippingMethod);  //set pay method
        }
        if(!StringUtils.isBlank(remark)){
    		order.setRemark(remark); //set remark
    	}

        if(!StringUtils.isBlank(sendTypeCode)){
        	order.setTypeCode(sendTypeCode); //set send type code
        }
        
        if(!StringUtils.isBlank(carrierCode)){
        	order.setCarrierCode(carrierCode); // set carrier code
        }
        
        
        orderService.addOrder(order);  //call addOrder method

    	result="true";
    	return "out";
    }


    public void setCommodityService(CommodityService commodityService) {
        this.commodityService = commodityService;
    }


    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getResultMsg() {
        return resultMsg;
    }

    public void setResultMsg(String resultMsg) {
        this.resultMsg = resultMsg;
    }



	public Long getId() {
		return id;
	}



	public void setId(Long id) {
		this.id = id;
	}



	public Long getCommodityId() {
		return commodityId;
	}



	public void setCommodityId(Long commodityId) {
		this.commodityId = commodityId;
	}



	public Long getCommodityNum() {
		return commodityNum;
	}



	public void setCommodityNum(Long commodityNum) {
		this.commodityNum = commodityNum;
	}



	public String getRemark() {
		return remark;
	}



	public void setRemark(String remark) {
		this.remark = remark;
	}



	public CommodityService getCommodityService() {
		return commodityService;
	}



	public void setShoppingCartService(ShoppingCartService shoppingCartService) {
		this.shoppingCartService = shoppingCartService;
	}


	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}


	public String getConsignee() {
		return consignee;
	}


	public void setConsignee(String consignee) {
		this.consignee = consignee;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getMobile() {
		return mobile;
	}


	public void setMobile(String mobile) {
		this.mobile = mobile;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getZipCode() {
		return zipCode;
	}


	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}


	public String getCarrierCode() {
		return carrierCode;
	}


	public void setCarrierCode(String carrierCode) {
		this.carrierCode = carrierCode;
	}


	public void setSendTypeCode(String sendTypeCode) {
		this.sendTypeCode = sendTypeCode;
	}


	public int getPaymentMethod() {
		return paymentMethod;
	}


	public void setPaymentMethod(int paymentMethod) {
		this.paymentMethod = paymentMethod;
	}


	public int getShippingMethod() {
		return shippingMethod;
	}


	public void setShippingMethod(int shippingMethod) {
		this.shippingMethod = shippingMethod;
	}



}
