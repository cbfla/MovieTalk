package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;

public interface MemberMapper {
	
	
	public void memberJoin(MemberVO member);
	
	
	//아이디 중복검사
	public int idCheck(String memberId);
	
    //로그인
    public MemberVO memberLogin(MemberVO member);
    
    //회원목록
    public List<MemberVO> memberGetList(Criteria cri);


//	public boolean update(MemberVO member);


	public void memberUpdate(MemberVO member);
    
    
	public void memberDelete(MemberVO member) throws Exception;
    
	
}
