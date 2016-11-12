package com.pzy.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.pzy.entity.Plan;
import com.pzy.entity.Question;
import com.pzy.entity.Review;
import com.pzy.entity.User;
public interface PlanRepository extends PagingAndSortingRepository<Plan, Long>,JpaSpecificationExecutor<Plan>{
	 public List<Review> findByUser(User user);
}

