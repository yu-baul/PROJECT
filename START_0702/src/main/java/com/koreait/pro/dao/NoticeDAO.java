package com.koreait.pro.dao;

import java.util.ArrayList;
import java.util.Map;

import com.koreait.pro.dto.NoticeDTO;

public interface NoticeDAO {
	
	// 공지사항 목록 가져오기
	public ArrayList<NoticeDTO> selectNoticeList(Map<String, Integer> map);
		
	// 공지사항 글  수 보기 - 유바울
	public int getAllTotalRecord();
	
	// 공지사항 내용 보기
	public NoticeDTO selectNoticeByn_No(int n_No);
	
	// 공지사항 수정하기 (관리자)
	public void NoticeUpdate(String n_Title, String n_Content, int n_No);
	
	// 공지사항 삭제하기 (관리자)
	public void NoticeDelete(int n_No);
	
	// 공지사항 삽입하기 (관리자)
	public void NoticeInsert(String n_Title, String n_Content);
	

}
