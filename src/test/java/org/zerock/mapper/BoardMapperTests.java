package org.zerock.mapper;

import java.util.Iterator;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

   @Autowired
   private BoardMapper mapper;

   @Test
   public void testGetList() {
      List<BoardVO> lists = mapper.getList();
      for ( BoardVO list : lists) {
         log.info(list);
      }
      mapper.getList().forEach(n -> log.info(n));
   }

//   @Test
//   public void testInsert() {
//      BoardVO vo = new BoardVO();
//      vo.setTitle("새로 작성하는 글3");
//      vo.setContent("새로 작성하는 내용3");
//      vo.setWriter("newbie");
//
//      int result = mapper.insert(vo);
//      log.info("result = " + result);
//   }
//   
   @Test
   public void testSearch() {
	   Criteria cri = new Criteria();
	   
	   cri.setKeyword("제발");
	   cri.setType("TCW");
	   
	   List<BoardVO> list = mapper.getListWithPaging(cri);
	   list.forEach(n -> log.info(n));
   }
   
  
   @Test
   public void testGetTotalCount() {
	   Criteria cri = new Criteria();
	   
	   cri.setKeyword("제발");
	   cri.setType("TCW");
	   
	   log.info("========>"+ mapper.getTotalCount(cri));
   }
   
   
   
   
   
   
//   @Test
//   public void testInsertSelectKey() {
//      
//      BoardVO vo = new BoardVO();
//      vo.setTitle("새로 작성하는 글4");
//      vo.setContent("새로 작성하는 내용4");
//      vo.setWriter("newbie2");
//
//      int result = mapper.insertSelectKey(vo);
//      log.info("result = " + result);
//   }
//
//   @Test
//   public void testRead() {
//      BoardVO vo = mapper.read(4L);
//      log.info(vo);
//   }
//   
//   @Test
//   public void testDelete() {
//      int result = mapper.delete(4L);
//      log.info("result = " + result);
//   }
//   
//   @Test
//   public void testUpdate() {
//      BoardVO vo = new BoardVO();
//      vo.setTitle("수정한 제목");
//      vo.setContent("수정한 내용");
//      vo.setBno(5L);
//      
//      int result = mapper.update(vo);
//      log.info("result = " + result);
//   }
   
//   
 @Test
 public void testgetListWithpaging() {
    Criteria cri = new Criteria(); // new criteria(3,15); 전체 45개 중에 3페이지의 15개
   
    List<BoardVO> list = mapper.getListWithPaging(cri);//boardMapper.java의 페이징에 맞추어 반환타입 같게
    		list.forEach(n->log.info(n));
 }
 
   
   
// @Test
// public void testgetListWithpaging() {
//    criteria cri = new criteria(); // new criteria(3,15); 전체 45개 중에 3페이지의 15개
//    cri.setType("T");
//    cri.setKeyword("안녕");
//   mapper.getListWithPaging(cri).forEach(n->log.info(n));
// }
// 
   
}