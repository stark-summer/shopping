package com.haos.service.shoppingcart.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.xwork.StringUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.haos.common.util.CommonConstant;
import com.haos.common.util.page.ResultCollection;
import com.haos.domain.commodity.Commodity;
import com.haos.domain.shoppingcart.ShoppingCart;
import com.haos.domain.shoppingcart.query.ShoppingCartQuery;
import com.haos.manager.commodity.CommodityManager;
import com.haos.manager.shoppingcart.ShoppingCartManager;
import com.haos.service.shoppingcart.ShoppingCartService;

/**
 * ShoppingCart information DAO implementation
 * @author WangYue
 *
 */
public class ShoppingCartServiceImpl  implements ShoppingCartService {
	 private static final Logger log = LogManager.getLogger(ShoppingCartServiceImpl.class);
	
	/**
	 * Recently Viewed Manager interface
	 */
	private ShoppingCartManager shoppingCartManager;
	
	/**
	 * Commodity Manager interface
	 */
	private CommodityManager commodityManager;

	@Override
	public ResultCollection addShoppingCart(ShoppingCart shoppingCart) {
		
		if(null!=shoppingCart){
			Long commodityId= shoppingCart.getCommodityId();
			if(null!=commodityId&&commodityId>0){
			    Commodity commodity =commodityManager.getCommodityById(commodityId);   //call getCommodityById() method
			    if(null!=commodity&&null!=commodity.getId()){
	        		String commodityCode=commodity.getCommodityCode();
	        		if(!StringUtils.isBlank(commodityCode)){
	        			
	        			List<ShoppingCart> shoppingCartList =shoppingCartManager.queryShoppingCartByCommodityCode(commodityCode); //call queryShoppingCartByCommodityCode() method
	        			
	        			Long oldCommodityNum=0L;
	        			
	        			 ResultCollection result = new ResultCollection();
	        			if(null!=shoppingCartList&&shoppingCartList.size()>0){
	        				if(1==shoppingCartList.size()){
	        					oldCommodityNum=shoppingCartList.get(0).getCommodityNum(); //get old commodity number
	        					shoppingCart.setId(shoppingCartList.get(0).getId());  //set shopping cart id
	        				}else{
	        					for(ShoppingCart sc:shoppingCartList){
	        						oldCommodityNum=sc.getCommodityNum(); //get old commodity number
	        						shoppingCart.setId(sc.getId());
	        					}
	        				}
	        				Long commodityNum= shoppingCart.getCommodityNum(); //get commodity number
	        				///commodityNum >0 ?
	        				if(null!=commodityNum&&commodityNum>0){
	        					commodityNum=oldCommodityNum+commodityNum;
	        					shoppingCart.setCommodityNum(commodityNum);  //set commodity number
	        				}else{
	        					oldCommodityNum=oldCommodityNum++;
	        					shoppingCart.setCommodityNum(oldCommodityNum); //set commodity number +1
	        				}
	        				shoppingCart.setUpdateTime(new Date()); //set update time
	        				boolean resultFlag=shoppingCartManager.updateShoppingCartCommodityNum(shoppingCart);// call updateShoppingCartCommodityNum mehtod
	        				if(!resultFlag){
	        					log.error("ShoppingCartServiceImpl -> addShoppingCart() updateShoppingCartCommodityNum error");
	        					throw new RuntimeException("ShoppingCartServiceImpl -> addShoppingCart() updateShoppingCartCommodityNum error");
	        				}
	        				result.addDefaultModel("resultFlag", resultFlag);
	        	            result.setSuccess(resultFlag);
	        	            return result;
	        				
	        			}else{
	        				
	        				
	        				shoppingCart.setCommodityId(commodity.getId()); //set commodity id
	        				shoppingCart.setCommodityCode(commodity.getCommodityCode()); //set commodity code
	        				shoppingCart.setCommodityName(commodity.getCommodityName()); //set commodity name
	        				shoppingCart.setCommodityPhoto(commodity.getCommodityPhoto()); //set commodity photo
	        				shoppingCart.setViewedCount(commodity.getViewedCount()); //set commodity viewed count
	        				shoppingCart.setCommentCount(commodity.getCommentCount()); //set commodity comment count
	        				
	        				//new price  < old price
	        				if(null!=commodity.getNewPrice()&&commodity.getNewPrice()>0){
	        					Double price=commodity.getNewPrice()<commodity.getPrice()?commodity.getNewPrice():commodity.getPrice();
	        					shoppingCart.setPrice(price); //set price
	        					
	        				}else{
	        					shoppingCart.setPrice(commodity.getPrice()); //set price
	        				}
	        				
	        				Long commodityNum= shoppingCart.getCommodityNum(); //get commodity number
	        				///commodityNum >0 ?
	        				if(null!=commodityNum&&commodityNum>0){
	        					shoppingCart.setCommodityNum(commodityNum);  //set commodity number
	        				}else{
	        					shoppingCart.setCommodityNum(1L); //set commodity number =1
	        				}
	        				
	        				shoppingCart.setStatus(commodity.getStatus());  //set shoppingCart status =0 
	        				shoppingCart.setCreateTime(new Date()); //set create time
	        				shoppingCart.setUpdateTime(new Date()); //set update time
	        				shoppingCart.setYn(CommonConstant.YN_NO_DELETE);  //set yn=0
	        				boolean resultFlag=shoppingCartManager.addShoppingCart(shoppingCart);  //call addShoppingCart()method
	        				if(!resultFlag){
	        					log.error("ShoppingCartServiceImpl -> addShoppingCart()  error");
	        					throw new RuntimeException("ShoppingCartServiceImpl -> addShoppingCart()  error");
	        				}
	        				result.addDefaultModel("resultFlag", resultFlag);
	        	            result.setSuccess(resultFlag);
	        	            return result;
	        				
	        			}
	        		}else{
	        			log.error("ShoppingCartServiceImpl -> addShoppingCart() commodityCode  empty");
						throw new RuntimeException("ShoppingCartServiceImpl -> addShoppingCart() commodityCode empty");
	        		}
	        		
			    	
			    }else{
			    	log.error("ShoppingCartServiceImpl -> addShoppingCart() commodity  empty");
					throw new RuntimeException("ShoppingCartServiceImpl -> addShoppingCart() commodity empty");
			    }
			    
			}else{
				log.error("ShoppingCartServiceImpl -> addShoppingCart() commodity id empty");
				throw new RuntimeException("ShoppingCartServiceImpl -> addShoppingCart() commodity id empty");
			}
			
		}else{
			log.error("ShoppingCartServiceImpl -> addShoppingCart() shoppingCart empty");
			throw new RuntimeException("ShoppingCartServiceImpl -> addShoppingCart() shoppingCart empty");
		}
		
        
	        
	}
	
