package kr.co.librarylyh.mapper;

import kr.co.librarylyh.domain.BookListVO;
import kr.co.librarylyh.domain.Paging;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.time.LocalDate;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class) // 메서드별 테스트용 JUnit4
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml") // 참고할 파일
@Log4j2
public class BookListMapperTests {
  
  @Setter(onMethod_ = @Autowired) // 생성자 자동 주입
  private BookListMapper mapper;

  @Test // 메서드별로 테스트
  public void testGetList() {
    mapper.getList().forEach(board -> log.info(board));
  }

  @Test
  public void testAdd() {
    BookListVO bookListVO = new BookListVO(); // 빈 객체 생성
    bookListVO.setPhoto("링크");
    bookListVO.setBook("제목제목");
    bookListVO.setAuthor("저자");
    bookListVO.setPublisher("북클립스");
    bookListVO.setPrice(54321);
    bookListVO.setGenre("코스믹호러");
    bookListVO.setSummary("재미ㅏㅅ는내용");
    bookListVO.setB_count(5);
    bookListVO.setIsbn13(1123456789012L);
    bookListVO.setIsbn10(1234567890L);
    bookListVO.setPublicationDate(LocalDate.parse("1991-11-11"));

    mapper.insert(bookListVO);
  }

  @Test
  public void testRead() {
    BookListVO bookListVO = mapper.read(9791162242742L);
    log.info(bookListVO);
  }

  @Test
  public void testUpdate() {
    BookListVO bookListVO = new BookListVO();
    bookListVO.setIsbn13(1123456789012L); // 찾을 번호
    bookListVO.setBook("수정한 제목");
    bookListVO.setSummary("수정한 내용");
    bookListVO.setAuthor("김수정");
    bookListVO.setPublisher("집");
    bookListVO.setPhoto("링크");
    bookListVO.setPublicationDate(LocalDate.parse("1234-12-12"));
    bookListVO.setGenre("어ㅏ");
    bookListVO.setIsbn10(93939393939L);

    int count = mapper.update(bookListVO);
    log.info("수정된 갯수 : " + count);
  }

  @Test
  public void testDelete() {
    log.info("삭제한 갯수 : " + mapper.delete(1123456789012L));
  }

  @Test
  public void testPaging() {
    Paging pge = new Paging();
    pge.setPageNum(3);
    pge.setAmount(10);
    List<BookListVO> list = mapper.getListWithPaging(pge);
    list.forEach(board -> log.info(board));
  }

  @Test
  public void testSerch() {
    Paging pge = new Paging();
    pge.setKeyword("제");
    pge.setType("TC");
    List<BookListVO> list = mapper.getListWithPaging(pge);
    list.forEach(board -> log.info(board));
  }

}