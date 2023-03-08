package org.zerock.domain;

import lombok.Data;

@Data
public class AttachFileDTO {
	//원본 파일의 이릅, 업로드 경로, UUID값, 이미지 여부를 하나로 묶어서 전달.

	private String fileName;
	private String uploadPath;
	private String uuid;
	private boolean image;

	
	//작성 후 UploadController는 AttachfileDTO의 리스트를 반환하는 구조로 변경해야 함.
}
