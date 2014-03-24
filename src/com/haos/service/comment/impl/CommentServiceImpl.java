package com.haos.service.comment.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import com.haos.common.util.CommonConstant;
import com.haos.common.util.page.ResultCollection;
import com.haos.domain.comment.Comment;
import com.haos.domain.comment.query.CommentQuery;
import com.haos.domain.commodity.Commodity;
import com.haos.domain.level.Level;
import com.haos.domain.level.query.LevelQuery;
import com.haos.domain.user.User;
import com.haos.manager.comment.CommentManager;
import com.haos.manager.commodity.CommodityManager;
import com.haos.manager.level.LevelManager;
import com.haos.manager.user.UserManager;
import com.haos.service.comment.CommentService;

/**
 * Comment information service interface
 * @author WangYue
 *
 */
public class CommentServiceImpl implements CommentService {
    private static final Logger log = LogManager.getLogger(CommentServiceImpl.class);
	/**
	 * comment information manager interface
	 */
    private CommentManager commentManager;
	
	/** 
	 * commodity information manager interface
	 */
	private CommodityManager commodityManager;
	
	/** 
	 * user information manager interface
	 */
	private UserManager userManager;
	
	/**
	 * level information manager interface
	 */
	private LevelManager levelManager;
	@Override
	public ResultCollection addComment(Comment comment) {
		if(null!=comment){
			
			ResultCollection result = new ResultCollection();
			Long commdityId=comment.getCommodityId(); //get commodity id from comment object
			if(null!=commdityId&&commdityId>0){
				Commodity commodity=commodityManager.getCommodityById(commdityId); // call getCommodityId() method
				if(null!=commodity){
					comment.setCommodityCode(commodity.getCommodityCode()); //set commodity code
					comment.setCommodityName(commodity.getCategoryName());// set commodity name
					if(StringUtils.isBlank(comment.getShortcoming())){
						comment.setShortcoming("暂时还没发现缺点哦！"); //set shortcoming
					}
					comment.setCommentTime(new Date());//set comment time
					comment.setCreateTime(new Date());//set create time
					comment.setUpdateTime(new Date()); //set update time
					comment.setYn(CommonConstant.YN_NO_DELETE); //set yn =0
					try {
						boolean resultFlag = commentManager.addComment(comment);
						if(resultFlag){
							Long commentCount=commodity.getCommentCount();
							if(null==commentCount){
								commentCount=0L;
							}
							commentCount++; //set comment count +1
							commodity.setUpdateTime(new Date()); //set update time
							boolean updateCommodityFlag=commodityManager.updateCommodityCommentCount(commodity);
							
							if(!updateCommodityFlag){
								log.error("CommentServiceImpl ->updateCommodityCommentCount error!!");
								throw new RuntimeException("CommentServiceImpl -> updateCommodityCommentCount error!!");
							}
							String userCode=comment.getUserCode();  //get user  code from comment
							if(!StringUtils.isBlank(userCode)){
								User u=userManager.getUserByUserCode(userCode); //call getUserByUserCode()method
								if(null!=u){
									Long cc=u.getCommentCount(); // get comment count from u
									if(null==cc){
										cc=0L;
									}
									cc++;  //comment count +1
									u.setCommentCount(cc);  //set comment count
									boolean updateUserCommentCountFlag=userManager.updateUserCommentCount(u); // call  updateUserCommentUser() method
									if(!updateUserCommentCountFlag){
										log.error("CommentServiceImpl ->updateUserCommentCount error!!");
										throw new RuntimeException("CommentServiceImpl -> updateUserCommentCount error!!");
									}
									
									//user integral and level command
	                            	Long integral =u.getIntegral(); // get integral from u
	                            	if(null==integral){
	                            		integral=0L;
	                            	}
	                            	integral=integral+CommonConstant.INTEGRAL_ORDER; //submit order will plus 2 integral
	                            	
	                            	List<Level> levelList=levelManager.queryLevelListByQueryBean(new LevelQuery()); //call queryLevelListByQueryBean()method
	                            	if(null!=levelList&&levelList.size()>0){
	                            		for(Level l:levelList){
	                            			if(integral>=l.getStartPoint()&&integral<=l.getEndPoint()){
	                            				u.setLevelCode(l.getLevelCode());  //set level code
	                            				u.setLevelName(l.getLevelName()); //set level name
	                            				break;
	                            			}
	                            		}
	                            		
	                            	}
	                            	
	                            	boolean updateUserIntegralAndLevelFlag=userManager.updateUserIntegralAndLevel(u); //call updateUserIntegralAndLevel() method
	                            	if(!updateUserIntegralAndLevelFlag){
	                            		 log.error("OrderServiceImpl -> addOrder()->>updateUserIntegralAndLevel error!!");
	                        			 throw new RuntimeException("OrderServiceImpl.addOrder->>updateUserIntegralAndLevel error!!");
	                            	}
									
								}else{
									log.error("CommentServiceImpl -> addComment() user empty!!");
									throw new RuntimeException("CommentServiceImpl -> addComment() user empty!!");
								}
								
							}else{
								log.error("CommentServiceImpl -> addComment() user  code empty!!");
								throw new RuntimeException("CommentServiceImpl -> addComment() user  code empty!!");
							}
							
						}
						result.addDefaultModel("resultFlag", resultFlag);
						result.setSuccess(true);
					} catch (Exception e) {
						log.error("CommentServiceImpl -> addComment() error!!", e);
						throw new RuntimeException("CommentServiceImpl -> addComment() error!!",e);
					}
					return result;
					
				}else{
					log.error("CommentServiceImpl -> addComment() commodity empty!!");
					throw new RuntimeException("CommentServiceImpl -> addComment() commodity empty!!");
				}
				
			}else{
				log.error("CommentServiceImpl -> addComment() commodity id empty!!");
				throw new RuntimeException("CommentServiceImpl -> addComment() commodity id empty!!");
			}
			
			
		}else{
			log.error("CommentServiceImpl -> addComment() comment empty!!");
			throw new RuntimeException("CommentServiceImpl -> addComment() comment empty!!");
		}
	}

