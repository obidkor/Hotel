package servertest;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Timestamp;

public class Notice {

	private int id;
	private String title;
	private Timestamp dateStock;
	private Timestamp dateEnroll;
	private int stockCnt;
	private String stockContent;
	private String img;
	private int rootId;
	private int reLevel;
	private int reCnt;
	private int viewCnt;
	
	public int getId() {
		return id;
	}

	public String getTitle() {
		return title;
	}

	public Timestamp getDateStock() {
		return dateStock;
	}

	public Timestamp getDateEnroll() {
		return dateEnroll;
	}

	public int getStockCnt() {
		return stockCnt;
	}

	public String getStockContent() {
		return stockContent;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setDateStock(Timestamp dateStock) {
		this.dateStock = dateStock;
	}

	public void setDateEnroll(Timestamp dateEnroll) {
		this.dateEnroll = dateEnroll;
	}

	public void setStockCnt(int stockCnt) {
		this.stockCnt = stockCnt;
	}

	public void setStockContent(String stockContent) {
		this.stockContent = stockContent;
	}

	public Notice(int id, String title, Timestamp dateStock, Timestamp dateEnroll, int stockCnt,String stockContent,String img,int rootId, int reLevel,int reCnt,int viewCnt) {
		this.id = id;
		this.title = title;
		this.dateStock = dateStock;
		this.dateEnroll = dateEnroll;
		this.stockCnt= stockCnt;
		this.stockContent = stockContent;
		this.img = img;
		this.rootId =rootId;
		this.reLevel=reLevel;
		this.reCnt =reCnt;
		this.viewCnt =viewCnt;
		
	}
	public Notice() {
	
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	
	public int getRootId() {
		return rootId;
	}

	public int getReLevel() {
		return reLevel;
	}

	public int getReCnt() {
		return reCnt;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setRootId(int rootId) {
		this.rootId = rootId;
	}

	public void setReLevel(int reLevel) {
		this.reLevel = reLevel;
	}

	public void setReCnt(int reCnt) {
		this.reCnt = reCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}


	


	}
