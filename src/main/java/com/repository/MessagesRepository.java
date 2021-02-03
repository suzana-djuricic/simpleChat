package com.repository;


import com.entity.Message;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface MessagesRepository extends JpaRepository<Message, Long> {

    @Query("SELECT m FROM Message m JOIN FETCH m.sender" +
            " ORDER BY m.id")
    public List<Message> getAllMessages();

    @Query("SELECT m FROM Message m JOIN FETCH m.sender " +
            " WHERE m.id > :fromId" +
            " ORDER BY m.id")
    public List<Message> getNewMessages(@Param("fromId")Long fromId);
}
