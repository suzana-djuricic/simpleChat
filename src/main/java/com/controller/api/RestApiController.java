package com.controller.api;

import com.entity.Message;
import com.entity.User;
import com.service.MessagesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/api")
public class RestApiController {

    @Autowired
    private MessagesService messagesService;

    @GetMapping("/messages")
    public List<Message> getAllMessages(@RequestParam(required = false) Long fromId){
        if(fromId == null){
            return messagesService.getAllMessages();
        }else{
            return messagesService.getNewMessages(fromId);
        }
    }

    // senderId should be taken from user which is logged in, but it is not implemented at this point
    @PostMapping("/message")
    public void addMessage(@RequestBody Message message, @RequestParam Long senderId){
        User sender = new User(senderId);
        messagesService.addMessage(message, sender);
    }

}
