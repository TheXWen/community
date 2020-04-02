package com.xw.community.controller;

import com.xw.community.dto.AjaxResult;
import com.xw.community.dto.Page;
import com.xw.community.model.User;
import com.xw.community.service.ProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Controller
public class profileController {

    @Autowired
    private ProfileService profileService;

    @GetMapping("/profile/questions")
    public String profle(){
        return "profile";
    }

    @ResponseBody
    @GetMapping("/profile/{action}")
    public Object doProfile(@PathVariable(name = "action") String action,
                            HttpServletRequest request,
                            @RequestParam(name = "pageno", defaultValue = "1") Integer pageno,
                            @RequestParam(value = "pagesize", defaultValue = "5") Integer pagesize){
        User user = (User)request.getSession().getAttribute("user");
        AjaxResult result = new AjaxResult();
        try {
            Map paramMap = new HashMap();
            paramMap.put("pageno", pageno);
            paramMap.put("pagesize", pagesize);
            paramMap.put("creator", user.getId());
            if ("doQuestions".equals(action)){
                paramMap.put("sectionName", "我的提问");
                paramMap.put("section", "questions");
                Page page = profileService.queryQuestionByUserId(paramMap);
                result.setSuccess(true);
                result.setPage(page);
            }else if ("replies".equals(action)){
                paramMap.put("sectionName", "最新回复");
                paramMap.put("section", "replies");
                Page page = profileService.queryReplies(paramMap);
                result.setSuccess(true);
                result.setPage(page);
            }
        } catch (Exception e) {
            result.setSuccess(false);
            e.printStackTrace();
            result.setMessage("查询数据失败!");
        }
        return result;
    }

    @ResponseBody
    @GetMapping("/totalNotice")
    public Long totalNotice(HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        return profileService.countNotice(user.getId());
    }
}