	@Override
	public ResultCollection updateComment(Comment comment) {
		if(null!=comment){
			
			ResultCollection result = new ResultCollection();
			String commodityCode=comment.getCommodityCode(); //get commodity code from comment object
			if(null!=commodityCode&&commodityCode.length()>0){
				Commodity commodity=commodityManager.getCommodityByCommodityCode(commodityCode); // call getCommodityByCommodityCode() method
				if(null!=commodity){
					comment.setCommodityCode(commodity.getCommodityCode()); //set commodity code
					comment.setCommodityName(commodity.getCategoryName());// set commodity name
					comment.setCommentTime(new Date());//set comment time
					comment.setUpdateTime(new Date()); //set update time
					try {
						boolean resultFlag = commentManager.updateComment(comment);
						result.addDefaultModel("resultFlag", resultFlag);
						result.setSuccess(true);
					} catch (Exception e) {
						log.error("CommentServiceImpl -> updateComment() error!!", e);
						throw new RuntimeException("CommentServiceImpl -> updateComment() error!!",e);
					}
					return result;
					
				}else{
					log.error("CommentServiceImpl -> updateComment() commodity empty!!");
					throw new RuntimeException("CommentServiceImpl -> updateComment() commodity empty!!");
				}
				
			}else{
				log.error("CommentServiceImpl -> updateComment() commodity id empty!!");
				throw new RuntimeException("CommentServiceImpl -> updateComment() commodity id empty!!");
			}
			
			
		}else{
			log.error("CommentServiceImpl -> updateComment() comment empty!!");
			throw new RuntimeException("CommentServiceImpl -> updateComment() comment empty!!");
		}
	}

	@Override
	public ResultCollection getCommentById(Long id) {
		 ResultCollection result = new ResultCollection();
	        try {
	            Comment comment = commentManager.getCommentById(id);
	            result.addDefaultModel("comment", comment);
	            result.setSuccess(true);
	        } catch (Exception e) {
	            log.error("CommentServiceImpl -> getCommentById() error!!", e);
	        }
	        return result;
	}

