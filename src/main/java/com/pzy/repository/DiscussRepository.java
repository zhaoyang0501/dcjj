package com.pzy.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.pzy.entity.Discuss;
import com.pzy.entity.User;
public interface DiscussRepository extends PagingAndSortingRepository<Discuss, Long>,JpaSpecificationExecutor<Discuss>{
	public	List<Discuss>	findByType(String	type);

	public List<Discuss> findByUser(User user);

	public List<Discuss> findByUserAndType(User user, String type);
}

