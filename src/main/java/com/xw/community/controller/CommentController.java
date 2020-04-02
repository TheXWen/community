package com.xw.community.controller;

import com.xw.community.dto.AjaxResult;
import com.xw.community.dto.CommentDTO;
import com.xw.community.dto.CommentUser;
import com.xw.community.model.Comment;
import com.xw.community.model.User;
import com.xw.community.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class CommentController {

    @Autowired
    private CommentService commentService;

    @ResponseBody
    @PostMapping("/comment")
    public Object comment(@RequestBody CommentDTO commentDTO, HttpServletRequest request){
        AjaxResult result = new AjaxResult();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Comment comment = new Comment();
        comment.setParentId(commentDTO.getParentId());
        comment.setContent(commentDTO.getContent());
        comment.setType(commentDTO.getType());
        comment.setGmtCreate(sdf.format(new Date()));
        comment.setGmtModified(sdf.format(new Date()));
        User user = (User) request.getSession().getAttribute("user");
        comment.setCommentator(user.getId());
        try {
            int count = commentService.insertComment(comment);
            result.setSuccess(count == 1);
            if (count == 0) {
                result.setSuccess(false);
                result.setMessage("回复内容不能为空");
            }
            CommentUser commentUser = new CommentUser();
            commentUser.setUser(user);
            commentUser.setComment(comment);
            result.setData(commentUser);
        } catch (Exception e) {
            result.setSuccess(false);
            e.printStackTrace();
            result.setMessage("添加评论失败！");
        }
        return result;
    }

    @ResponseBody
    @GetMapping("/comment/{id}")
    public Object comment(@PathVariable(name = "id") Integer id, HttpServletRequest request){
        AjaxResult result = new AjaxResult();
        try {
            List<CommentUser> commentUsers = commentService.queryByTypeId(id, 1);
            User user = new User();
            if (request.getSession().getAttribute("user") != null) {
                user = (User) request.getSession().getAttribute("user");
            }
            result.setUser(user);
            result.setSuccess(true);
            result.setData(commentUsers);
        } catch (Exception e) {
            result.setSuccess(false);
            e.printStackTrace();
            result.setMessage("查询数据失败!");
        }
        return result;
    }

    @ResponseBody
    @GetMapping("/reply/{id}")
    public Object reply(@PathVariable(name = "id") Integer id){
        AjaxResult result = new AjaxResult();
        try {
            List<CommentUser> commentUsers = commentService.queryByTypeId(id, 2);
            result.setSuccess(true);
            result.setData(commentUsers);
        } catch (Exception e) {
            result.setSuccess(false);
            e.printStackTrace();
            result.setMessage("查询二级回复失败!");
        }
        return result;
    }

    @ResponseBody
    @PostMapping("/reply")
    public Object reply(@RequestBody CommentDTO commentDTO,HttpServletRequest request){
        AjaxResult result = new AjaxResult();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Comment comment = new Comment();
        comment.setParentId(commentDTO.getParentId());
        comment.setContent(commentDTO.getContent());
        comment.setType(commentDTO.getType());
        comment.setGmtCreate(sdf.format(new Date()));
        comment.setGmtModified(sdf.format(new Date()));
        User user = (User) request.getSession().getAttribute("user");
        comment.setCommentator(user.getId());
        try {
            int count = commentService.insertReply(comment);
            result.setSuccess(count == 1);
            if (count == 0) {
                result.setSuccess(false);
                result.setMessage("回复内容不能为空");
            }
            CommentUser commentUser = new CommentUser();
            commentUser.setUser(user);
            commentUser.setComment(comment);
            result.setData(commentUser);
        } catch (Exception e) {
            result.setSuccess(false);
            e.printStackTrace();
            result.setMessage("添加二级评论失败！");
        }
        return result;
    }
}
