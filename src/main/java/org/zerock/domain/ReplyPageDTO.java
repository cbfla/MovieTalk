package org.zerock.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ReplyPageDTO {
	
	private int replyCnt; 
	private List<ReplyVO> list;
	
	
	//페이징 처리 필요시 댓글 목록, 전체 댓글 수를 같이 전달해야 함.
	//replyserviceimpl 클래스는 list<replyVO>와 댓글의 수를 같이 전달할 수 있는 구조로 변경
	//우선적으로 두 가지 정보를 담을 수 있는 replypageDTO클래스를 위와 같이 정의
	
	//ReplyService 인터페이스와 ReplyServiceImpl 클래스에는 ReplyPageDTO를 반환하는 메서드를 추가한다.
	
	 
	
	

}
