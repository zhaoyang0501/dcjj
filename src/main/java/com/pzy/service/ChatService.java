package com.pzy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pzy.entity.Chat;
import com.pzy.entity.User;
import com.pzy.repository.ChatRepository;

/***
 * 
 * @author qq:263608237
 *
 */
@Service
public class ChatService {
	@Autowired
	private ChatRepository chatRepository;

	public List<Chat> findByUserAndState(User user, String state) {
		return chatRepository.findByUserAndState(user, state);
	}

	public void delete(Long id) {
		chatRepository.delete(id);
	}

	public Chat find(Long id) {
		return chatRepository.findOne(id);
	}

	public void save(Chat chat) {
		chatRepository.save(chat);
	}
}