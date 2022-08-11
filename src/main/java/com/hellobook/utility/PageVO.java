package com.hellobook.utility;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageVO {

	private int startPage;
	private int endPage;
	private int blockPerPage = 5; 
	
	private boolean prev, next;
	
	private int total;
	private Criteria cri; 
	
	
	public PageVO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		this.endPage = (int)(Math.ceil(cri.getPageNum() / (double)(blockPerPage))) * blockPerPage; 
		this.startPage = this.endPage - (blockPerPage - 1); 
		int realEnd = (int)( Math.ceil((total * 1.0) / cri.getAmount()) );
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
	
	
}

