package Item;

import java.sql.Date;
import java.sql.Timestamp;

public class ReserveItem {
	private int id;
	private String name;
	private Date date;
	private int room;
	private String addr;
	private String telNum;
	private String in_name;
	private String comment;
	private Timestamp resrv_date;
	private int processing;
	
	public ReserveItem() {
	}
	
	public ReserveItem(int id, String name, Date date, int room, String addr, String telNum, String in_name,
			String comment, Timestamp resrv_date, int processing) {
		super();
		this.id = id;
		this.name = name;
		this.date = date;
		this.room = room;
		this.addr = addr;
		this.telNum = telNum;
		this.in_name = in_name;
		this.comment = comment;
		this.resrv_date = resrv_date;
		this.processing = processing;
	}
	
	
	public int getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public Date getDate() {
		return date;
	}
	public int getRoom() {
		return room;
	}
	public String getAddr() {
		return addr;
	}
	public String getTelNum() {
		return telNum;
	}
	public String getIn_name() {
		return in_name;
	}
	public String getComment() {
		return comment;
	}
	public Timestamp getResrv_date() {
		return resrv_date;
	}
	public int getProcessing() {
		return processing;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public void setRoom(int room) {
		this.room = room;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public void setTelNum(String telNum) {
		this.telNum = telNum;
	}
	public void setIn_name(String in_name) {
		this.in_name = in_name;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public void setResrv_date(Timestamp resrv_date) {
		this.resrv_date = resrv_date;
	}
	public void setProcessing(int processing) {
		this.processing = processing;
	}
	
	
	
	
}
