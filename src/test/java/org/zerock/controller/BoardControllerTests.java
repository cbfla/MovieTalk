package org.zerock.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})

@Log4j
public class BoardControllerTests {

	@Autowired
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before //가짜 웹 환경을 만든다.
	public void setup() {
		 this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
		 
	}
	
	@Test
	public void testList() throws Exception {
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/board/list")
				.param("pageNum","3")
				.param("amount","15"))
				.andReturn()
				.getModelAndView()
				.getModelMap());
	}
	
	
	@Test
	public void testRegister() throws Exception {
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.post("/board/register")
				.param("title", "테스트 새글 제목")
				.param("content", "테스트 새글 내용")
				.param("writer", "user00")
				)
						
				.andReturn()
				.getModelAndView()
				.getModelMap());  //.getViewName()
	}
	

	@Test
	public void testGet() throws Exception { 
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/board/get")
				.param("bno", "2")   //"bno" 이걸 삭제해주려면 보드컨트롤러 /get의 Long bno의 명칭과 같아야함.
				)
						
				.andReturn()
				.getModelAndView()
				.getModelMap());  //.getViewName()
	}
	
	
	@Test
	public void testModify() throws Exception { 
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.post("/board/modify")
				.param("bno", "2")   //boardmapper.xml의 update 내용물과 같아야함 
				.param("title", "수정 제목 되려나")  
				.param("content", "수정 내용")  
 
				)
						
				.andReturn()
				.getModelAndView()
				.getModelMap());  //.getViewName()
	
	}
	
	
	@Test
	public void testRemove() throws Exception { 
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.post("/board/remove")
				.param("bno", "25")   //boardmapper.xml의

				)
						
				.andReturn()
				.getModelAndView()
				.getModelMap());  //.getViewName()
	
	}
	
}
