package Item;

import java.sql.Timestamp;

public class BoardItem {

	private int id;
	private String title;
	private Timestamp dateEnroll;
	private String content;
	private String file;
	private int rootId;
	private int reCnt;
	private int reLevel;
	private int viewCnt;
	private int boardCode;
	
	public BoardItem() {
		
	}
	
	public BoardItem(int id, String title, Timestamp dateEnroll, String content, String file, int rootId, int reCnt,
			int reLevel, int viewCnt, int boardcode) {
		this.id = id;
		this.title = title;
		this.dateEnroll = dateEnroll;
		this.content = content;
		this.file = file;
		this.rootId = rootId;
		this.reCnt = reCnt;
		this.reLevel = reLevel;
		this.viewCnt = viewCnt;
		this.boardCode=boardcode;
	}
	public int getId() {
		return id;
	}

	public Timestamp getDateEnroll() {
		return dateEnroll;
	}
	public String getContent() {
		return content;
	}
	public String getFile() {
		return file;
	}
	public int getRootId() {
		return rootId;
	}
	public int getReCnt() {
		return reCnt;
	}
	public int getReLevel() {
		return reLevel;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setId(int id) {
		this.id = id;
	}

	public void setDateEnroll(Timestamp dateEnroll) {
		this.dateEnroll = dateEnroll;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public void setRootId(int rootId) {
		this.rootId = rootId;
	}
	public void setReCnt(int reCnt) {
		this.reCnt = reCnt;
	}
	public void setReLevel(int reLevel) {
		this.reLevel = reLevel;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getBoardcode() {
		return boardCode;
	}

	public void setBoardcode(int boardcode) {
		this.boardCode = boardcode;
	}

	
	
}
