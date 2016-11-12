package com.pzy.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.pzy.entity.Review;
import com.pzy.entity.User;
public interface ReviewRepository extends PagingAndSortingRepository<Review, Long>,JpaSpecificationExecutor<Review>{
   public List<Review> findByUser(User user);
}

