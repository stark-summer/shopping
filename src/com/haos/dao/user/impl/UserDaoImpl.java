package com.haos.dao.user.impl;

import java.util.List;

import com.haos.common.util.dao.BaseDao;
import com.haos.dao.user.UserDao;
import com.haos.domain.user.User;
import com.haos.domain.user.query.UserQuery;

/**
 * User information DAO implementation
 * @author WangYue
 *
 */
@SuppressWarnings("rawtypes")
public class UserDaoImpl extends BaseDao implements UserDao {

	@SuppressWarnings("unchecked")
	@Override
	public boolean addUser(User user) {
		return this.insert("User.insert", user);
	}
	@SuppressWarnings("unchecked")
	@Override
	public boolean updateUser(User user) {
		return this.update("User.update", user);
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean updateUserInfo(User user) {
		return this.update("User.updateUserInfo", user);
	}
	@SuppressWarnings("unchecked")
	@Override
	
	public boolean updateUserPassword(User user) {
		return this.update("User.updateUserPassword", user);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public boolean updateUserCommentCount(User user) {
		return this.update("User.updateUserCommentCount", user);
	}
	@SuppressWarnings("unchecked")
	@Override
	public boolean updateUserIntegralAndLevel(User user) {
		return this.update("User.updateUserIntegralAndLevel", user);
	}
	@SuppressWarnings("unchecked")
	@Override
	public User getUserById(Long id) {
		return (User)this.queryForObject("User.getUserById", id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public User getUserByUserCode(String userCode) {
		return (User)this.queryForObject("User.getUserByUserCode", userCode);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> queryUserListByQueryBean(UserQuery userQuery) {
		return this.queryForList("User.queryUserListByQueryBean",userQuery);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> queryUserListPageByQueryBean(UserQuery userQuery) {
		return this.queryForList("User.queryUserListPageByQueryBean", userQuery);
	}

	@SuppressWarnings("unchecked")
	@Override
	public boolean deleteUserById(Long id) {
		return this.delete("User.deleteUserById", id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public int queryUserCountByQueryBean(UserQuery userQuery) {
		return (Integer)this.queryForObject("User.queryUserCountByQueryBean", userQuery);
	}

}
