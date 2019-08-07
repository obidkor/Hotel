package Dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Item.BoardItem;
import Item.MemberItem;
import Item.ReserveItem;

public class MemberDao {
	
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
	
	public static int insertMem(MemberItem mem) {
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement(  
	        		"insert into member(id,password,nickname,rate) values(?,?,?,?)");    
	        ps.setString(1, mem.getId());
	        ps.setString(2,mem.getPw());    
	        ps.setString(3,mem.getNickname());
	        ps.setInt(4,mem.getRate());
	        status=ps.executeUpdate();
	        ps.close();
	        con.close();
	    }catch(Exception e){System.out.println(e);}  
	    return status;
		
	} 
	
	public static int update(String id,MemberItem mem){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement(  
	        		"update member set id=?,password = ?, nickname=?,rate=? where id=?");  
	        ps.setString(1, mem.getId());
	        ps.setString(2,mem.getPw());    
	        ps.setString(3,mem.getNickname());   
	        ps.setInt(4,mem.getRate());   
	        ps.setString(5,id);
	        status=ps.executeUpdate();
	        ps.close();
	        con.close();
	    }catch(Exception e){System.out.println(e);}  
	    return status;  
	}
	public static int delete(MemberItem mem){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("delete from member where id=?");  
	        ps.setString(1, mem.getId());
	        status=ps.executeUpdate();
	        ps.close();
	        con.close();
	    }catch(Exception e){System.out.println(e);}  
	    return status;  
	}
	public static MemberItem getRecordOne(String id){  
		MemberItem mem= null ;
	    try{
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from member where id=?");  
	        ps.setString(1,id);
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){
	        	mem=new MemberItem(rs.getString("id"),rs.getString("password"),rs.getString("nickname"),rs.getInt("rate"));
	        }
	        rs.close();
	        ps.close();
	        con.close();
	    }catch(Exception e){System.out.println(e);}  
	    return mem;
	}  
	public static List<MemberItem> getRecordAll(){  
		List<MemberItem> list= new ArrayList<MemberItem>();
	    try{
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from member order by rate desc");
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){
	        	MemberItem mem=new MemberItem(rs.getString("id"),rs.getString("password"),rs.getString("nickname"),rs.getInt("rate"));
	        	list.add(mem);
	        }
	        rs.close();
	        ps.close();
	        con.close();
	    }catch(Exception e){System.out.println(e);}  
	    return list;
	}  
}
