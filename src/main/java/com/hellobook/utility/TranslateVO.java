package com.hellobook.utility;

import lombok.Data;

@Data
public class TranslateVO {
	private String inLang;
	private String outLang;
	private String text;
}
