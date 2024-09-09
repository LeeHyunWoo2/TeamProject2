package kr.co.librarylyh.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import kr.co.librarylyh.domain.CategoryVO;
import kr.co.librarylyh.service.CategoryService;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/categories")
@RequiredArgsConstructor
public class CategoryController {

  private final CategoryService categoryService;

  @GetMapping("/path")
  public ResponseEntity<List<CategoryVO>> getCategoryPath(@RequestParam("categoryId") String categoryId) {
    List<CategoryVO> categoryPath = categoryService.getCategoryPath(categoryId);
    return new ResponseEntity<>(categoryPath, HttpStatus.OK);
  }
}