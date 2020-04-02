package com.xw.community.controller;

import com.xw.community.dto.AjaxResult;
import com.xw.community.dto.Page;
import com.xw.community.model.User;
import com.xw.community.service.IndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
public class IndexController {

    @Autowired
    private IndexService indexService;

    @GetMapping("/")
    public String index(HttpServletRequest request){
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("token")) {
                    String token = cookie.getValue();
                    User users = indexService.findByToken(token);
                    if (users != null) {
                        request.getSession().setAttribute("user", users);
                    }
                    break;
                }
            }
        }
        return "index";
    }

    @GetMapping("/search")
    public String search(){
        return "search";
    }

    @ResponseBody
    @GetMapping("/doIndex")
    public Object index(@RequestParam(name = "pageno", defaultValue = "1") Integer pageno,
                        @RequestParam(value = "pagesize", defaultValue = "10") Integer pagesize,
                        @RequestParam(value = "queryText", required = false, defaultValue = "") String queryText) {
        AjaxResult result = new AjaxResult();
        try {
            Map paramMap = new HashMap();
            paramMap.put("pageno", pageno);
            paramMap.put("pagesize", pagesize);
            if (queryText.length() != 0){
                if (queryText.contains(" ")){
                    String[] splits = StringUtils.split(queryText, " ");
                    queryText = Arrays.stream(splits).collect(Collectors.joining("|"));
                }
                if (queryText.contains("%")){
                    queryText = queryText.replaceAll("%", "\\\\%");
                }
                paramMap.put("queryText", queryText);
            }
            Page page = indexService.queryPage(paramMap);
            result.setSuccess(true);
            result.setPage(page);
        } catch (Exception e) {
            result.setSuccess(false);
            e.printStackTrace();
            result.setMessage("查询数据失败！");
        }
        return result;
    }
}
