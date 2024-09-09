package kr.co.librarylyh.controller;

import kr.co.librarylyh.domain.BookListVO;
import kr.co.librarylyh.domain.PageDTO;
import kr.co.librarylyh.domain.Paging;
import kr.co.librarylyh.service.BookListService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@Log4j2
@RequestMapping("/ajax")
@AllArgsConstructor
public class BookListRestController {

  private final BookListService service;

  @GetMapping(value = "/booklist", produces = { MediaType.APPLICATION_JSON_VALUE })
  public ResponseEntity<PageDTO> getBookList(
      @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
      @RequestParam(value = "amount", defaultValue = "10") int amount) {

    Paging pge = new Paging(pageNum, amount);
    List<BookListVO> list = service.getList(pge);
    int total = service.getTotal(pge);

    PageDTO pageDTO = new PageDTO(pge, total, list);

    return new ResponseEntity<>(pageDTO, HttpStatus.OK);
  }

  @GetMapping(value = "/{isbn13}", produces = { MediaType.APPLICATION_JSON_VALUE })
  public ResponseEntity<BookListVO> getBook(@PathVariable("isbn13") Long isbn13) {
    BookListVO book = service.get(isbn13);
    return book != null
        ? new ResponseEntity<>(book, HttpStatus.OK)
        : new ResponseEntity<>(HttpStatus.NOT_FOUND);
  }

  @PutMapping(value = "/{isbn13}", produces = { MediaType.APPLICATION_JSON_VALUE })
  public ResponseEntity<String> modifyBook(@PathVariable("isbn13") Long isbn13, @RequestBody BookListVO bookList) {
    if (service.modify(bookList)) {
      return new ResponseEntity<>("success", HttpStatus.OK);
    } else {
      return new ResponseEntity<>("fail", HttpStatus.BAD_REQUEST);
    }
  }

  @DeleteMapping(value = "/{isbn13}", produces = { MediaType.APPLICATION_JSON_VALUE })
  public ResponseEntity<String> removeBook(@PathVariable("isbn13") Long isbn13) {
    if (service.remove(isbn13)) {
      return new ResponseEntity<>("success", HttpStatus.NO_CONTENT);
    } else {
      return new ResponseEntity<>("fail", HttpStatus.BAD_REQUEST);
    }
  }
}