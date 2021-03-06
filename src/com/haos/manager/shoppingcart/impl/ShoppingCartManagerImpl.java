package com.haos.manager.shoppingcart.impl;

import java.util.Date;
import java.util.List;

import com.haos.common.util.manager.BaseManager;
import com.haos.dao.shoppingcart.ShoppingCartDao;
import com.haos.domain.shoppingcart.ShoppingCart;
import com.haos.domain.shoppingcart.query.ShoppingCartQuery;
import com.haos.manager.shoppingcart.ShoppingCartManager;

/**
 * ShoppingCart information DAO implementation
 * @author WangYue
 *
 */
public class ShoppingCartManagerImpl extends BaseManager implements ShoppingCartManager {
	
	private ShoppingCartDao shoppingCartDao;

	@Override
	public boolean addShoppingCart(ShoppingCart shoppingCart) {
		return shoppingCartDao.addShoppingCart(shoppingCart);
	}

	@Override
	public boolean updateShoppingCart(ShoppingCart shoppingCart) {
		shoppingCart.setUpdateTime(new Date());//set update time
		return shoppingCartDao.updateShoppingCart(shoppingCart);
	}

	@Override
	public ShoppingCart getShoppingCartById(Long id) {
		return (ShoppingCart)shoppingCartDao.getShoppingCartById(id);
	}

	@Override
	public List<ShoppingCart> queryShoppingCartByUserCode(String userCode) {
		return (List<ShoppingCart>)shoppingCartDao.queryShoppingCartByUserCode(userCode);
	}

	@Override
	public List<ShoppingCart> queryShoppingCartByCommodityCode(String commodityCodeCode) {
		return (List<ShoppingCart>)shoppingCartDao.queryShoppingCartByCommodityCode(commodityCodeCode);
	}

	@Override
	public List<ShoppingCart> queryShoppingCartListByQueryBean(ShoppingCartQuery shoppingCartQuery) {
		return (List<ShoppingCart>)shoppingCartDao.queryShoppingCartListByQueryBean(shoppingCartQuery);
	}

	@Override
	public boolean deleteShoppingCartById(Long id) {
		return shoppingCartDao.deleteShoppingCartById(id);
	}

	@Override
	public boolean updateShoppingCartCommodityNum(ShoppingCart shoppingCart) {
		return shoppingCartDao.updateShoppingCartCommodityNum(shoppingCart);
	}

	public void setShoppingCartDao(ShoppingCartDao shoppingCartDao) {
		this.shoppingCartDao = shoppingCartDao;
	}
	
	
	
}
