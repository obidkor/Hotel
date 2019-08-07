package Dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Item.BoardItem;

public class BoardDao {

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
	
	
	public static int insert(BoardItem board){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement(  
		        		"insert into board(id,title,content,file,rootId,reLevel,reCnt,viewCnt,boardCode) values(?,?,?,?,?,?,?,?,?)");
	        ps.setInt(1, board.getId());
	        ps.setString(2,board.getTitle());    
	        ps.setString(3,board.getContent());   
	        ps.setString(4,board.getFile());   
	        ps.setInt(5,board.getRootId());
	        ps.setInt(6,board.getReLevel());
	        ps.setInt(7,board.getReCnt());
	        ps.setInt(8,board.getViewCnt());
	        ps.setInt(9,board.getBoardcode());
	        status=ps.executeUpdate();
	        ps.close();
	        con.close();
	    }catch(Exception e){System.out.println(e);}  
	    return status;
	}  
	
	
	public static int update(int id,BoardItem board){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement(  
	        		"update board set id=?,title = ?, content=?,file=?, rootId=?, reLevel=?,"
	        		+ "reCnt=?, viewCnt=? where id=? and boardCode=?");  
	        ps.setInt(1, board.getId());
	        ps.setString(2,board.getTitle());    
	        ps.setString(3,board.getContent());   
	        ps.setString(4,board.getFile());   
	        ps.setInt(5,board.getRootId());
	        ps.setInt(6,board.getReLevel());
	        ps.setInt(7,board.getReCnt());
	        ps.setInt(8,board.getViewCnt());
	        ps.setInt(9,id);  
	        ps.setInt(10,board.getBoardcode());
	        status=ps.executeUpdate();
	        ps.close();
	        con.close();
	    }catch(Exception e){System.out.println(e);}  
	    return status;  
	}
	
	public static int delete(BoardItem board){  
	    int status=0;  
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("delete from board where id=? and boardCode=?");  
	        ps.setInt(1,board.getId());  
	        ps.setInt(2,board.getBoardcode());
	        status=ps.executeUpdate();
	        ps.close();
	        con.close();
	    }catch(Exception e){System.out.println(e);}  
	  
	    return status;  
	}
	
	public static List<BoardItem> getRecordByDate(int code){  
	    List<BoardItem> list=new ArrayList<BoardItem>();  
	      
	    try{  
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("SELECT * FROM board where boardCode=? ORDER BY dateEnroll desc ;");
	        ps.setInt(1, code);
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	        	BoardItem b= new BoardItem(rs.getInt("id"),rs.getString("title"),
	        						rs.getTimestamp("dateEnroll"),rs.getString("content"),rs.getString("file"),
	        						rs.getInt("rootId"),rs.getInt("reLevel"),rs.getInt("reCnt"),rs.getInt("viewCnt"),rs.getInt("boardCode"));  
	            list.add(b);  
	        }  
	        rs.close();
	        ps.close();
	        con.close();
	    }catch(Exception e){System.out.println(e);}  
	    return list;  
	}  
	public static List<BoardItem> getRecordByAll(int code){  
	    List<BoardItem> list=new ArrayList<BoardItem>();  
	      
	    try{ 
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from board where boardCode=? order by rootId desc, reCnt asc, reLevel asc  ;");
	        ps.setInt(1, code);
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){  
	        	BoardItem b= new BoardItem(rs.getInt("id"),rs.getString("title"),
						rs.getTimestamp("dateEnroll"),rs.getString("content"),rs.getString("file"),
						rs.getInt("rootId"),rs.getInt("reLevel"),rs.getInt("reCnt"),rs.getInt("viewCnt"),rs.getInt("boardCode"));  
	        	list.add(b);  
	        }  
	        rs.close();
	        ps.close();
	        con.close();
	    }catch(Exception e){System.out.println(e);}  
	    return list;  
	}  
	
	
	public static BoardItem getRecordById(int id,int code){  
		BoardItem b=null; 
	    try{
	        Connection con=getConnection();  
	        PreparedStatement ps=con.prepareStatement("select * from board where id=? and boardCode=?");  
	        ps.setInt(1,id);
	        ps.setInt(2, code);
	        ResultSet rs=ps.executeQuery();  
	        while(rs.next()){
	        	b= new BoardItem(rs.getInt("id"),rs.getString("title"),
						rs.getTimestamp("dateEnroll"),rs.getString("content"),rs.getString("file"),
						rs.getInt("rootId"),rs.getInt("reLevel"),rs.getInt("reCnt"),rs.getInt("viewCnt"),rs.getInt("boardCode")); 
	        }
	        rs.close();
	        ps.close();
	        con.close();
	    }catch(Exception e){System.out.println(e);}  
	    return b;  
	}  
	
	
}
