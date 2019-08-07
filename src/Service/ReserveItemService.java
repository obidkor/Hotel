package Service;

import java.sql.Date;
import java.util.List;

import Item.ReserveItem;


public interface ReserveItemService {

	
	public int insert(ReserveItem re);
	
	public int update(String name,Date date, ReserveItem re);
	public int update(int room,Date date, ReserveItem re);
	
	public int delete(ReserveItem re);
	
	public List<ReserveItem> selectAll();
	public ReserveItem selectOne(String name,Date date);
}
