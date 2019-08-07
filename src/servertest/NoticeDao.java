package servertest;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;



public class NoticeDao {

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
	
	
	public static int insert(Notice n){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement(  
	        		"insert into notice(id,title,stockCnt,stockContent,img,rootid,relevel,recnt,viewcnt) values(?,?,?,?,?,?,?,?,?)");    
	        ps.setInt(1, n.getId());
	        ps.setString(2,n.getTitle());  
	        ps.setInt(3,n.getStockCnt());  
	        ps.setString(4,n.getStockContent());   
	        ps.setString(5,n.getImg());   
	        ps.setInt(6,n.getRootId());
	        ps.setInt(7,n.getReLevel());
	        ps.setInt(8,n.getReCnt());
	        ps.setInt(9,n.getViewCnt());
	        status=ps.executeUpdate();
	        ps.close();
	        con.close();
	    }catch(Exception e){System.out.println(e);}  
	    return status;
	}  
	
	
	public static int update(int id,Notice n){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement(  
	        		"update notice set id=?,title = ?, stockCnt=?,stockContent=?,img=?, rootid=?, relevel=?,"
	        		+ "recnt=?, viewcnt=? where id=?");  
	        ps.setInt(1,n.getId());
	        ps.setString(2,n.getTitle());  
	        ps.setInt(3,n.getStockCnt());  
	        ps.setString(4,n.getStockContent());
	        ps.setString(5,n.getImg());
	        ps.setInt(6,n.getRootId());
	        ps.setInt(7,n.getReLevel());
	        ps.setInt(8,n.getReCnt());
	        ps.setInt(9,n.getViewCnt());
	        ps.setInt(10,id);  
	        status=ps.executeUpdate();
	        ps.close();
	        con.close();
	    }catch(Exception e){System.out.println(e);}  
	    return status;  
	}
	
	public static int delete(Notice n){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("delete from notice where id=?");  
	        ps.setInt(1,n.getId());  
	        status=ps.executeUpdate();
	        ps.close();
	        con.close();
	    }catch(Exception e){System.out.println(e);}  
	  
	    return status;  
	}
	
	public static List<Notice> getRecord(){  
	    List<Notice> list=new ArrayList<Notice>();  
	      
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("SELECT * FROM notice ORDER BY dateStock desc;");  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	        	Notice n= new Notice(rs.getInt("id"),rs.getString("title"),rs.getTimestamp("dateStock"),
	        						rs.getTimestamp("dateEnroll"),rs.getInt("stockCnt"),rs.getString("stockContent"),rs.getString("img"),
	        						rs.getInt("rootId"),rs.getInt("relevel"),rs.getInt("recnt"),rs.getInt("viewcnt"));  
	            list.add(n);  
	        }  
	        rs.close();
	        ps.close();
	        con.close();
	    }catch(Exception e){System.out.println(e);}  
	    return list;  
	}  
	public static List<Notice> getRecordRe(){  
	    List<Notice> list=new ArrayList<Notice>();  
	      
	    try{ 
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from notice order by rootid desc, recnt asc, relevel asc ;");  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	        	Notice n= new Notice(rs.getInt("id"),rs.getString("title"),rs.getTimestamp("dateStock"),
						rs.getTimestamp("dateEnroll"),rs.getInt("stockCnt"),rs.getString("stockContent"),rs.getString("img"),
						rs.getInt("rootId"),rs.getInt("relevel"),rs.getInt("recnt"),rs.getInt("viewcnt"));  
	            list.add(n);  
	        }  
	        rs.close();
	        ps.close();
	        con.close();
	    }catch(Exception e){System.out.println(e);}  
	    return list;  
	}  
	
	
	public static Notice getRecordById(int id){  
		Notice n=null; 
	    try{
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from notice where id=?");  
	        ps.setInt(1,id);  
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){
	        	n= new Notice(rs.getInt("id"),rs.getString("title"),rs.getTimestamp("dateStock"),
						rs.getTimestamp("dateEnroll"),rs.getInt("stockCnt"),rs.getString("stockContent"),rs.getString("img"),
						rs.getInt("rootId"),rs.getInt("relevel"),rs.getInt("recnt"),rs.getInt("viewcnt"));  
	        }
	        rs.close();
	        ps.close();
	        con.close();
	    }catch(Exception e){System.out.println(e);}  
	    return n;  
	}  
	
	
	
}
