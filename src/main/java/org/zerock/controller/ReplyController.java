package org.zerock.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyPageDTO;
import org.zerock.domain.ReplyVO;
import org.zerock.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/") // 웹 창에 replies라고 치면 ReplyController작동
@RestController //
@Log4j
@NoArgsConstructor // 기본생성자 생성
@AllArgsConstructor //ReplyService타입의 객체를 필요로 하는 생성자를 만들어서 사용
// 인자 값이 있는 생성자 생성
public class ReplyController {
	@Autowired
	private ReplyService service;

	// 요청이 post방식일 때 //json타입으로 받아줌{"name" :"abd", "age" : "30" }
	@PostMapping(value = "/new", consumes = "application/json", 
			produces = MediaType.TEXT_PLAIN_VALUE) // 문자열로 반환시켜 줘라
	public ResponseEntity<String> create(@RequestBody ReplyVO vo) {
		// json타입이니까 ReplyVO타입으로 맞춰줘야 @RequestBody사용해서
		////RequestBody를 적용해서 json데이터를 ReplyVO 타입으로 변환하도록 지정(form에 jackson있어야 함)
		
		
		log.info(vo);
		int insertCount = service.register(vo);

		// return new ResponseEntity<String>("success", HttpStatus.OK);
		// 문자열 비교 상태코드값?

		return insertCount == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
//값이 있으면 1, 없으면 0
	}
	
	
	
	
//잘 이해가 안간다==============================================================================
	@GetMapping(value = "/pages/{bno}/{page}", //특정 게시물의 댓글 목록 확인, 서버로 확인
	         produces = { MediaType.APPLICATION_XML_VALUE,
	         MediaType.APPLICATION_JSON_VALUE })
	   public ResponseEntity<ReplyPageDTO> getList(//{page}의 값은 Criteria를 생성해서 직접 처리
	         @PathVariable("page") int page, 
	         @PathVariable("bno") Long bno) { //게시물의 번호는 @PathVariable을 이용해서 파라미터로 처리 

	      Criteria cri = new Criteria(page, 10);
	      
	      log.info("get Reply List bno: " + bno);

	      log.info("cri:" + cri);

	      return new ResponseEntity<ReplyPageDTO>(service.getListPage(cri, bno), HttpStatus.OK);
	   }
	
	
	
	
	
	//특정 댓글 조회
	@GetMapping(value = "/{rno}", 
			produces = { MediaType.APPLICATION_ATOM_XML_VALUE, 
						 MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<ReplyVO> get(@PathVariable("rno") Long rno) {//rno를 파라미터로 처리
		
		 log.info("get:" + rno);
		 
		return new ResponseEntity<ReplyVO>(service.get(rno), HttpStatus.OK);
	}
	
	
	
	
//댓글 삭제
	@DeleteMapping(value = "/{rno}", 
			produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno) {
		
		log.info("remove ====>" + rno);
		
		return service.remove(rno) == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
	}

	
	
	
	

//댓글 수정=================================================================??????????????
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value = "/{rno}", consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> get(@PathVariable("rno") Long rno, @RequestBody ReplyVO vo)  {
		vo.setBno(rno);
		log.info(vo);   //json 형태로 전달되는 데이터와 파라미터로 전달되는 댓글 번호(rno)를 처리
		return service.modify(vo) ==1?  new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
	
	}
	

}







