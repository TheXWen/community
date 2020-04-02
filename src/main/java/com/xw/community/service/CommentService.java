package com.xw.community.service;

import com.xw.community.dto.CommentUser;
import com.xw.community.mapper.CommentMapper;
import com.xw.community.mapper.NotificationMapper;
import com.xw.community.mapper.QuestionMapper;
import com.xw.community.mapper.UserMapper;
import com.xw.community.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class CommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Autowired
    private QuestionMapper questionMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private NotificationMapper notificationMapper;

    public int insertComment(Comment comment) {
        Question question = questionMapper.selectByPrimaryKey(Integer.parseInt(String.valueOf(comment.getParentId())));
        if (comment.getContent() == null || comment.getContent() == ""){
            return 0;
        }
        int count = commentMapper.insertSelective(comment);
        //创建通知
        createNotify(comment, question.getCreator(), 1);
        question.setCommentCount(1);
        questionMapper.updateCommentById(question);
        return count;
    }

    private void createNotify(Comment comment, Integer receiver, int type) {
        if (receiver == comment.getCommentator()){
            return;
        }
        Notification notification = new Notification();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        notification.setGmtCreate(sdf.format(new Date()));
        notification.setType(type);
        notification.setOuterid(comment.getParentId().intValue());
        notification.setSender(comment.getCommentator());
        notification.setStatus(0);
        notification.setReceiver(receiver);
        notificationMapper.insertSelective(notification);
    }

    public int insertReply(Comment comment) {
        if (comment.getContent() == null || comment.getContent() == ""){
            return 0;
        }
        if (comment.getParentId() == null){
            comment.setParentId(commentMapper.selectNewId());
        }
        int count = commentMapper.insertSelective(comment);
        //创建通知
        Comment dbcomment = commentMapper.selectByPrimaryKey(comment.getParentId());
        createNotify(comment, dbcomment.getCommentator(), 2);
        //增加评论数
        Comment parentComment = new Comment();
        parentComment.setId(comment.getParentId());
        parentComment.setCommentCount(1);
        commentMapper.updateReplyById(parentComment);
        return count;
    }

    public List<CommentUser> queryByTypeId(Integer id, Integer type) {
        CommentExample commentExample = new CommentExample();
        commentExample.createCriteria()
                .andParentIdEqualTo((long)id)
                .andTypeEqualTo(type);
        commentExample.setOrderByClause("gmt_create desc");
        List<Comment> comments = commentMapper.selectByExample(commentExample);
        if (comments.size() == 0){
            return new ArrayList<>();
        }
        //获取去重的评论人
        Set<Integer> commentators = comments.stream().map(comment -> comment.getCommentator()).collect(Collectors.toSet());
        List<Integer> userIds = new ArrayList<>();
        userIds.addAll(commentators);

        //获取评论人并转换为Map
        UserExample userExample = new UserExample();
        userExample.createCriteria()
                .andIdIn(userIds);
        List<User> users = userMapper.selectByExample(userExample);
        Map<Integer, User> userMap = users.stream().collect(Collectors.toMap(user -> user.getId(), user -> user));

        //转化comment为commentUser
        List<CommentUser> commentUsers = comments.stream().map(comment -> {
            CommentUser commentUser = new CommentUser();
            commentUser.setComment(comment);
            commentUser.setUser(userMap.get(comment.getCommentator()));
            return commentUser;
        }).collect(Collectors.toList());
        return commentUsers;
    }
}
