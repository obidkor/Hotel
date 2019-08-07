package BoardUtil;

import java.io.*;
import java.sql.*;
import java.util.*;
import java.util.Date;

import Dao.BoardDao;
import Item.BoardItem;
import Service.BoardItemService;
import Service.BoardItemServiceImple;

public class Paging {
	
	public int pagenow;//���� ������
	public int totalCount;//��ü�Խù� ��
	public int countList = 5; // �� �������� ��µ� �Խù� ��
	public int countPage = 5; //�� �������� ��µ� ������ ��
	public int totalPage = totalCount / countList;//��Ż ������ ��;
	public int startPage = ((pagenow - 1) / countPage) * countPage + 1;//��ŸƮ������
	public int endPage = startPage + countPage - 1;//����������
	
	public Paging(int code) {
		
		
		BoardItemService ser = new BoardItemServiceImple();
		List<BoardItem> list  =ser.selectByByAll(code); 
		this.totalCount = list.size();
		totalPage = totalCount / countList;//��Ż ������ ��

		if (totalCount % countList > 0) { // ��ü �Խù��� ���������� �Խù� ���� ������ �Ǹ� ��ü �������� �����µ�
			//�̶� �������� 0���� ũ�ԵǸ� ���������� ���־�� �������������� ǥ�ð��� ��Ż�������� +1�� ���������(�Ҽ��� �����⶧��)
			totalPage++;
		}
		if (totalPage < pagenow) {//pagenow�� totalPage�� �ѰŰ���ȵǹǷ�
			pagenow = totalPage;//�Ѿ�� ���� ���ش�.
		}
		if (endPage > totalPage) {//endPage�� totalPage�� �Ѿ�� ����.
			endPage = totalPage;
		}
	}
	public int checkpagenow(int pagenow,int totalPage){
		//pagenow�� �ѹ��� ����� ��� �� �޼��� ȣ��
		this.pagenow=pagenow;
		this.totalPage=totalPage;
		if (totalPage < pagenow) {
			this.pagenow = totalPage;
		}
		return this.pagenow;
	}

	public int checktotalpage(int totalPage,int endPage) {
			//��Ż �������� �ѹ��� ����� ��� �� �޼��� ȣ��
			this.totalPage=totalPage;
			this.endPage=endPage;
			if (endPage > totalPage) {
				this.endPage = totalPage;
			}
			return this.totalPage;
	}
	
}
	
