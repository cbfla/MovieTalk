package org.zerock.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class Criteria {

	
	private int pageNum; // 페이지 넘버
	private int amount;  //한 페이지에 보일 게시글의 개수
	
	private String type;		//작성자(W), 내용(C), 제목(T) ==> T or C or W or TC or TCW or CW
	private String keyword;  //검색한 키워드
	
	
	public Criteria() {
		this(1,10);   //기본값을 1페이지 10개 글로 지정 //값을 안 넘겨주면 이 값이 넘어감
	}
	
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		
	}
	
	public String[] getTypeArr() {      //  TCW가 들어오면 각각 분리해서 배열로 넣어주겠다. 
		
		return type == null? new String[] {} : type.split("");
	}
	
	//타입이 null이면 빈 문자열 생성. 아니면 각각 분리해서 스트링 배열에 담겨 반환 ex: TCW=> T C W
	
//받은 값을 BoardMapper.xml에 넘겨준다. 
//foreach collection = "TypeArr"에 

	
	public String getListLink() {

		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());

		return builder.toUriString();

	}
	
	
	
	
	
}