	public void setCommodityManager(CommodityManager commodityManager) {
		this.commodityManager = commodityManager;
	}

	@Override
	public ResultCollection updateShoppingCart(ShoppingCart shoppingCart) {
		 ResultCollection result = new ResultCollection();
	        try {
	            boolean resultFlag = shoppingCartManager.updateShoppingCart(shoppingCart);
	            result.addDefaultModel("resultFlag", resultFlag);
	            result.setSuccess(true);
	        } catch (Exception e) {
	            log.error("ShoppingCartServiceImpl -> updateShoppingCart() error!!", e);
	        }
	        return result;
	}


	@Override
	public ResultCollection getShoppingCartById(Long id) {
		 ResultCollection result = new ResultCollection();
	        try {
	            ShoppingCart shoppingCart = shoppingCartManager.getShoppingCartById(id);
	            result.addDefaultModel("shoppingCart", shoppingCart);
	            result.setSuccess(true);
	        } catch (Exception e) {
	            log.error("ShoppingCartServiceImpl -> getShoppingCartById() error!!", e);
	        }
	        return result;
	}


	@Override
	public ResultCollection queryShoppingCartByCommodityCode(String commodityCode) {
		 ResultCollection result = new ResultCollection();
	        try {
	        	List<ShoppingCart> shoppingCartList = shoppingCartManager.queryShoppingCartByCommodityCode(commodityCode);
	            result.addDefaultModel("shoppingCartList", shoppingCartList);
	            result.setSuccess(true);
	        } catch (Exception e) {
	            log.error("ShoppingCartServiceImpl -> queryShoppingCartByCommodityCode() error!!", e);
	        }
	        return result;
	}


	@Override
	public ResultCollection updateShoppingCartCommodityNum(ShoppingCart shoppingCart) {
		 ResultCollection result = new ResultCollection();
	        try {
	            boolean resultFlag = shoppingCartManager.updateShoppingCartCommodityNum(shoppingCart);
	            result.addDefaultModel("resultFlag", resultFlag);
	            result.setSuccess(true);
	        } catch (Exception e) {
	            log.error("ShoppingCartServiceImpl -> updateShoppingCartCommodityNum() error!!", e);
	        }
	        return result;
	}


	@Override
	public ResultCollection queryShoppingCartByUserCode(String userCode) {
		ResultCollection result = new ResultCollection();
        try {
            List<ShoppingCart> shoppingCartList = shoppingCartManager.queryShoppingCartByUserCode(userCode);
            Double totalPrice=0d;
            if(null!=shoppingCartList){
            	for(ShoppingCart sc:shoppingCartList){
            		totalPrice+=sc.getPrice()*sc.getCommodityNum();
            	}
            }
            
            result.addDefaultModel("totalPrice", totalPrice);
            result.addDefaultModel("shoppingCartList", shoppingCartList);
            result.setSuccess(true);
        } catch (Exception e) {
            log.error("ShoppingCartServiceImpl -> queryShoppingCartByUserCode() error!!", e);
        }
        return result;
	}


	@Override
	public ResultCollection queryShoppingCartListByQueryBean(ShoppingCartQuery shoppingCartQuery) {
		 ResultCollection result = new ResultCollection();
	        try {
	            List<ShoppingCart> shoppingCartList = shoppingCartManager.queryShoppingCartListByQueryBean(shoppingCartQuery);
	            result.addDefaultModel("shoppingCartList", shoppingCartList);
	            result.setSuccess(true);
	        } catch (Exception e) {
	            log.error("ShoppingCartServiceImpl -> queryShoppingCartListByQueryBean() error!!", e);
	        }
	        return result;
	}

	@Override
	public ResultCollection deleteShoppingCartById(Long id) {
		 ResultCollection result = new ResultCollection();
	        try {
	            boolean resultFlag = shoppingCartManager.deleteShoppingCartById(id);
	            result.addDefaultModel("resultFlag", resultFlag);
	            result.setSuccess(true);
	        } catch (Exception e) {
	            log.error("ShoppingCartServiceImpl -> deleteShoppingCartById() error!!", e);
	        }
	        return result;
	}


	public void setShoppingCartManager(ShoppingCartManager shoppingCartManager) {
		this.shoppingCartManager = shoppingCartManager;
	}


	
}
