package org.zerock.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller 
@RequestMapping({"/board/*","*/"})
@AllArgsConstructor
@Log4j
public class BoardController {

	
	

	private BoardService service;
	
	
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {  
	    List<BoardVO> list = service.getList(cri); // BoardVO 객체 생성
	    for(BoardVO board : list) { // attachList에 BoardAttachVO 객체 추가
	        board.setAttachList(service.getAttachList(board.getBno()));
	    }
	    int total= service.getTotal(cri);  
	    model.addAttribute("list", list); // Model에 BoardVO 객체 리스트 담기
	    model.addAttribute("pageMaker", new PageDTO(cri,total));
	}

	
	
	@GetMapping("/register")
	public void register() {
		
	
	}
	
	
	
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {

		log.info("==========================");

		log.info("register: " + board);

		if (board.getAttachList() != null) {

			board.getAttachList().forEach(attach -> log.info(attach));

		}

		log.info("==========================");

		service.register(board);

		rttr.addFlashAttribute("result", board.getBno());

		return "redirect:/board/list";
	}
	
	

	@GetMapping({"/get","/modify"})//get방식도 받고 modify방식도 받음
	   public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
	      log.info("/get or modify==>" + bno);
	      service.readCount(bno);
	      model.addAttribute("board", service.get(bno)); //bno에 해당하는 모든 정보 긁어다가 board에 담아서 전달 
	      model.addAttribute("attachList", service.getAttachList(bno));   
	}
	
	
	

	   @PostMapping("/modify")
	   public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri,RedirectAttributes rttr) {
	      log.info("/modify.........");
		   
	      
	      if (service.modify(board)) {
	         rttr.addAttribute("result", "modify"); 
	      }
	      rttr.addAttribute("pageNum",cri.getPageNum());
	      rttr.addAttribute("amount",cri.getAmount());
	      rttr.addAttribute("type",cri.getType());
	      rttr.addAttribute("keyword",cri.getKeyword());
	      
	      return "redirect:/board/list";
	   }

	
	
    //베스트 게시판 게시글 출력
    @GetMapping("/main3")    
    public void main3(Criteria cri, Model model)  throws Exception{
        
		/* List<BoardVO> list = service.bestList(bno); */
    	log.info("베스트게시판 게시글 출력======>"+ cri);
 
        model.addAttribute("bestList", service.bestList(cri)); //페이지 번호, 총페이지를 list에 담아
    //게시판 페이지로 이동
    
        
    }
    
    
@GetMapping(value = "/getAttachList",
		    produces = MediaType.APPLICATION_JSON_VALUE)
@ResponseBody
public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno) {

	log.info("getAttachList " + bno);

	return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);

}
	
	
	
	private void deleteFiles(List<BoardAttachVO> attachList) {
	    
	    if(attachList == null || attachList.size() == 0) {
	      return;
	    }
	    
	    log.info("delete attach files...................");
	    log.info(attachList);
	    
	    attachList.forEach(attach -> {
	      try {        
	        Path file  = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\" + attach.getUuid()+"_"+ attach.getFileName());
	        
	        Files.deleteIfExists(file);
	        
	        if(Files.probeContentType(file).startsWith("image")) {
	        
	          Path thumbNail = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\s_" + attach.getUuid()+"_"+ attach.getFileName());
	          
	          Files.delete(thumbNail);
	        }
	
	      }catch(Exception e) {
	        log.error("delete file error" + e.getMessage());
	      }//end catch
	    });//end foreachd
	  }
	
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr) {

		log.info("remove..." + bno);

		List<BoardAttachVO> attachList = service.getAttachList(bno);

		if (service.remove(bno)) {

			// delete Attach Files
			deleteFiles(attachList);

			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list" + cri.getListLink();
	}	
	
    	
	

}
