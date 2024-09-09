package kr.co.librarylyh.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.co.librarylyh.domain.CategoryVO;
import kr.co.librarylyh.mapper.CategoryMapper;
import lombok.Setter;

@Service
public class CategoryServiceImpl implements CategoryService {

  @Setter(onMethod_ = @Autowired)
  private CategoryMapper categoryMapper;

  @Override
  public List<CategoryVO> getCategoryPath(String categoryId) {
    return categoryMapper.getCategoryPath(categoryId);
  }

  @Override
  public List<CategoryVO> getAllCategories() {
    return categoryMapper.getAllCategories();
  }
}
