package kr.co.librarylyh.service;

import java.util.List;

import kr.co.librarylyh.domain.BookListVO;
import kr.co.librarylyh.domain.Paging;

public interface BookListService {
	
	public void add(BookListVO bookList);
	
	public BookListVO get(long isbn13);
	
	public boolean modify(BookListVO bookList);
	
	public boolean remove(long isbn13);
	
	public List<BookListVO>getList(Paging pge);
	
	public int getTotal(Paging pge);
	

}
