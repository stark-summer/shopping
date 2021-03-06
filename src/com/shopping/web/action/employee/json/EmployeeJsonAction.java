package com.shopping.web.action.employee.json;

import java.io.File;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.shopping.common.util.CommonConstant;
import com.shopping.common.util.action.BaseAction;
import com.shopping.common.util.page.ResultCollection;
import com.shopping.domain.employee.Employee;
import com.shopping.service.employee.EmployeeService;

/**
 * Employee JsonAction
 * 
 * @author WangYue
 * 
 */
public class EmployeeJsonAction extends BaseAction {
	// private final static Log logger =
	// LogFactory.getLog(EmployeeJsonAction.class);

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * employee information service interface
	 */
	private EmployeeService employeeService;

	/**
	 * json result
	 */
	private String result;

	/**
	 * result msg
	 */
	private String resultMsg;

	/**
	 * employee
	 */
	private Employee employee;

	/**
	 * ids array
	 */
	private Long[] ids;

	/**
	 * employee code
	 */
	private String employeeCode;

	/**
	 * employee password
	 */
	private String password;

	/**
	 * add employee page
	 * 
	 * @return
	 */
	public String addEmployee() {
		if (null != employee) {

			ResultCollection serviceResult = employeeService
					.addEmployee(employee);

			if (null != serviceResult && serviceResult.getSuccess()
					&& (Boolean) serviceResult.get("resultFlag")) {
				try {
					savePhoto();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				result = "true";
			} else {
				result = "false*" + (String) serviceResult.get("resultMsg");
			}
		} else {
			result = "false";
		}
		return "out";
	}

	/**
	 * update employee
	 * 
	 * @return
	 */
	public String updateEmployee() {
		if (null != employee) {

			ResultCollection serviceResult = employeeService
					.updateEmployee(employee);

			if (null != serviceResult && serviceResult.getSuccess()
					&& (Boolean) serviceResult.get("resultFlag")) {
				result = "true";
			} else {
				result = "false*" + (String) serviceResult.get("resultMsg");
			}
		} else {
			result = "false";
		}
		return "out";
	}

	/**
	 * update employee password
	 * 
	 * @return
	 */
	public String updateEmployeePassword() {

		if (StringUtils.isNotBlank(employeeCode)) {
			ResultCollection employeeResult = employeeService
					.getEmployeeByEmployeeCode(employeeCode);
			if (null != employeeResult) {
				Employee emp = (Employee) employeeResult.get("employee");

				if (emp != null) {
					if (StringUtils.isNotBlank(password)) {

						emp.setPassword(password);		//set password
						
						// call updateEmployee()method
						ResultCollection serviceResult = employeeService
								.updateEmployee(emp); 

						if (null != serviceResult) {
							if (null != serviceResult
									&& serviceResult.getSuccess()
									&& (Boolean) serviceResult
											.get("resultFlag")) {
								result = "true";
							} else {
								result = "密码修改失败";
							}

						} else {
							result = "员工账号不正确";
						}

					} else {
						result = "密码为空";
					}
				} else {
					result = "员工账号不正确";
				}
			} else {
				result = "员工账号不正确";
			}

		} else {
			result = "员工账号为空";
		}

		return "out";
	}
	
	
	/**
	 * update employee status
	 * 
	 * @return
	 */
	public String updateEmployeeStatus() {

		if (!org.apache.commons.lang.StringUtils.isBlank(employeeCode)) {
			ResultCollection employeeResult = employeeService
					.getEmployeeByEmployeeCode(employeeCode);
			if (null != employeeResult) {
				Employee emp = (Employee) employeeResult.get("employee");

				if (emp != null) {
					int status = emp.getStatus();
					if (0 == status) {

						emp.setStatus(CommonConstant.STATUS_AVAILABLE); // set
																		// employee
																		// status
																		// available
						ResultCollection serviceResult = employeeService
								.updateEmployee(emp); // call
														// updateEmployee()method

						if (null != serviceResult) {
							if (null != serviceResult
									&& serviceResult.getSuccess()
									&& (Boolean) serviceResult
											.get("resultFlag")) {
								result = "true";
							} else {
								result = "添入失败";
							}

						} else {
							result = "员工账号不正确";
						}

					} else {
						result = "该账号已加入";
					}
				} else {
					result = "员工账号不正确";
				}
			} else {
				result = "员工账号不正确";
			}

		} else {
			result = "员工账号为空";
		}

		return "out";
	}
	
	
	

	/**
	 * delete employee
	 * 
	 * @return
	 */
	public String deleteEmployee() {
		System.out.println(ids);
		if (null != employee.getId() && employee.getId().intValue() > 0) {
			ResultCollection serviceResult = employeeService
					.deleteEmployeeById(employee.getId()); // call
															// deleteEmployeeById()method

			if (null != serviceResult && serviceResult.getSuccess()
					&& (Boolean) serviceResult.get("resultFlag")) {
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
	 * delete employees
	 * 
	 * @return
	 */
	public String deleteEmployees() {
		if (ids != null && ids.length > 1) {
			ResultCollection serviceResult = employeeService
					.deleteEmployeeByIds(ids); // call deleteEmployees()method

			if (null != serviceResult && serviceResult.getSuccess()
					&& (Boolean) serviceResult.get("resultFlag")) {
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
	 * check employee code
	 * 
	 * @return
	 */
	public String checkEmployeeCode() {
		if (null != employee) {

			ResultCollection serviceResult = employeeService
					.getEmployeeByEmployeeCode(employee.getEmployeeCode());

			if (null != serviceResult && serviceResult.getSuccess()) {
				Employee employee = (Employee) serviceResult.get("employee");
				if (employee != null && employee.getEmployeeCode() != null) {
					result = "exist";
				} else {
					result = "ok";
				}
			} else {
				result = "ok";
			}
		}
		return "out";
	}

	/**
	 * check employee code
	 * 
	 * @return
	 */
	public String checkEmployeePassword() {
		if (StringUtils.isNotBlank(employeeCode)) {
			ResultCollection serviceResult = employeeService
					.getEmployeeByEmployeeCode(employeeCode);

			if (null != serviceResult && serviceResult.getSuccess()) {
				Employee employee = (Employee) serviceResult.get("employee");
				if (employee != null && employee.getEmployeeCode() != null) {
					if (StringUtils.isNotBlank(password)) {
						if (password.equals(employee.getPassword())) {
							result = "true";
						} else {
							result = "false";
						}
					} else {
						result = "false";
					}
				} else {
					result = "false";
				}
			} else {
				result = "false";
			}
		}
		return "out";
	}

	/**
	 * Save photo method
	 */
	public void savePhoto() throws Exception {

		String realPath = ServletActionContext.getServletContext().getRealPath(
				"/empPhoto"); // 取得项目中upload文件的路径

		// 判断上传的文件是否为null
		if (null != employee && null != employee.getEmployeePhoto()) {

			File saveFile = new File(new File(realPath),
					employee.getEmployeePhotoFileName()); // 根据创建文件名称上传的图片名称

			// 如果empPhoto文件不存在，将会自动创建。
			if (!saveFile.getParentFile().exists()) {
				saveFile.getParentFile().mkdirs();
			}

			FileUtils.copyFile(employee.getEmployeePhoto(), saveFile); // 调用FileUtils.copyFile方法
		}

	}

	/**
	 * delete photo method
	 */
	public void deletePhoto() throws Exception {

		String realPath = ServletActionContext.getServletContext().getRealPath(
				"/empPhoto"); // 取得项目中upload文件的路径

		// 判断图片的名字是否为null
		if (null != employee && null != employee.getEmployeePhoto()) {

			File deleteFile = new File(new File(realPath),
					employee.getEmployeePhotoFileName()); // 根据创建删除文件，名字就是图片的名字。

			// 如果empPhoto文件不存在，将会自动创建。
			if (!deleteFile.getParentFile().exists()) {
				deleteFile.getParentFile().mkdirs();
			}
			// 判断deleteFile是否为null
			if (deleteFile != null) {
				deleteFile.delete(); // 调用delete方法
			}

		}

	}

	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
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

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public EmployeeService getEmployeeService() {
		return employeeService;
	}

	public Long[] getIds() {
		return ids;
	}

	public void setIds(Long[] ids) {
		this.ids = ids;
	}

	public String getEmployeeCode() {
		return employeeCode;
	}

	public void setEmployeeCode(String employeeCode) {
		this.employeeCode = employeeCode;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
