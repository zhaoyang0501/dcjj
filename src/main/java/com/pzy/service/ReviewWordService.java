package com.pzy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pzy.entity.Review;
import com.pzy.entity.User;
import com.pzy.repository.ReviewRepository;

@Service
public class ReviewWordService {
	@Autowired
	private ReviewRepository reviewRepository;
	
	public List<Review> findByUser(User user){
		return this.reviewRepository.findByUser(user);
	}
	
	public void save(Review review){
		this.reviewRepository.save(review);
	}
}
