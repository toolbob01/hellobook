package com.hellobook.domain;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PostFileVO {

	// post_file
	private int fno;
	private int pno;
	private String email;
	private String uuid;  // /resources/images/${DATABASE}
	
}
