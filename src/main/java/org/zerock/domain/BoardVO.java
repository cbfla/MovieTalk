package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;


@Data
public class BoardVO {

	private Long bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private Date updateDate;
	private int replyCnt;
	private int readCount;
	private List<BoardAttachVO> attachList;//등록시 한번에 boardAttachVO를 처리할 수 있도록 추가.
	
	
	
}



