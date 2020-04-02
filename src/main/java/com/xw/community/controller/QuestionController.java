package com.xw.community.controller;

import com.xw.community.dto.AjaxResult;
import com.xw.community.dto.QuestionUser;
import com.xw.community.model.Question;
import com.xw.community.model.User;
import com.xw.community.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class QuestionController {

    @Autowired
    private QuestionService questionService;

    @GetMapping("/question")
    public String ToQuestion(){
        return "question";
    }

    @ResponseBody
    @PostMapping("/question/{id}")
    public Object question(@PathVariable(name = "id") Integer id, HttpServletRequest request){
        AjaxResult result = new AjaxResult();
        try {
            QuestionUser questionUser = questionService.queryById(id);
            questionService.incView(id);
            result.setSuccess(true);
            result.setData(questionUser);
            User user = new User();
            if (request.getSession().getAttribute("user") != null) {
                user = (User) request.getSession().getAttribute("user");
            }
            result.setUser(user);
        } catch (Exception e) {
            result.setSuccess(false);
            e.printStackTrace();
            result.setMessage("查询数据失败!");
        }
        return result;
    }

    @ResponseBody
    @GetMapping("/related/{id}")
    public Object related(@PathVariable(name = "id") Integer id){
        AjaxResult result = new AjaxResult();
        try {
            List<Question> question = questionService.queryRelated(id);
            result.setSuccess(true);
            result.setData(question);
        } catch (Exception e) {
            result.setSuccess(false);
            e.printStackTrace();
            result.setMessage("查询相关问题失败!");
        }
        return result;
    }
}
