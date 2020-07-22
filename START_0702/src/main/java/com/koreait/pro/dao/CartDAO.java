package com.koreait.pro.dao;

import java.util.ArrayList;
import java.util.Map;

import com.koreait.pro.dto.CartDTO;

public interface CartDAO {
	
	// 장바구니 목록 리스트
	public void cartInsert(String m_Id, int p_No);
	
	// 구매 목록 보기
	public ArrayList<CartDTO> selectCartList(Map<String, String> map);
	
	// 장바구니 수 
	public int getAllTotalRecord(String m_Id);
	
	// 구매 목록 보기
	public void cartDelete(int c_No);
	
	// 장바구니 들어있는지 확인
	public CartDTO selectCartByIdNo(String m_Id, int p_No);
	
	

}
