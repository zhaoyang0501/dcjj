package com.pzy.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.pzy.entity.Category;
import com.pzy.entity.Project;
public interface CategoryRepository extends PagingAndSortingRepository<Category, Long>,JpaSpecificationExecutor<Category>{
	public	List<Category>	findByType(String	type);
	public	List<Category>	findByProject(Project project);
	@Query(value = "select avg(t1.score) from t_category t1 where t1.project=?1", nativeQuery = true)
	public  Double getAvgScore(Long id);
}

