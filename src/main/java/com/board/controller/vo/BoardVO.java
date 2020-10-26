package com.board.controller.vo;

public class BoardVO {
	
	private int no;
	private String title;
	private String content;
	private String id;
	private String writeDate;
	private int count;
	
	private int startRow;
	private int endRow;
	
	public BoardVO() {}

	public BoardVO(int no, String title, String content, String id, String writeDate, int count) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.id = id;
		this.writeDate = writeDate;
		this.count = count;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	
	

}
