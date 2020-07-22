package com.koreait.pro.dao;

import java.util.ArrayList;
import java.util.Map;

import com.koreait.pro.dto.ProductDTO;

public interface ProductDAO {
	
	// 게시글 등록
	 public void productInsert(int s_No, String p_Name, String p_Cartegory, String p_Content, int p_Price, String p_Img_Path);
	
	// 판매 상품 리스트 메인페이지에 가져오기 
	public ArrayList<ProductDTO> selectProductList(Map<String, Integer> map);
	
	// 판매 상품 리스트 메인페이지 검색 결과 가져오기
	public ArrayList<ProductDTO> productSelectBymIdList(Map<String, String> map);
	
	// 검색된 가입회원 수 보기 - 유바울
	public int getSelectBymIdTotalRecord(String query);
	
	// 판매 상품 리스트 메인페이지 검색 결과 가져오기
	public ArrayList<ProductDTO> productSelectBypNameList(Map<String, String> map);
	
	// 검색된 가입회원 수 보기 - 유바울
	public int getSelectBypNameTotalRecord(String query);
	
	// 판매 상품  전체 개수  - 유바울
	public int getAllTotalRecord();
	// 상품 번호로 불러오기 VIEW 
	public ProductDTO selectProductByNo(int p_no);

	// 구매버튼 클릭시 상태 변경
    public void ProductUpdateState(int m_No, int p_No);

    // 관리자 승인
    public void ProductAgreeState(int p_No);
    
    // 본인이 올린 판매상품 삭제
    public void ProductDelete(int p_No);
    
    // 판매상품 수정
    public void ProductUpdate(int p_No, String p_Name, String p_Cartegory, String p_Content, int p_Price, String p_Img_Path);
    
    // 구매 목록 보기
  	public ArrayList<ProductDTO> selectProductBuyList(Map<String, Integer> map);
  	
  	// 구매한 목록의 수
  	public int getBuyAllTotalRecord(int m_No);
  	
  	// 판매 목록 보기
  	public ArrayList<ProductDTO> selectProductSellList(Map<String, Integer> map);
  	
  	// 판매한 목록의 수
  	public int getSellAllTotalRecord(int m_No);
 	
 	// 관리자가 판매목록 보기
 	public ArrayList<ProductDTO> productManagement(Map<String, Integer> map);
 	
 	// 관리자가 판매목록 수
 	public int getManagementTotalRecord();
 	
 	// 관리자가 판매목록 보기 p_State
 	public ArrayList<ProductDTO> productManagementState(Map<String, Integer> map);
 	
 	// 관리자가 판매목록 수 p_State
 	public int getManagementStateTotalRecord(int p_State);
 	
 	
 	
 	
 	// 카테고리 별로 보기
 	public ArrayList<ProductDTO> productCartegory(Map<String, String> map);
 	
 	// 카테고리 수 보기 - 유바울
 	public int getCartegoryAllTotalRecord(String p_Cartegory);
 	
 	// 카테고리 검색 목록 m_Id
 	public ArrayList<ProductDTO> productCartegoryBymId(Map<String, String> map);
 	
 	// 카테고리 검색 목록 수 m_Id
 	public int getCartegoryBymIdTotalRecord(Map<String, String> map);
 	
 	// 카테고리 검색 목록 p_Name
 	public ArrayList<ProductDTO> productCartegoryBypName(Map<String, String> map);
 	
 	// 카테고리 검색 목록 수 p_Name
 	public int getCartegoryBypNameTotalRecord(Map<String, String> map);
 	
 	
 	
 	
 	
 	
	// 카테고리 검색 목록 m_Id
 	public ArrayList<ProductDTO> productManagementStateBymId(Map<String, String> map);
 	
 	// 카테고리 검색 목록 수 m_Id
 	public int getManagementStateBymIdTotalRecord(Map<String, String> map);
 	
 	// 카테고리 검색 목록 p_Name
 	public ArrayList<ProductDTO> productManagementStateBypName(Map<String, String> map);
 	
 	// 카테고리 검색 목록 수 p_Name
 	public int getManagementStateBypNameTotalRecord(Map<String, String> map);
 	
 	
 	
 	// 조회수
   	public void updateHit(int p_No);
   	
   	// 관리자 승인취소, 상품 테이블 구매자 번호 널로 바꾸고, 상태 1로 바꾸고
   	public void ProductCancle(int p_No);
 	
 	
 	
 	
}














