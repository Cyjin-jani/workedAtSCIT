package com.scmaster.milanmall.board.vo;

public class Board {
	private int revw_boardnum;
	private String revw_id;
	private String revw_title;
	private String revw_content;
	private String revw_inputdate;
	private int revw_hits;
	private int revw_like;
	private String revw_originalfile;
	private String revw_savedfile;
	public Board() {
		super();
	}
	public Board(int revw_boardnum, String revw_id, String revw_title, String revw_content, String revw_inputdate,
			int revw_hits, int revw_like, String revw_originalfile, String revw_savedfile) {
		super();
		this.revw_boardnum = revw_boardnum;
		this.revw_id = revw_id;
		this.revw_title = revw_title;
		this.revw_content = revw_content;
		this.revw_inputdate = revw_inputdate;
		this.revw_hits = revw_hits;
		this.revw_like = revw_like;
		this.revw_originalfile = revw_originalfile;
		this.revw_savedfile = revw_savedfile;
	}
	public int getRevw_boardnum() {
		return revw_boardnum;
	}
	public void setRevw_boardnum(int revw_boardnum) {
		this.revw_boardnum = revw_boardnum;
	}
	public String getRevw_id() {
		return revw_id;
	}
	public void setRevw_id(String revw_id) {
		this.revw_id = revw_id;
	}
	public String getRevw_title() {
		return revw_title;
	}
	public void setRevw_title(String revw_title) {
		this.revw_title = revw_title;
	}
	public String getRevw_content() {
		return revw_content;
	}
	public void setRevw_content(String revw_content) {
		this.revw_content = revw_content;
	}
	public String getRevw_inputdate() {
		return revw_inputdate;
	}
	public void setRevw_inputdate(String revw_inputdate) {
		this.revw_inputdate = revw_inputdate;
	}
	public int getRevw_hits() {
		return revw_hits;
	}
	public void setRevw_hits(int revw_hits) {
		this.revw_hits = revw_hits;
	}
	public int getRevw_like() {
		return revw_like;
	}
	public void setRevw_like(int revw_like) {
		this.revw_like = revw_like;
	}
	public String getRevw_originalfile() {
		return revw_originalfile;
	}
	public void setRevw_originalfile(String revw_originalfile) {
		this.revw_originalfile = revw_originalfile;
	}
	public String getRevw_savedfile() {
		return revw_savedfile;
	}
	public void setRevw_savedfile(String revw_savedfile) {
		this.revw_savedfile = revw_savedfile;
	}
	@Override
	public String toString() {
		return "Board [revw_boardnum=" + revw_boardnum + ", revw_id=" + revw_id + ", revw_title=" + revw_title
				+ ", revw_content=" + revw_content + ", revw_inputdate=" + revw_inputdate + ", revw_hits=" + revw_hits
				+ ", revw_like=" + revw_like + ", revw_originalfile=" + revw_originalfile + ", revw_savedfile="
				+ revw_savedfile + "]";
	}
	
	
	
}
