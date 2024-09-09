package kr.co.librarylyh.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" }) // 프론트라서 서블릿컨텍스트도 참조
@Log4j2
@WebAppConfiguration
public class BookListControllerTests {

	@Setter(onMethod_ = @Autowired)
	private WebApplicationContext ctx;

	private MockMvc mockMvc;

	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}

	@Test // url과 결과를 처리해주는 테스트
	public void testListPaging() throws Exception {
		log.info(mockMvc.perform(MockMvcRequestBuilders.get("/library/booklist") // url을
				.param("pageNum", "2").param("amount", "50")).andReturn() // 결과를
				.getModelAndView() // 모델에서 뷰 까지
				.getModelMap() // 표형식
		);
	}

	@Test
	public void testaddBook() throws Exception {
		String resultPage = mockMvc
				.perform(MockMvcRequestBuilders.post("/library/addBook")
						.param("photo", "대충 이미지 링크")
						.param("book", "컨트롤러 테스트 내용")
						.param("author", "테스트맨")
						.param("publisher", "테스트회사")
						.param("price", "12345")
						.param("genre", "장르")
						.param("summary", "대충 줄거리")
						.param("b_count", "5")
						.param("isbn13", "1234947490223")
						.param("isbn10", "1234567890")
						.param("publicationDate", "1996-11-08"))
				.andReturn() // 결과를
				.getModelAndView().getViewName(); // 리턴값을 받아서 String 처리

		log.info("결과 url : " + resultPage); // 결과 url : redirect:/library/booklist
	}

	@Test // bno가 넘어가면 돌아오는 값은 객체
	public void testGet() throws Exception {
		log.info("결과 : " + mockMvc.perform(MockMvcRequestBuilders.get("/library/get").param("isbn13", "1234947490223")).andReturn() // 결과를
				.getModelAndView().getModelMap() // select들은 모델맵으로 리턴함
		);
	} // 결과 : {board=BoardVO(bno=6, title=테스트 제5목, content=테스트 내5용, writer=5kkw,
		// regdate=Tue Aug 20 11:13:45 KST 2024, updateDate=Tue Aug 20 11:13:45 KST
		// 2024)

	@Test
	public void testModify() throws Exception {
		String resultPage = mockMvc
				.perform(MockMvcRequestBuilders.post("/library/modify")
            .param("isbn13", "1234567890123")
            .param("photo", "대충 이미지 링크2")
            .param("book", "컨트롤러 테스트 내용2")
            .param("author", "테스트맨2")
            .param("publisher", "테스트회2사")
            .param("genre", "장르2")
            .param("summary", "대충 줄거2리")
            .param("isbn10", "1234567890")
            .param("publicationDate", "1996-11-08"))
				.andReturn().getModelAndView().getViewName();

		log.info("결과 url : " + resultPage);

	}

	@Test
	public void testRemove() throws Exception {
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/library/remove").param("isbn13", "1234567890123")).andReturn()
				.getModelAndView().getViewName(); // 리턴값을 받아 String 처리
		log.info("결과 url : " + resultPage); // 결과 url : redirect:/library/booklist
	}

}