	@Override
	public ResultCollection getCommentByCommodityIdAndUserCode(CommentQuery commentQuery) {
		if(null!=commentQuery){
			Long commodityId=commentQuery.getCommodityId();  //get commodity id
			if(null!=commodityId){
				Commodity commodity=commodityManager.getCommodityById(commodityId); // call getCommodityById()method
				if(commodity!=null){
					ResultCollection result = new ResultCollection();
					result.addDefaultModel("commodity", commodity);
			        try {
			            Comment comment = commentManager.getCommentByCommodityIdAndUserCode(commentQuery);
			            if(null!=comment){
			            	result.addDefaultModel("comment", comment);
			            	result.setSuccess(true);
			            }
			        } catch (Exception e) {
			            log.error("CommentServiceImpl -> getCommentByCommentCode() error!!", e);
			        }
			        return result;
				}else{
					log.error("CommentServiceImpl -> getCommentByCommodityIdAndUserCode() commodity  empty!!");
					throw new RuntimeException("CommentServiceImpl -> getCommentByCommodityIdAndUserCode() commodity  empty!!");
				}
				
			}else{
				log.error("CommentServiceImpl -> getCommentByCommodityIdAndUserCode() commodity id empty!!");
				throw new RuntimeException("CommentServiceImpl -> getCommentByCommodityIdAndUserCode() commodity id empty!!");
			}
		}else{
			log.error("CommentServiceImpl -> getCommentByCommodityIdAndUserCode() comment query empty!!");
			throw new RuntimeException("CommentServiceImpl -> getCommentByCommodityIdAndUserCode() comment query empty!!");
		}
	}

	@Override
	public ResultCollection queryCommentListByQueryBean(CommentQuery commentQuery) {
		ResultCollection result = new ResultCollection();
        try {
            List<Comment> commentList = commentManager.queryCommentListByQueryBean(commentQuery);
            result.addDefaultModel("commentList", commentList);
            result.setSuccess(true);
        } catch (Exception e) {
            log.error("CommentServiceImpl -> queryCommentListByQueryBean() error!!", e);
        }
        return result;
	}

	@Override
	public ResultCollection queryCommentListPageByQueryBean(CommentQuery commentQuery,
			int pageIndex, int pageSize) {
		ResultCollection result = new ResultCollection();
        try {
            List<Comment> commentList = commentManager.queryCommentListPageByQueryBean(commentQuery,pageIndex,pageSize);
            result.addDefaultModel("commentList", commentList);
            result.setSuccess(true);
        } catch (Exception e) {
            log.error("CommentServiceImpl -> queryCommentListPageByQueryBean() error!!", e);
        }
        return result;
	}

	@Override
	public ResultCollection deleteCommentById(Long id) {
		 ResultCollection result = new ResultCollection();
	        try {
	            boolean resultFlag = commentManager.deleteCommentById(id);
	            result.addDefaultModel("resultFlag", resultFlag);
	            result.setSuccess(true);
	        } catch (Exception e) {
	            log.error("CommentServiceImpl -> deleteCommentById() error!!", e);
	        }
	        return result;
	}
	
	
	@Override
	public ResultCollection deleteCommentByIds(Long ids[]){
		 ResultCollection result = new ResultCollection();
	        try {
	        	if(null!=ids&&ids.length>0){
	        		boolean resultFlag = commentManager.deleteCommentByIds(ids);
	        		result.addDefaultModel("resultFlag", resultFlag);
	        		result.setSuccess(true);
	        		
	        	}else{
	        		 log.error("CommentServiceImpl -> deleteCommentById() ids param null!!");
	        	}
	        } catch (Exception e) {
	            log.error("CommentServiceImpl -> deleteCommentById() error!!", e);
	        }
	    return result;
	}

	public void setCommentManager(CommentManager commentManager) {
		this.commentManager = commentManager;
	}

	public void setCommodityManager(CommodityManager commodityManager) {
		this.commodityManager = commodityManager;
	}

	public void setUserManager(UserManager userManager) {
		this.userManager = userManager;
	}

	public void setLevelManager(LevelManager levelManager) {
		this.levelManager = levelManager;
	}
	
}
