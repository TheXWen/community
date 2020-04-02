package com.xw.community.service;

import com.xw.community.dto.NotificationDTO;
import com.xw.community.mapper.NotificationMapper;
import com.xw.community.model.Notification;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NotificationService {

    @Autowired
    private NotificationMapper notificationMapper;

    public NotificationDTO read(Integer id) {
        Notification notification = notificationMapper.selectByPrimaryKey(id);
        NotificationDTO notificationDTO = new NotificationDTO();
        if (notification.getType() == 1){
            notificationDTO = notificationMapper.selectInFoByQuestionId(id);
        }else if (notification.getType() == 2){
            notificationDTO = notificationMapper.selectInFoByCommentId(id);
        }
        notification.setStatus(1);
        notificationMapper.updateByPrimaryKey(notification);
        return notificationDTO;
    }
}
