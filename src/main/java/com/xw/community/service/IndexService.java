package com.xw.community.service;

import com.xw.community.dto.Page;
import com.xw.community.dto.QuestionUser;
import com.xw.community.mapper.QuestionMapper;
import com.xw.community.mapper.UserMapper;
import com.xw.community.model.Question;
import com.xw.community.model.QuestionExample;
import com.xw.community.model.User;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class IndexService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private QuestionMapper questionMapper;


    public User findByToken(String token) {
        User user = userMapper.selectByToken(token);
        return user;
    }

    public Page queryPage(Map paramMap) {
        Page page = new Page((Integer) paramMap.get("pageno"), (Integer) paramMap.get("pagesize"));
        Integer startIndex = page.getStartIndex();
        paramMap.put("startIndex", startIndex);
        List<QuestionUser> questionUserList = new ArrayList<>();
        QuestionExample questionExample = new QuestionExample();
        questionExample.setOrderByClause("gmt_create desc");
        List<Question> questions = questionMapper.selectPage(paramMap);
        for (Question question : questions) {
            QuestionUser questionUser = new QuestionUser();
            questionUser.setQuestion(question);
            User user = userMapper.selectByPrimaryKey(question.getCreator());
            questionUser.setUser(user);
            questionUserList.add(questionUser);
        }
        page.setDatas(questionUserList);
        Integer totalsize = questionMapper.queryCount(paramMap);
        page.setTotalsize(totalsize);
        return page;
    }
}
