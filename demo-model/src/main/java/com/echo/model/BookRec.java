package com.echo.model;

import java.io.Serializable;

public class BookRec implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Integer bookNum;
	
	
	private Integer bookSum;


	public Integer getBookNum() {
		return bookNum;
	}


	public void setBookNum(Integer bookNum) {
		this.bookNum = bookNum;
	}


	public Integer getBookSum() {
		return bookSum;
	}


	public void setBookSum(Integer bookSum) {
		this.bookSum = bookSum;
	}


	public BookRec(Integer bookNum, Integer bookSum) {
		super();
		this.bookNum = bookNum;
		this.bookSum = bookSum;
	}


	public BookRec() {
		super();
	}


	@Override
	public String toString() {
		return "BookRec [bookNum=" + bookNum + ", bookSum=" + bookSum + "]";
	}

	

}
