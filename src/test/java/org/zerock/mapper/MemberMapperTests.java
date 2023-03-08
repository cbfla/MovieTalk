package org.zerock.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests {

	@Autowired
	private MemberMapper membermapper;			//MemberMapper.java 인터페이스 의존성 주입
	
//회원가입 쿼리 테스트 시작
//	@Test
//	public void memberJoin() throws Exception{
//		MemberVO member = new MemberVO();
//		
//		member.setMemberId("아디디테스트");			//회원 id
//		member.setMemberPw("비번테스트");			//회원 비밀번호
//		member.setMemberName("이름테스트");		//회원 이름
//		member.setMemberMail("메일테스트");		//회원 메일
//		member.setMemberAddr1("우편번호테스트");		//회원 우편번호
//		member.setMemberAddr2("주소2테스트");		//회원 주소
//		member.setMemberAddr3("주소3테스트");		//회원 상세주소
//		
//		membermapper.memberJoin(member);			//쿼리 메서드 실행
//		
//	}회원가입 쿼리 테스트 끝
	
	

    /* 로그인 쿼리 mapper 메서드 테스트 */
    @Test
    public void memberLogin() throws Exception{
        
        MemberVO member = new MemberVO();    // MemberVO 변수 선언 및 초기화
        
        /* 올바른 아이디 비번 입력경우 */
        member.setMemberId("1234");
        member.setMemberPw("123");
        
        /* 올바른 않은 아이디 비번 입력경우 */
//        member.setMemberId("test1123");
//        member.setMemberPw("test1321321");
        
        membermapper.memberLogin(member);
        System.out.println("결과 값 : " + membermapper.memberLogin(member));
        
    }
	
	
	
	
	
	// 아이디 중복검사
	@Test
	public void memberIdChk() throws Exception{
		String id = "dlwlrma";	// 존재하는 아이디
		String id2 = "rlaeksql";	// 존재하지 않는 아이디
		membermapper.idCheck(id);
		membermapper.idCheck(id2);
	}
	
	
	//회원목록 테스트
	@Test
	public void memberGetListTest() throws Exception{
		 Criteria cri = new Criteria(1,10);
	
		
		List<MemberVO> list= membermapper.memberGetList(cri);
	for(int i =0; i < list.size(); i++) {
		System.out.println("list"+i+"......."+list.get(i));
	}
	
	}
}
	


	
