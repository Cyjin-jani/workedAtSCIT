package com.scmaster.milanmall.board.vo;

public class Reply {
	private int rep_replynum;		
	private int revw_boardnum;
	private String rep_id;				
	private String rep_text;		
	private String rep_inputdate;
	public Reply() {
		super();
	}
	public Reply(int rep_replynum, int revw_boardnum, String rep_id, String rep_text, String rep_inputdate) {
		super();
		this.rep_replynum = rep_replynum;
		this.revw_boardnum = revw_boardnum;
		this.rep_id = rep_id;
		this.rep_text = rep_text;
		this.rep_inputdate = rep_inputdate;
	}
	public int getRep_replynum() {
		return rep_replynum;
	}
	public void setRep_replynum(int rep_replynum) {
		this.rep_replynum = rep_replynum;
	}
	public int getRevw_boardnum() {
		return revw_boardnum;
	}
	public void setRevw_boardnum(int revw_boardnum) {
		this.revw_boardnum = revw_boardnum;
	}
	public String getRep_id() {
		return rep_id;
	}
	public void setRep_id(String rep_id) {
		this.rep_id = rep_id;
	}
	public String getRep_text() {
		return rep_text;
	}
	public void setRep_text(String rep_text) {
		this.rep_text = rep_text;
	}
	public String getRep_inputdate() {
		return rep_inputdate;
	}
	public void setRep_inputdate(String rep_inputdate) {
		this.rep_inputdate = rep_inputdate;
	}
	@Override
	public String toString() {
		return "Reply [rep_replynum=" + rep_replynum + ", revw_boardnum=" + revw_boardnum + ", rep_id=" + rep_id
				+ ", rep_text=" + rep_text + ", rep_inputdate=" + rep_inputdate + "]";
	}
	
	
	
}
