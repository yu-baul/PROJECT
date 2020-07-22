package com.koreait.pro.dao;

import com.koreait.pro.dto.Qna_ADTO;

public interface Qna_aDAO {
	
	// 관리자 1:1 문의 답글 달기 - 유바울 
	public void qna_aInsert(int q_No, String a_Content );
	
	// 관리자 1:1 문의 답글 달린 유저 답글 글 보여주기
	public Qna_ADTO qna_aSelectView(int q_No);

}
