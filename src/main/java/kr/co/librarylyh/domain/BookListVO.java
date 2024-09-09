package kr.co.librarylyh.domain;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class BookListVO {
	
	private long isbn13;
	private long isbn10;
	private String book;
	private String summary;
	private String author;
	private String publisher;
	private String photo;
	private String genre;
	private int price;
	private int b_count;

	
	// @DateTimeFormat 을 이용 (저 형식으로 문자열이 입력되면 LocalDate타입으로 자동변환)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate publicationDate; // 날짜필드
	
	// 이거 - 빠지면 곤란한데 이때 대처방안
	// 1. HTML에서는 <input type="date"> 사용하면 해결가능
	
	// 2. js에서는 이걸로 해결가능
//	document.getElementById('publishDate').addEventListener('input', function (e) {
//	    const datePattern = /^\d{4}-\d{2}-\d{2}$/; // YYYY-MM-DD 형식
//	    const inputDate = e.target.value;
//	    
//	    if (!datePattern.test(inputDate)) {
//	        // 입력 형식이 맞지 않으면 사용자에게 알림
//	        alert('날짜 형식은 YYYY-MM-DD이어야 합니다.');
//	        e.target.value = ''; // 잘못된 입력 지우기
//	    }
//	});
	
	// 3. 그 후 서버에서도 한번 유효성 검사 가능 (컨트롤러)
	// if(변수명.hasErrors()){
	//    return "폼 이름";
	// } 유효성 검사 통과 시, 비즈니스 로직 수행
	// return "redirect:/링크";

}