package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;

import lombok.extern.log4j.Log4j;


public interface MemberService { //얘는 보드맵퍼자바와 연결

	
	//회원가입
	public void memberJoin(MemberVO member) throws Exception;

	//아이디 중복 검사
	public int idCheck(String memberId) throws Exception;

	//로그인
	public MemberVO memberLogin(MemberVO member) throws Exception;

	//회원목록
	public List<MemberVO> memberGetList(Criteria cri) throws Exception;
	
	//회원정보수정
	public void memberUpdate(MemberVO member) throws Exception;

//	public void memberUpdate(MemberVO vo);
	
	// 회원 탈퇴
	public void memberDelete(MemberVO vo)throws Exception;

	
	
	
	
}
