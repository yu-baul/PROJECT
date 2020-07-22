package com.koreait.pro.dao;

import java.util.ArrayList;
import java.util.Map;

import com.koreait.pro.dto.Qna_QDTO;

public interface Qna_qDAO {
	
	// 1:1 문의 등록하기 - 유바울
	public void qna_qInsert(int m_No, String q_Cartegory, String q_Title, String q_Content);
	
	// 자기가 문의한 1:1 문의글 리스트 가져오기 - 유바울
	public ArrayList<Qna_QDTO> selectQNAList(Map<String, Integer> map);
		
	// 자기가 문의한 1:1 문의글 수 - 유바울
	public int getUserTotalRecord(int m_No);
	
	// 1:1 문의글 가져오기 - 유바울
	public Qna_QDTO selectQNAmyView(int q_No);
	
	// 1:1 문의 답변 완료상태로 업데이트하기 (STATE 바꾸기) - 유바울
	public void qna_qStateUpdate(int q_No);

	// 전체 문의글 가져오기 (관리자 모드) - 유바울
	public ArrayList<Qna_QDTO> qna_qList(Map<String, Integer> map);
	
	// 작성된 1:1문의 글 수 - 유바울
	public int getAllTotalRecord();
	
	// 관리자모드 회원 검색하기 - 최성락
	public ArrayList<Qna_QDTO> selectQna_q(Map<String, String> map);
		
	// 검색된 가입회원 수 보기 - 유바울
	public int getSelectTotalRecord(Map<String, String> map);
	
	
	
	
	
}










