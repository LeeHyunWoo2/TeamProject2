package kr.co.librarylyh.service;

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

import static org.junit.Assert.assertNotNull;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j2
public class BookListServiceTests {
  @Setter(onMethod_ = @Autowired)
  private BookListService service; // setService(BoardService)

  @Test
  public void testExist() {
    // 객체 생성 유무 판단용
    log.info(service); // 인터페이스를 필드로 생성하였는데 서비스객체를 실행하면 Impl이 붙은 클래스가 실행된다.
    assertNotNull(service);
  }

  @Test
  public void testRegister() {
    BookListVO bookListVO = new BookListVO(); // 빈 객체 생성
    bookListVO.setBook("서비스로 만든 제목");
    bookListVO.setSummary("서비스로만든내용");
    bookListVO.setAuthor("서비스맨");
    bookListVO.setGenre("서비스장르");
    bookListVO.setIsbn10(2223334445L);
    bookListVO.setIsbn13(7778889995556L);
    bookListVO.setPublicationDate(LocalDate.parse("4321-12-10"));
    bookListVO.setPhoto("링크서비스");
    bookListVO.setPrice(55555);
    bookListVO.setB_count(1);
    bookListVO.setPublisher("dㅇㅇㅇ");
    service.add(bookListVO);
    log.info("등록된 게시물 번호 : " + bookListVO.getIsbn13());
  }

  @Test
  public void testGet() {
    log.info(service.get(9791162242742L));
  }

  @Test
  public void testGetList() {
    // service.getList().forEach(board -> log.info(board));
    // log.info(service.getList()); 이렇게 적어도 나오긴 함
    service.getList(new Paging(2, 10)).forEach(board -> log.info(board));
  }

  @Test
  public void testUpdate() {
    BookListVO bookListVO = service.get(7778889995556L);
    if (bookListVO == null) {
      log.info("찾는 객체가 없습니다.");
      return;
    }
    bookListVO.setBook("서비스로2 만든 제목");
    bookListVO.setSummary("서비2스로만든내용");
    bookListVO.setAuthor("서비2스맨");
    bookListVO.setGenre("서비스2장르");
    bookListVO.setIsbn10(2222222222L);
    bookListVO.setIsbn13(7778889995556L);
    bookListVO.setPublicationDate(LocalDate.parse("2222-12-22"));
    bookListVO.setPhoto("링크2서비스");
    bookListVO.setPublisher("dㅇ323123ㅇㅇ");
    log.info("수정된 게시물 번호 : " + service.modify(bookListVO));
  }

  @Test
  public void testDelete() {
    log.info("삭제된 결과 : " + service.remove(1123456789012L));
  }
}
