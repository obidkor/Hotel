package Service;

import java.sql.Date;
import java.util.List;

import Item.ReserveItem;

public class ReserveItemServiceImple implements ReserveItemService {

	@Override
	public int insert(ReserveItem re) {
		// TODO Auto-generated method stub
		int check = Dao.ReserveDao.insert(re);
		return check;
	}

	@Override
	public int update(String name, Date date, ReserveItem re) {
		// TODO Auto-generated method stub
		int check = Dao.ReserveDao.update(name, date, re);
		return check;
	}
	@Override
	public int update(int room, Date date, ReserveItem re) {
		// TODO Auto-generated method stub
		int check = Dao.ReserveDao.update(room, date, re);
		return check;
	}

	@Override
	public int delete(ReserveItem re) {
		// TODO Auto-generated method stub
		int check = Dao.ReserveDao.delete(re);
		return check;
	}

	@Override
	public List<ReserveItem> selectAll() {
		// TODO Auto-generated method stub
		List<ReserveItem> list=Dao.ReserveDao.getRecordAll();
		return list;
	}

	@Override
	public ReserveItem selectOne(String name, Date date) {
		// TODO Auto-generated method stub
		ReserveItem re = Dao.ReserveDao.getRecordOne(date, name);
		return re;
	}

}
