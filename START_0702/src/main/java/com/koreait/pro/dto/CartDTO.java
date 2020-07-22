package com.koreait.pro.dto;

public class CartDTO {
	
	private int c_No, p_No, p_Price, p_State;
	private String m_Id, p_Img_Path, p_Name; // m_Id : 판매자 아이디
	
	public CartDTO() {}

	public CartDTO(int c_No, int p_No, int p_Price, int p_State, String m_Id, String p_Img_Path, String p_Name) {
		super();
		this.c_No = c_No;
		this.p_No = p_No;
		this.p_Price = p_Price;
		this.p_State = p_State;
		this.m_Id = m_Id;
		this.p_Img_Path = p_Img_Path;
		this.p_Name = p_Name;
	}

	public int getC_No() {
		return c_No;
	}

	public void setC_No(int c_No) {
		this.c_No = c_No;
	}

	public int getP_No() {
		return p_No;
	}

	public void setP_No(int p_No) {
		this.p_No = p_No;
	}

	public int getP_Price() {
		return p_Price;
	}

	public void setP_Price(int p_Price) {
		this.p_Price = p_Price;
	}

	public int getP_State() {
		return p_State;
	}

	public void setP_State(int p_State) {
		this.p_State = p_State;
	}

	public String getM_Id() {
		return m_Id;
	}

	public void setM_Id(String m_Id) {
		this.m_Id = m_Id;
	}

	public String getP_Img_Path() {
		return p_Img_Path;
	}

	public void setP_Img_Path(String p_Img_Path) {
		this.p_Img_Path = p_Img_Path;
	}

	public String getP_Name() {
		return p_Name;
	}

	public void setP_Name(String p_Name) {
		this.p_Name = p_Name;
	}


	
}
