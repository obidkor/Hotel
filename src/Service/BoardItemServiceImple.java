package Service;

import java.util.List;

import Item.BoardItem;

public class BoardItemServiceImple implements BoardItemService{

	@Override
	public int insert(BoardItem board) {
		// TODO Auto-generated method stub
		int check = Dao.BoardDao.insert(board);
		return check;
	}

	@Override
	public int update(int id, BoardItem board) {
		// TODO Auto-generated method stub
		int check = Dao.BoardDao.update(id,board);
		return check;
	}

	@Override
	public int delete(BoardItem board) {
		// TODO Auto-generated method stub
		int check = Dao.BoardDao.delete(board);
		return check;
	}

	@Override
	public List<BoardItem> selectByDate(int code) {
		// TODO Auto-generated method stub
		List<BoardItem> list =  Dao.BoardDao.getRecordByDate(code);
		return list;
	}

	@Override
	public List<BoardItem> selectByByAll(int code) {
		// TODO Auto-generated method stub
		List<BoardItem> list =  Dao.BoardDao.getRecordByAll(code);
		return list;
	}

	@Override
	public BoardItem selectOne(int id,int code) {
		// TODO Auto-generated method stub
		BoardItem board = Dao.BoardDao.getRecordById(id,code);
		return board;
	}

}
