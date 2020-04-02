package com.xw.community.service;

import com.xw.community.dto.QuestionUser;
import com.xw.community.mapper.QuestionMapper;
import com.xw.community.mapper.UserMapper;
import com.xw.community.model.Question;
import com.xw.community.model.User;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class QuestionService {

    @Autowired
    private QuestionMapper questionMapper;

    @Autowired
    private UserMapper userMapper;

    public QuestionUser queryById(Integer id) {
        QuestionUser questionUser = new QuestionUser();
        Question question = questionMapper.selectByPrimaryKey(id);
        User user = userMapper.selectByPrimaryKey(question.getCreator());
        questionUser.setUser(user);
        questionUser.setQuestion(question);
        return questionUser;
    }

    public void incView(Integer id) {
        Question question = new Question();
        question.setId(id);
        question.setViewCount(1);
        questionMapper.updateViewById(question);
    }

    public List<Question> queryRelated(Integer id) {
        Question question = questionMapper.selectByPrimaryKey(id);
        String tags = question.getTag().replace(",", "|");
        Question relatedQuestion = new Question();
        relatedQuestion.setId(question.getId());
        relatedQuestion.setTag(tags);
        List<Question> questions = questionMapper.selectRelated(relatedQuestion);
        questions.stream().map(q -> {
            Question question1 = new Question();
            BeanUtils.copyProperties(q, question1);
            return question1;
        }).collect(Collectors.toList());
        return questions;
    }
}
