package Service;

import java.util.List;

import Item.BoardItem;

public interface BoardItemService {

	public int insert(BoardItem board);
	
	public int update(int id, BoardItem board);
	
	public int delete(BoardItem board);
	
	public List<BoardItem> selectByDate(int code);
	public List<BoardItem> selectByByAll(int code);
	public BoardItem selectOne(int id,int code);
	
}
