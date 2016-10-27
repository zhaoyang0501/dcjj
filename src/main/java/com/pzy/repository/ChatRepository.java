package com.pzy.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.pzy.entity.Chat;
import com.pzy.entity.User;
public interface ChatRepository extends PagingAndSortingRepository<Chat, Long>,JpaSpecificationExecutor<Chat>{
	public	List<Chat>	findByType(String	type);

	public List<Chat> findByUser(User user);

	public List<Chat> findByUserAndState(User user, String state);
}

