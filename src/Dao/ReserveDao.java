package Dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Item.ReserveItem;

public class ReserveDao {
	public static Connection getConnection(){  	
	    Connection con=null;  
	    try{  
	        Class.forName("com.mysql.cj.jdbc.Driver");  
			String address = "jdbc:mysql://192.168.56.102:3306/kopoctc";
			String id = "root";
			String pwd = "rlarldbs21";
	        con=DriverManager.getConnection(address,id,pwd);  
	    }catch(Exception e){System.out.println(e);}  
	    return con;  
	}
	
	public static int insert(ReserveItem re) {
		
		  int status=0;  
		    try{  
		        Connection con=getConnection();  
		        PreparedStatement ps=con.prepareStatement(  
		        		"insert into reserve(name,date,room,addr,telNum,in_name,comment,processing) values(?,?,?,?,?,?,?,?)");    	      
		        ps.setString(1,re.getName());    
		        ps.setDate(2,re.getDate());   
		        ps.setInt(3,re.getRoom());   
		        ps.setString(4,re.getAddr());
		        ps.setString(5,re.getTelNum());
		        ps.setString(6,re.getIn_name());
		        ps.setString(7,re.getComment());
		        ps.setInt(8,re.getProcessing());
		        status=ps.executeUpdate();
		        ps.close();
		        con.close();
		    }catch(Exception e){System.out.println(e);}  
		    return status;
	}
	
	public static int update(String name,Date date,ReserveItem re) {
		
		  int status=0;  
		    try{  
		        Connection con=getConnection();  
		        PreparedStatement ps=con.prepareStatement(  
		        		"update reserve set name=?,date=?,room=?,addr=?,telNum=?,in_name=?,comment=?,processing=?"
		    	        		+ " where name=? and date=?");      
		        ps.setString(1,re.getName());    
		        ps.setDate(2,re.getDate());   
		        ps.setInt(3,re.getRoom());   
		        ps.setString(4,re.getAddr());
		        ps.setString(5,re.getTelNum());
		        ps.setString(6,re.getIn_name());
		        ps.setString(7,re.getComment());
		        ps.setInt(8,re.getProcessing());
		        ps.setString(9,name);
		        ps.setDate(10,date);
		        status=ps.executeUpdate();
		        ps.close();
		        con.close();
		    }catch(Exception e){System.out.println(e.toString());}  
		    return status;
	}
	
	public static int update(int room,Date date,ReserveItem re) {
		
		  int status=0;  
		    try{  
		        Connection con=getConnection();  
		        PreparedStatement ps=con.prepareStatement(  
		        		"update reserve set name=?,date=?,room=?,addr=?,telNum=?,in_name=?,comment=?,processing=?"
		    	        		+ " where room=? and date=?");  
		        
		        ps.setString(1,re.getName());    
		        ps.setDate(2,re.getDate());   
		        ps.setInt(3,re.getRoom());   
		        ps.setString(4,re.getAddr());
		        ps.setString(5,re.getTelNum());
		        ps.setString(6,re.getIn_name());
		        ps.setString(7,re.getComment());
		        ps.setInt(8,re.getProcessing());
		        ps.setInt(9,room);
		        ps.setDate(10,date);
		        status=ps.executeUpdate();
		        ps.close();
		        con.close();
		    }catch(Exception e){System.out.println(e.toString());}  
		    return status;
	}
	
	public static int delete(ReserveItem re){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("delete from reserve where room=? and date=?");  
	        ps.setInt(1,re.getRoom());  
	        ps.setDate(2,re.getDate());
	        status=ps.executeUpdate();
	        ps.close();
	        con.close();
	    }catch(Exception e){System.out.println(e);}  
	  
	    return status;  
	}
	
	public static List<ReserveItem> getRecordAll() {
	    List<ReserveItem> list = new ArrayList<ReserveItem>();
		try{
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from reserve;");
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){
	        	ReserveItem re=new ReserveItem(rs.getInt("id"),rs.getString("name"),rs.getDate("date"),rs.getInt("room"),rs.getString("addr"),
	        						rs.getString("telNum"),rs.getString("in_name"),rs.getString("comment"),rs.getTimestamp("resrv_date")
	        						,rs.getInt("processing"));
	        	list.add(re);
	        }
	        rs.close();
	        ps.close();
	        con.close();
	    }catch(Exception e){System.out.println(e);}  
		return list;
	}
	
	
	public static ReserveItem getRecordOne(Date date,String name){  
		ReserveItem re= null ;
	    try{
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from reserve where date=? and name=?");  
	        ps.setDate(1,date);
	        ps.setString(2,name);
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){
	        	re=new ReserveItem(rs.getInt("id"),rs.getString("name"),rs.getDate("date"),rs.getInt("room"),rs.getString("addr"),
	        						rs.getString("telNum"),rs.getString("in_name"),rs.getString("comment"),rs.getTimestamp("resrv_date")
	        						,rs.getInt("processing"));
	        }
	        rs.close();
	        ps.close();
	        con.close();
	    }catch(Exception e){System.out.println(e);}  
	    return re;
	}
	public static ReserveItem getRecordOne(Date date,int room){  
		ReserveItem re= null ;
	    try{
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from reserve where date=? and room=?");  
	        ps.setDate(1,date);
	        ps.setInt(2,room);
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){
	        	re=new ReserveItem(rs.getInt("id"),rs.getString("name"),rs.getDate("date"),rs.getInt("room"),rs.getString("addr"),
	        						rs.getString("telNum"),rs.getString("in_name"),rs.getString("comment"),rs.getTimestamp("resrv_date")
	        						,rs.getInt("processing"));
	        }
	        rs.close();
	        ps.close();
	        con.close();
	    }catch(Exception e){System.out.println(e);}  
	    return re;
	}  
	public static List<ReserveItem> getRecordByName(String name) {
	    List<ReserveItem> list = new ArrayList<ReserveItem>();
		try{
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from reserve where in_name=?;");
	        ps.setString(1, name);
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){
	        	ReserveItem re=new ReserveItem(rs.getInt("id"),rs.getString("name"),rs.getDate("date"),rs.getInt("room"),rs.getString("addr"),
	        						rs.getString("telNum"),rs.getString("in_name"),rs.getString("comment"),rs.getTimestamp("resrv_date")
	        						,rs.getInt("processing"));
	        	list.add(re);
	        }
	        rs.close();
	        ps.close();
	        con.close();
	    }catch(Exception e){System.out.println(e);}  
		return list;
	}
	
}
