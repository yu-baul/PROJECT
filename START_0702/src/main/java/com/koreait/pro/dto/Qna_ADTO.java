package com.koreait.pro.dto;

import java.sql.Date;

public class Qna_ADTO {
	
	private int a_No, q_No;
	private String a_Content;
	private Date a_Date;
	
	public Qna_ADTO() {}

	public Qna_ADTO(int a_No, int q_No, String a_Content, Date a_Date) {
		super();
		this.a_No = a_No;
		this.q_No = q_No;
		this.a_Content = a_Content;
		this.a_Date = a_Date;
	}

	public int getA_No() {
		return a_No;
	}

	public void setA_No(int a_No) {
		this.a_No = a_No;
	}

	public int getQ_No() {
		return q_No;
	}

	public void setQ_No(int q_No) {
		this.q_No = q_No;
	}

	public String getA_Content() {
		return a_Content;
	}

	public void setA_Content(String a_Content) {
		this.a_Content = a_Content;
	}

	public Date getA_Date() {
		return a_Date;
	}

	public void setA_Date(Date a_Date) {
		this.a_Date = a_Date;
	}

}
