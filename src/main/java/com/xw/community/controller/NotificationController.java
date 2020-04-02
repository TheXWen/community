package com.xw.community.controller;

import com.xw.community.dto.NotificationDTO;
import com.xw.community.service.NotificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class NotificationController {

    @Autowired
    private NotificationService notificationService;

    @GetMapping("/notification/{id}")
    public String notification(@PathVariable(name = "id") Integer id){
        NotificationDTO notificationDTO = notificationService.read(id);
        return "redirect:/question?id=" + notificationDTO.getQuestionId();
    }

}
