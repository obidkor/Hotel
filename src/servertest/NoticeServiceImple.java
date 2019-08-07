package servertest;

import java.util.List;

public class NoticeServiceImple implements NoticeService {

	@Override
	public int create(Notice notice) {
		// TODO Auto-generated method stub
		return NoticeDao.insert(notice);
	}

	@Override
	public Notice selectOne(int id) {
		// TODO Auto-generated method stub
		Notice no = NoticeDao.getRecordById(id);
		return no;
	}

	@Override
	public List<Notice> selectAll() {
		// TODO Auto-generated method stub
		List<Notice> nos = NoticeDao.getRecord();
		return nos;
	}
	
	@Override
	public List<Notice> selectAllRe() {
		// TODO Auto-generated method stub
		List<Notice> nos = NoticeDao.getRecordRe();
		return nos;
	}

	@Override
	public int update(int id, Notice notice) {
		// TODO Auto-generated method stub
		return NoticeDao.update(id, notice);
	}

	@Override
	public int delete(Notice notice) {
		// TODO Auto-generated method stub
		return NoticeDao.delete(notice);
	}





}
