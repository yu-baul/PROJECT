package com.koreait.pro.dto;

import java.sql.Date;

public class MemberDTO {
	
	private int m_No, m_Point, m_State, m_Money;
	private String m_Name, m_Id, m_Pw, m_Phone, m_Email, m_Address, m_Grade;
	private Date m_Regdate;
	
	public MemberDTO() {}

	public MemberDTO(int m_No, int m_Point, int m_State, int m_Money, String m_Name, String m_Id, String m_Pw,
			String m_Phone, String m_Email, String m_Address, String m_Grade, Date m_Regdate) {
		super();
		this.m_No = m_No;
		this.m_Point = m_Point;
		this.m_State = m_State;
		this.m_Money = m_Money;
		this.m_Name = m_Name;
		this.m_Id = m_Id;
		this.m_Pw = m_Pw;
		this.m_Phone = m_Phone;
		this.m_Email = m_Email;
		this.m_Address = m_Address;
		this.m_Grade = m_Grade;
		this.m_Regdate = m_Regdate;
	}

	public int getM_No() {
		return m_No;
	}

	public void setM_No(int m_No) {
		this.m_No = m_No;
	}

	public int getM_Point() {
		return m_Point;
	}

	public void setM_Point(int m_Point) {
		this.m_Point = m_Point;
	}

	public int getM_State() {
		return m_State;
	}

	public void setM_State(int m_State) {
		this.m_State = m_State;
	}

	public int getM_Money() {
		return m_Money;
	}

	public void setM_Money(int m_Money) {
		this.m_Money = m_Money;
	}

	public String getM_Name() {
		return m_Name;
	}

	public void setM_Name(String m_Name) {
		this.m_Name = m_Name;
	}

	public String getM_Id() {
		return m_Id;
	}

	public void setM_Id(String m_Id) {
		this.m_Id = m_Id;
	}

	public String getM_Pw() {
		return m_Pw;
	}

	public void setM_Pw(String m_Pw) {
		this.m_Pw = m_Pw;
	}

	public String getM_Phone() {
		return m_Phone;
	}

	public void setM_Phone(String m_Phone) {
		this.m_Phone = m_Phone;
	}

	public String getM_Email() {
		return m_Email;
	}

	public void setM_Email(String m_Email) {
		this.m_Email = m_Email;
	}

	public String getM_Address() {
		return m_Address;
	}

	public void setM_Address(String m_Address) {
		this.m_Address = m_Address;
	}

	public String getM_Grade() {
		return m_Grade;
	}

	public void setM_Grade(String m_Grade) {
		this.m_Grade = m_Grade;
	}

	public Date getM_Regdate() {
		return m_Regdate;
	}

	public void setM_Regdate(Date m_Regdate) {
		this.m_Regdate = m_Regdate;
	}
	
	

	
}
