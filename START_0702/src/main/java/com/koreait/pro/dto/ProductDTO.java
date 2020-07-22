package com.koreait.pro.dto;

import java.sql.Date;

public class ProductDTO {

	private int p_No, s_No, b_No, p_Price, p_Hit, p_State;
	private String p_Name, p_Cartegory, p_Content, p_Img_Path, m_Id;
	private Date p_Regdate;

	public ProductDTO() {}

	public ProductDTO(int p_No, int s_No, int b_No, int p_Price, int p_Hit, int p_State, String p_Name,
			String p_Cartegory, String p_Content, String p_Img_Path, String m_Id, Date p_Regdate) {
		super();
		this.p_No = p_No;
		this.s_No = s_No;
		this.b_No = b_No;
		this.p_Price = p_Price;
		this.p_Hit = p_Hit;
		this.p_State = p_State;
		this.p_Name = p_Name;
		this.p_Cartegory = p_Cartegory;
		this.p_Content = p_Content;
		this.p_Img_Path = p_Img_Path;
		this.m_Id = m_Id;
		this.p_Regdate = p_Regdate;
	}

	public int getP_No() {
		return p_No;
	}

	public void setP_No(int p_No) {
		this.p_No = p_No;
	}

	public int getS_No() {
		return s_No;
	}

	public void setS_No(int s_No) {
		this.s_No = s_No;
	}

	public int getB_No() {
		return b_No;
	}

	public void setB_No(int b_No) {
		this.b_No = b_No;
	}

	public int getP_Price() {
		return p_Price;
	}

	public void setP_Price(int p_Price) {
		this.p_Price = p_Price;
	}

	public int getP_Hit() {
		return p_Hit;
	}

	public void setP_Hit(int p_Hit) {
		this.p_Hit = p_Hit;
	}

	public int getP_State() {
		return p_State;
	}

	public void setP_State(int p_State) {
		this.p_State = p_State;
	}

	public String getP_Name() {
		return p_Name;
	}

	public void setP_Name(String p_Name) {
		this.p_Name = p_Name;
	}

	public String getP_Cartegory() {
		return p_Cartegory;
	}

	public void setP_Cartegory(String p_Cartegory) {
		this.p_Cartegory = p_Cartegory;
	}

	public String getP_Content() {
		return p_Content;
	}

	public void setP_Content(String p_Content) {
		this.p_Content = p_Content;
	}

	public String getP_Img_Path() {
		return p_Img_Path;
	}

	public void setP_Img_Path(String p_Img_Path) {
		this.p_Img_Path = p_Img_Path;
	}

	public String getM_Id() {
		return m_Id;
	}

	public void setM_Id(String m_Id) {
		this.m_Id = m_Id;
	}

	public Date getP_Regdate() {
		return p_Regdate;
	}

	public void setP_Regdate(Date p_Regdate) {
		this.p_Regdate = p_Regdate;
	}

	



}