package servertest;

import java.sql.Timestamp;
import java.util.*;

public abstract class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Calendar c1 = Calendar.getInstance();
		Date d1= new Date();
		d1.setDate(d1.getDate()-1);;
		Timestamp t1 = new Timestamp(d1.getTime());
		int com = t1.compareTo(d1);
		System.out.println(t1);
	}

}
