package com.koreait.pro.dao;

import java.util.ArrayList;
import java.util.Map;

import com.koreait.pro.dto.MemberDTO;

public interface MemberDAO {

	// 회원가입하기 유바울 & 송원섭
	public void signUpMember(String m_Name,String m_Id, String m_Pw,String m_Phone, String m_Email, String m_Address );

	// 로그인 - 한덕구 & 김수범
	public MemberDTO selectBymIdmPw(String m_Id, String m_Pw);

	// 개인 정보 수정 - 유바울 & 김수범
	public void myViewUpdate(String m_Pw, String m_Name, String m_Address, String m_Id);

	// 회원선택 - 김수범
	public MemberDTO selectMemberBymNo(int m_No);
	
	// 아이디 확인 - 김수범
	public MemberDTO selectBymId(String m_Id);

	// 이메일 확인 - 김수범
	public MemberDTO selectBymEmail(String m_Email);

	// 전화번호 확인 - 김수범
	public MemberDTO selectBymPhone(String m_Phone);

	// 판매하는 회원 선택 -조은
	public MemberDTO selectMemberSell(int m_No);

	// 새 비밀번호 설정하기 - 한덕구
	public void setNewmPw(String m_Id, String m_Pw);

	// 비밀번호 찾기 체크 - 한덕구
	public int PWFindChk(String m_Id, String m_Email);

	// 회원 목록 가져오기 - 유바울
	public ArrayList<MemberDTO> memberList(Map<String, Integer> map);

	// 관리자 모드 회원리스트 검색 결과 가져오기
	public ArrayList<MemberDTO> selectMember(String column, String query, Integer beginRecord, Integer endRecord);
	
	// 가입회원 수 보기 - 유바울
	public int getAllTotalRecord();

	// 검색된 가입회원 수 보기 - 유바울
	public int getSelectTotalRecord(String column, String query);

	// 충전하기 - 김수범
	public void moneyCharge(int m_No, int m_Money);

	// 구매, 판매시 money 칼럼 업데이트 - 송원섭, 김수범
	public void MemberUpdatePrice1(int p_No);
	public void MemberUpdatePrice2(int p_No);
	public void MemberUpdatePrice3(int p_No, int p_Price);
	public void MemberUpdatePrice4(int p_Price);
	
	// 판매자 보기 - 송원섭, 김수범
	public String selectMid(int s_No); 
	
	// 포인트 적립
	public void MemberUpdatePoint(int m_Point, int p_No);
	
	// 등급 조정
	public void MemberUpdateGrade(int p_No);
	
	// 관리자 승인 취소시 구매자에게 돈 돌려주고 관리자 돈에서 차감
	public void AdminMinusMoney(int p_Price);
	
	// 관리자 승인 취소시 구매자에게 돈 돌려주기
	public void MemberBackMoney(int b_No, int p_Price);
	
 	// 등급확인
 	public String getmGrade(int p_No);
 	
 	// 탈퇴하기 
 	public void memberDelete(int m_No);
	
}











