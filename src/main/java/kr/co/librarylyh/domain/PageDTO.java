package kr.co.librarylyh.domain;

import lombok.Data;
import lombok.Getter;
import lombok.ToString;

import java.util.List;


@Data
public class PageDTO {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	private int total;
	private Paging pge;
	private List<BookListVO> list;
	private int finalPage;

	public PageDTO(Paging pge, int total, List<BookListVO> list) {
		this.total = total;
		this.pge = pge;
		this.list = list;

    this.endPage = (int) (Math.ceil(pge.getPageNum() / 10.0)) * 10;
		this.startPage = this.endPage - 9;

		int realEnd = (int) (Math.ceil(total * 1.0) / pge.getAmount());
		this.finalPage = realEnd;

		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}

}
