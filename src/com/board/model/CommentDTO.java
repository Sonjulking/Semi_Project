package com.board.model;

public class CommentDTO {
	
	private int comment_index;
	private int board_comment_index;
	private String comment_cont;
	private String comment_writer_id;
	private String comment_writer_nickname;
	private String comment_date;
	private String comment_update;
	private int comment_hit;
	
	
	public int getComment_index() {
		return comment_index;
	}
	public void setComment_index(int comment_index) {
		this.comment_index = comment_index;
	}
	public int getBoard_comment_index() {
		return board_comment_index;
	}
	public void setBoard_comment_index(int board_comment_index) {
		this.board_comment_index = board_comment_index;
	}
	public String getComment_cont() {
		return comment_cont;
	}
	public void setComment_cont(String comment_cont) {
		this.comment_cont = comment_cont;
	}
	public String getComment_writer_id() {
		return comment_writer_id;
	}
	public void setComment_writer_id(String comment_writer_id) {
		this.comment_writer_id = comment_writer_id;
	}
	public String getComment_writer_nickname() {
		return comment_writer_nickname;
	}
	public void setComment_writer_nickname(String comment_writer_nickname) {
		this.comment_writer_nickname = comment_writer_nickname;
	}
	
	public String getComment_date() {
		return comment_date;
	}
	public void setComment_date(String comment_date) {
		this.comment_date = comment_date;
	}
	public String getComment_update() {
		return comment_update;
	}
	public void setComment_update(String comment_update) {
		this.comment_update = comment_update;
	}
	public int getComment_hit() {
		return comment_hit;
	}
	public void setComment_hit(int comment_hit) {
		this.comment_hit = comment_hit;
	}
}
