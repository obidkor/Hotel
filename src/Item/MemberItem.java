package Item;

public class MemberItem {
	private String id;
	private String pw;
	private String nickname;
	private int rate;
	
	
	
	public MemberItem() {
		
	}
	public MemberItem(String id, String pw, String nickname,int rate) {
		super();
		this.id = id.trim();
		this.pw = pw.trim();
		this.nickname = nickname.trim();
		this.rate=rate;
	}
	public String getId() {
		return id;
	}
	public String getPw() {
		return pw;
	}
	public String getNickname() {
		return nickname;
	}
	public void setId(String id) {
		this.id = id.trim();
	}
	public void setPw(String pw) {
		this.pw = pw.trim();
	}
	public void setNickname(String nickname) {
		this.nickname = nickname.trim();
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
}
