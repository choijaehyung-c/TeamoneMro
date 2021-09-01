package mrone.teamone.beans;

import java.util.List;

import lombok.Data;

@Data
public class ClientOrderBean {
	private String OS_CODE;
	private String OS_CLCODE;
	private String CL_PWD;
	private String OS_DATE;
	private String OS_STATE;
	private String SP_CODE;
	private List<OrderDetailBean> OD;
}