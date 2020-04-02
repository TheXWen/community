package com.xw.community.service;

import com.xw.community.dto.NotificationDTO;
import com.xw.community.dto.Page;
import com.xw.community.mapper.NotificationMapper;
import com.xw.community.mapper.QuestionMapper;
import com.xw.community.model.Notification;
import com.xw.community.model.NotificationExample;
import com.xw.community.model.Question;
import com.xw.community.model.QuestionExample;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class ProfileService {

    @Autowired
    private QuestionMapper questionMapper;

    @Autowired
    private NotificationMapper notificationMapper;

    public Page queryQuestionByUserId(Map paramMap) {
        Page page = new Page((Integer) paramMap.get("pageno"), (Integer) paramMap.get("pagesize"));
        page.setTitle((String) paramMap.get("sectionName"));
        Integer startIndex = page.getStartIndex();
        paramMap.put("startIndex", startIndex);
        QuestionExample example1 = new QuestionExample();
        example1.createCriteria()
                .andCreatorEqualTo((int)paramMap.get("creator"));
        List<Question> questionsList = questionMapper.selectByExampleWithRowbounds(example1, new RowBounds(startIndex, page.getPagesize()));
        page.setDatas(questionsList);
        QuestionExample example = new QuestionExample();
        example.createCriteria()
                .andCreatorEqualTo((int)paramMap.get("creator"));
        Integer totalsize = (int)questionMapper.countByExample(example);
        page.setTotalsize(totalsize);
        return page;
    }

    public Page queryReplies(Map paramMap) {
        Page page = new Page((Integer) paramMap.get("pageno"), (Integer) paramMap.get("pagesize"));
        page.setTitle((String) paramMap.get("sectionName"));
        Integer startIndex = page.getStartIndex();
        paramMap.put("startIndex", startIndex);
        NotificationExample notificationExample = new NotificationExample();
        notificationExample.createCriteria()
                .andReceiverEqualTo((int)paramMap.get("creator"));
        notificationExample.setOrderByClause("gmt_create desc");
        List<Notification> notificationList = notificationMapper.selectByExampleWithRowbounds(notificationExample, new RowBounds(startIndex, page.getPagesize()));
        if (notificationList.size() == 0){
            page.setTotalsize(0);
            return page;
        }
        List<NotificationDTO> notificationDTOS = new ArrayList<>();
        for (Notification notification : notificationList) {
            if (notification.getType() == 1){
                NotificationDTO notificationDTO = notificationMapper.selectInFoByQuestionId(notification.getId());
                notificationDTOS.add(notificationDTO);
            }
            if (notification.getType() == 2){
                NotificationDTO notificationDTO = notificationMapper.selectInFoByCommentId(notification.getId());
                notificationDTOS.add(notificationDTO);
            }
        }
        page.setDatas(notificationDTOS);
        NotificationExample example = new NotificationExample();
        example.createCriteria()
                .andReceiverEqualTo((int)paramMap.get("creator"));
        Integer totalsize = (int)notificationMapper.countByExample(example);
        page.setTotalsize(totalsize);
        return page;
    }

    public Long countNotice(Integer id) {
        NotificationExample notificationExample = new NotificationExample();
        notificationExample.createCriteria()
                .andReceiverEqualTo(id)
                .andStatusEqualTo(0);
        return notificationMapper.countByExample(notificationExample);
    }
}
