package kr.co.librarylyh.mapper;

import java.util.List;

import kr.co.librarylyh.domain.BookListVO;
import kr.co.librarylyh.domain.Paging;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BookListMapper {

	
	public void insert(BookListVO bookList);
	
	public BookListVO read(long isbn13);
	
	public int update(BookListVO bookList);
	
	public int delete(long isbn13);

	public List<BookListVO> getList();
	
	public List<BookListVO> getListWithPaging(Paging pge);
	
	public int getTotalCount(Paging pge);

}
