package com.service;

import com.entity.Message;
import com.entity.User;
import com.repository.MessagesRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;
import java.util.Date;
import java.util.List;

@Service
public class MessagesService {

    @Autowired
    private MessagesRepository messagesRepository;

    @Autowired
    private EntityManager em;

    @Transactional
    public List<Message> getAllMessages(){
        return messagesRepository.getAllMessages();
    }

    @Transactional
    public List<Message> getNewMessages(long fromId){
        return messagesRepository.getNewMessages(fromId);
    }

    @Transactional
    public void addMessage(Message message, User user){
        message.setSender(user);
        message.setTimestamp(new Date());
        messagesRepository.save(message);
    }
}
