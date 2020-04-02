package com.xw.community.dto;

import com.xw.community.model.Question;
import com.xw.community.model.User;

public class QuestionUser {
    private Question question;
    private User user;

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
