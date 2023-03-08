package org.zerock.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.domain.Criteria;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;



@Controller 
@RequestMapping("/")
@AllArgsConstructor
@Log4j
public class HomeController {

	
	private BoardService service;
	
    //베스트 게시판 게시글 출력
    @GetMapping("/")    
    public String main3(Criteria cri, Model model)  throws Exception{
    	log.info("베스트게시판 게시글 출력======>"+ cri);
 
        model.addAttribute("bestList", service.bestList(cri)); //페이지 번호, 총페이지를 list에 담아
       
        return "board/main3";
        
        //게시판 페이지로 이동
    
        
    }
	
}
