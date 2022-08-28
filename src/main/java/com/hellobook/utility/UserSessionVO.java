package com.hellobook.utility;

import java.util.Date;

import lombok.Data;

@Data
public class UserSessionVO {

	private String username;
	private Date lastAccessTime;
	private String timer;
}
