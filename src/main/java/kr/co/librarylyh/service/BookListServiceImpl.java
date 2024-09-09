package kr.co.librarylyh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.librarylyh.domain.BookListVO;
import kr.co.librarylyh.domain.Paging;
import kr.co.librarylyh.mapper.BookListMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
@AllArgsConstructor
public class BookListServiceImpl implements BookListService {
	
	@Setter(onMethod_=@Autowired)
	private BookListMapper mapper;

	@Transactional
	@Override
	public void add(BookListVO bookList) {
		log.info("책추가" + bookList);
		mapper.insert(bookList);
	}
	@Override
	public BookListVO get(long isbn13) {
		log.info("get" + isbn13);
		return mapper.read(isbn13);
	}
	@Override
	public boolean modify(BookListVO bookList) {
		log.info("수정" + bookList);
		return mapper.update(bookList) == 1;
	}
	@Override
	public boolean remove(long isbn13) {
		log.info("삭제" + isbn13);
		return mapper.delete(isbn13) == 1;
	}
	@Override
	public List<BookListVO> getList(Paging pge) {
		log.info("아제발페이지나와라좀: " + pge);
		return mapper.getListWithPaging(pge);
	}

	public int getTotal(Paging pge) {
		log.info("get total count");
		return mapper.getTotalCount(pge);
	}

}
