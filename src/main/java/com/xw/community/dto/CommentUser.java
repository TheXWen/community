package com.xw.community.dto;

import com.xw.community.model.Comment;
import com.xw.community.model.User;

public class CommentUser {
    private Comment comment;
    private User user;

    public Comment getComment() {
        return comment;
    }

    public void setComment(Comment comment) {
        this.comment = comment;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
