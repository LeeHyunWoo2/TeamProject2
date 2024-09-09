package kr.co.librarylyh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.librarylyh.domain.BookListVO;
import kr.co.librarylyh.domain.PageDTO;
import kr.co.librarylyh.domain.Paging;
import kr.co.librarylyh.service.BookListService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller // 스프링이 컨트롤러 역할을 제공
@Log4j2
@RequestMapping("/library/*")
@AllArgsConstructor
public class BookListController {

	private BookListService service;

	@GetMapping("/booklist")
	public String booklist(Model model) {
		return "library/booklist";
	}

	@PostMapping("/addBook")
	public String addBook(BookListVO bookList, RedirectAttributes rttr) {
		log.info("bookListController.register 메서드 실행");
		service.add(bookList);
		rttr.addFlashAttribute("result", bookList.getIsbn13());
		return "redirect:/booklist/list";
	}

}