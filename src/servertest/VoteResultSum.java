package servertest;

public class VoteResultSum {

	private int id;
	private String name;
	private int age20;
	private int age30;
	private int age40;
	private int age50;
	private int age60;
	private int age70;
	private int age80;
	private int age90;
	
	public VoteResultSum(int id,String name,int age20,int age30,int age40,int age50,int age60,int age70,int age80,int age90) {
		this.id = id;
		this.name = name;
		this.age20 = age20;
		this.age30 = age30;
		this.age40 = age40;
		this.age50 = age50;
		this.age60 = age60;
		this.age70 = age70;
		this.age80 = age80;
		this.age90 = age90;
		
	}
	
	public String getName() {
		return name;
	}

	public int getId() {
		return id;
	}

	public int getSum() {
		return (age20+age30+age40+age50+age60+age70+age80+age90);
	}
	public int getAge(int age) {
		if(age==20) return age20;
		if(age==30) return age30;
		if(age==40) return age40;
		if(age==50) return age50;
		if(age==60) return age70;
		if(age==80) return age80;
		if(age==90) return age90;
		return 0;
	}

	
	
}
