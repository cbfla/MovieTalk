package org.zerock.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;
import org.zerock.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller // 보드서비스자바 ->보드팹퍼자바
@RequestMapping("/member/*")
@AllArgsConstructor
@Log4j
public class MemberController {

	
	
	@Autowired
	private MemberMapper membermapper;
	
    @Autowired
    private BCryptPasswordEncoder pwEncoder;
	
	@Autowired
	private MemberService memberservice;
	
	//글 제목 클릭하면 해당 값이 아래 겟 맵핑아래로 넘어간다,,페이지 값은 cri로 담은 board는 겟.jsp로 간다.

	@GetMapping("/signup")
	public void signup() {
		
		log.info("회원가입 페이지 진입");
	
	}
	

	
	
	//회원가입
	@PostMapping("/signup")
	public String joinPOST(MemberVO member) throws Exception{
		

		
        String rawPw = "";            // 인코딩 전 비밀번호
        String encodePw = "";        // 인코딩 후 비밀번호
        
        rawPw = member.getMemberPw();            // 비밀번호 데이터 얻음
        encodePw = pwEncoder.encode(rawPw);        // 비밀번호 인코딩
        member.setMemberPw(encodePw);            // 인코딩된 비밀번호 member객체에 다시 저장
        
        /* 회원가입 쿼리 실행 */
        memberservice.memberJoin(member);
		
	
		return "redirect:/board/main3";
		
	}
	
	
	
	
	@GetMapping("/login")
	public void login() {

		log.info("로그인 페이지 진입");
	}
	
	
	// 아이디 중복 검사
	@PostMapping("/memberIdChk")
	@ResponseBody
	public String memberIdChkPOST(String memberId) throws Exception{
		
//		log.info("memberIdChk() 진입");
		
		
		
		log.info("memberIdChk() 진입");
		
		int result = memberservice.idCheck(memberId);
		
		log.info("결과값 = " + result);
		
		if(result != 0) {
			
			return "fail";	// 중복 아이디가 존재
			
		} else {
			
			return "success";	// 중복 아이디 x
			
		}	
		
	} // memberIdChkPOST() 종료	
	
	
	

	 
    /* 로그인 */
    @PostMapping("/login.do")
    public String loginPOST(HttpServletRequest request, MemberVO member, RedirectAttributes rttr) throws Exception{
        
        HttpSession session = request.getSession();
        String rawPw = "";
        String encodePw = "";
    
        MemberVO lvo = memberservice.memberLogin(member);    // 제출한아이디와 일치하는 아이디 있는지 
        
        if(lvo != null) {            // 일치하는 아이디 존재시
            
            rawPw = member.getMemberPw();        // 사용자가 제출한 비밀번호
            encodePw = lvo.getMemberPw();        // 데이터베이스에 저장한 인코딩된 비밀번호
            
            if(true == pwEncoder.matches(rawPw, encodePw)) {        // 비밀번호 일치여부 판단
                
                lvo.setMemberPw("");                    // 인코딩된 비밀번호 정보 지움
                session.setAttribute("member", lvo);     // session에 사용자의 정보 저장
                return "redirect:/";        // 메인페이지 이동
                
                
            } else {
 
                rttr.addFlashAttribute("result", 0);            
                return "redirect:/member/login";    // 로그인 페이지로 이동
                
            }
            
        } else {                    // 일치하는 아이디가 존재하지 않을 시 (로그인 실패)
            
            rttr.addFlashAttribute("result", 0);            
            return "redirect:/member/login";    // 로그인 페이지로 이동
            
        }
    }
    
    
    /* 메인페이지 로그아웃 */
    @GetMapping("/logout")
    public String logoutMainGET(HttpServletRequest request) throws Exception{
    	 log.info("logoutMainGET메서드 진입");
         
         HttpSession session = request.getSession();
         
         session.invalidate();
         
         return "redirect:/";  
    }
    
    
    
    

    
    
    //회원정보 수정
    @GetMapping("/memberUpdate")
    public String registerUpdateView() throws Exception{
    	
    	return "member/memberUpdate";
    }

    
   
    
    
    

@PostMapping("/memberUpdate")
public String registerUpdate(MemberVO vo, HttpSession session) throws Exception{
	
    String rawPw = "";            // 인코딩 전 비밀번호
    String encodePw = "";        // 인코딩 후 비밀번호
    
    rawPw = vo.getMemberPw();            // 비밀번호 데이터 얻음
    encodePw = pwEncoder.encode(rawPw);        // 비밀번호 인코딩
    vo.setMemberPw(encodePw);  
	
	
    log.info("session는????====>"+ session);
    log.info("rawPw는????====>"+ rawPw);
    log.info("encodePw는????====>"+ encodePw);
	
	memberservice.memberUpdate(vo);
	
	session.invalidate();
	
	return "board/main3";
}
    


//회원 탈퇴 get
    @GetMapping("/memberDelete")
	public String memberDeleteView() throws Exception{
    	
		return "member/memberDelete";
	}
	
    

    
 	// 회원 탈퇴 post
    @PostMapping("/memberDelete")
	public String memberDelete(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
		
    
		// 세션에 있는 member를 가져와 member변수에 넣어줍니다.
	
		// 세션에있는 비밀번호
		 MemberVO login = memberservice.memberLogin(vo);
		
		log.info("MemberVO member는????====>"+ login);
		String sessionPass = login.getMemberPw();
		// vo로 들어오는 비밀번호
		
		log.info("sessionPass는????====>"+ sessionPass);
		String voPass = vo.getMemberPw();
		
		log.info("voPass는????====>"+ voPass);
		
		  boolean pwMatch = pwEncoder.matches(voPass,sessionPass);
		     //new는 평문, old는 암호화된 비번
		     log.info("true/false :" + pwMatch);
		     
		     if(pwMatch == true) {
		        memberservice.memberDelete(vo);
		        rttr.addFlashAttribute("msg", "ok");
		        session.invalidate();
		        return "redirect:/";
		     }else {
		        rttr.addFlashAttribute("msg", "false");
		        return "redirect:/member/memberDelete";
		        
		     }    
		

    }	
    
    
    
    
    /*회원 목록 페이지 접속 */
    @PostMapping("/memberManage")
    public void memberManagePOST() throws Exception{
    	log.info("작가 관리 페이지 접속");
    }    
 	
    
    
    
    /*회원 목록 페이지 접속 */
    @GetMapping("/memberManage")
    public void memberManageGET(Criteria cri, Model model) throws Exception{
    	log.info("작가 관리 페이지 접속"+cri);
    	
    	List list = membermapper.memberGetList(cri);
    	model.addAttribute("list",list);
    } 
    
    
    
    
    
}
