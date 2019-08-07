package servertest;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DBconnect {	
	private Connection conn;
	private Statement stmt;
	
	public DBconnect(){
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//
		String address = "jdbc:mysql://192.168.56.102:3306/kopoctc";
		String id = "root";
		String pwd = "rlarldbs21";
		conn = null;
		stmt = null;
		try {
			conn = DriverManager.getConnection(address,id,pwd);
			stmt = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	


	public Statement getStmt(Statement stmt) {
		return stmt=this.stmt;
	}
	public Connection getConn(Connection conn) {
		return conn=this.conn;
	}
	
	@SuppressWarnings("null")
	public List<Student> getArr(){
		DBconnect db = new DBconnect();
		
		List<Student> twicearr = new ArrayList<Student>();
		
		Connection conn = db.getConn(this.conn);
		Statement stmt = db.getStmt(this.stmt);
		ResultSet rset;
		try {
			rset = stmt.executeQuery("select * from examtwice");
			while(rset.next()) {
				Student twice=new Student(rset.getString(1),rset.getInt(2),rset.getInt(3),rset.getInt(4),rset.getInt(5));
				twice.setName(rset.getString(1));
				twice.setStudentid(rset.getInt(2));
				twice.setKor(rset.getInt(3));
				twice.setEng(rset.getInt(4));
				twice.setMat(rset.getInt(5));
				twicearr.add(twice);
			}
			
			rset.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return twicearr ;
	}
		
	
}



