package servertest;

import java.util.*;

public interface NoticeService {
	//C
	int create(Notice notice);
	//R
	Notice selectOne(int id);
	List<Notice> selectAll();
	List<Notice> selectAllRe();
	
	//U
	int update(int id,Notice notice);
	
	//D
	int delete(Notice notice);
	
	
}
