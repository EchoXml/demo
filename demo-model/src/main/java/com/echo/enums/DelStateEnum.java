package com.echo.enums;

/**
 * 删除常量数据字典
 * @author Echo
 *
 */
public enum DelStateEnum {
	
	SUCCESS(1,"删除成功"),FIAID(-1,"删除失败"),ERROR(0,"系统异常");
	
	private int state;

    private String stateInfo;
    
    private DelStateEnum(int state,String stateInfo){
    	this.setState(state);
    	this.setStateInfo(stateInfo);
    	
    }

	public String getStateInfo() {
		return stateInfo;
	}

	public void setStateInfo(String stateInfo) {
		this.stateInfo = stateInfo;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

    
}
