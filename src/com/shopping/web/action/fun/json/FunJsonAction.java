package com.shopping.web.action.fun.json;

import com.shopping.common.util.action.BaseAction;
import com.shopping.common.util.page.ResultCollection;
import com.shopping.domain.fun.Fun;
import com.shopping.service.fun.FunService;


/**
 * Function JsonAction
 * @author WangYue
 *
 */
public class FunJsonAction extends BaseAction {
   // private final static Log logger = LogFactory.getLog(FunJsonAction.class);
    
	private static final long serialVersionUID = 1L;

	/**
     * Fun information service interface
     */
    private FunService funService;
    
    /**
     * json result
     */
    private String result;
    
    /**
     * result msg
     */
    private String resultMsg;
    
    /**
     * Fun information value class
     */
    private Fun fun;
    
    /**
     * ids array
     */
    private Long[]ids;



    /**
     * Add fun method
     *
     * @return
     */
    public String addFun() {
        if (null != fun) {

            ResultCollection serviceResult = funService.addFun(fun); //call add() method
            
            if (null != serviceResult && serviceResult.getSuccess() && (Boolean) serviceResult.get("resultFlag")) {
                result = "true";
            } else {
                result = "false";
            }
        } else {
            result = "false";
        }
        return "out";
    }

    /**
     * Update fun method
     *
     * @return
     */
    public String updateFun() {
        if (null != fun) {

            ResultCollection serviceResult = funService.updateFun(fun);  //call updateFun() method
            
            if (null != serviceResult && serviceResult.getSuccess() && (Boolean) serviceResult.get("resultFlag")) {
                result = "true";
            } else {
                result = "false";
            }
        } else {
            result = "false";
        }
        return "out";
    }

    /**
     * Delete fun method
     *
     * @return
     */
    public String deleteFun() {
        if (null != fun && null!=fun.getId()) {
            ResultCollection serviceResult = funService.deleteFunById(fun.getId()); //call deleteFunById() method
            
            if (null != serviceResult && serviceResult.getSuccess() && (Boolean) serviceResult.get("resultFlag")) {
                result = "true";
            } else {
                result = "false";
            }
        } else {
            result = "false";
        }
        return "out";
    }
    
    /**
     * Delete Funs method
     *
     * @return
     */
    public String deleteFuns() {
        if(ids!=null&&ids.length>1){
        	
            ResultCollection serviceResult = funService.deleteFunByIds(ids); //call deleteFunByIds() method
            
            if (null != serviceResult && serviceResult.getSuccess() && (Boolean) serviceResult.get("resultFlag")) {
                result = "true";
            } else {
                result = "false";
            }
        }else {
            result = "false";
        }
        return "out";
    }
    
    
    /**
     * Check fun code method
     *
     * @return
     */
    public String checkFunCode() {
        if (null != fun) {

            ResultCollection serviceResult = funService.getFunByFunCode(fun.getFunCode());  //call getFunByFunCode() method
            
            if (null != serviceResult && serviceResult.getSuccess()) {
            	Fun fun=(Fun)serviceResult.get("fun");
            	if(fun!=null&&fun.getFunCode()!=null){
            		result = "exist";
            	}else{
            		result = "ok";
            	}
            } else {
            	result = "ok";
            }
        } 
        return "out";
    }

    
    public void setFunService(FunService funService) {
        this.funService = funService;
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

	public Fun getFun() {
		return fun;
	}

	public void setFun(Fun fun) {
		this.fun = fun;
	}

	public FunService getFunService() {
		return funService;
	}

	public Long[] getIds() {
		return ids;
	}

	public void setIds(Long[] ids) {
		this.ids = ids;
	}
  
}
