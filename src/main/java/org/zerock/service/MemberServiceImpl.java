package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.BoardMapper;
import org.zerock.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Service
@AllArgsConstructor
@Log4j
public class MemberServiceImpl implements MemberService{
	
	   @Autowired
	   private MemberMapper membermapper;


	   
	   //회원가입
		@Override
		public void memberJoin(MemberVO member) throws Exception {
			
			membermapper.memberJoin(member);
			
		}
		
		
		//아이디 중복검사
		@Override
		public int idCheck(String memberId) throws Exception {
			
			return membermapper.idCheck(memberId);
		}



	    //로그인
	    @Override
	    public MemberVO memberLogin(MemberVO member) throws Exception {
	        
	        return membermapper.memberLogin(member);
	    }
	 
	    
	    
		//회원목록
		public List<MemberVO> memberGetList(Criteria cri) throws Exception{
			
			log.info("(service)memberGetList()...====>");
			
			return membermapper.memberGetList(cri);
			
		}


		@Override
		public void memberUpdate(MemberVO member) throws Exception {
			// TODO Auto-generated method stub
			membermapper.memberUpdate(member);
//			return membermapper.memberUpdate(member);
			
		}
	    
	    

    	// 업데이트와 마찬가지로 흐름은 같습니다.
	@Override
	public void memberDelete(MemberVO member) throws Exception {
		// MemberVO에 담긴 값들을 보내줍니다.
		// 그럼 xml에서 memberMapper.memberDelete에 보시면
		//  #{userId}, #{userPass}에 파라미터값이 매칭이 되겠지요.
		membermapper.memberDelete(member);
		
	}
	    
	    
		
		
	}	
	

	
	
   

   
   

