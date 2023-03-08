package org.zerock.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.BoardMapperTests;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberServiceTests { // BoardserviceImpl.java가 잘 작동되는지 않되는지 확인하는

	
	//boardservice객체가 제대로 주입이 가능한지 확인하는 작업
	@Autowired
	private MemberService memberService;

	
	
	@Test    //회원목록 테스트
	public void testMemberGetList(Criteria cri) throws Exception {
		List<MemberVO> memberVO=memberService.memberGetList(cri);
		memberVO.forEach(n->log.info(n));
		
		memberService.memberGetList(cri).forEach(n->log.info(n));
	
	}

}
