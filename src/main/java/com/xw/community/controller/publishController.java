package com.xw.community.controller;

import com.xw.community.dto.AjaxResult;
import com.xw.community.model.Question;
import com.xw.community.model.Tag;
import com.xw.community.model.User;
import com.xw.community.service.PublishService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class publishController {

    @Autowired
    private PublishService publishService;

    @GetMapping("/publish")
    public String publish(){
        return "publish";
    }

    @PostMapping("/publish")
    @ResponseBody
    public Object doPublish(
            @RequestParam(name = "title") String title,
            @RequestParam(name = "description") String description,
            @RequestParam(name = "tag") String tag,
            @RequestParam(name = "id") Integer id,
            HttpServletRequest request){
        AjaxResult result = new AjaxResult();
        Question quesstion = new Question();
        quesstion.setTitle(title);
        quesstion.setDescription(description);
        quesstion.setTag(tag);
        quesstion.setId(id);
        User user = (User) request.getSession().getAttribute("user");
        quesstion.setCreator(user.getId());
        String[] split = tag.split(",");
        List<String> tags = publishService.queryAllTag();
        String invalid = Arrays.stream(split).filter(t -> !tags.contains(t)).collect(Collectors.joining(","));
        if (!invalid.equals("")){
            result.setSuccess(false);
            result.setMessage("输入非法标签:" + invalid);
        }else {
            int count = publishService.saveQuesstion(quesstion);
            result.setSuccess(count == 1);

            if (count == 0) {
                result.setSuccess(false);
                result.setMessage("问题标题，问题补充，标签不能为空");
            }
        }
            return result;
    }

    @ResponseBody
    @GetMapping("/publish/{id}")
    public Object update(@PathVariable(name = "id") Integer id){
        AjaxResult result = new AjaxResult();
        try {
            Question question = publishService.queryById(id);
            result.setSuccess(true);
            result.setData(question);
        } catch (Exception e) {
            result.setSuccess(false);
            e.printStackTrace();
            result.setMessage("查询数据失败!");
        }
        return result;
    }

    @ResponseBody
    @PostMapping("/tag")
    public Object tag(@RequestParam(name = "type") Integer type){
        AjaxResult result = new AjaxResult();
        try {
            List<Tag> tags = publishService.queryTagByType(type);
            result.setSuccess(true);
            result.setData(tags);
        } catch (Exception e) {
            result.setSuccess(false);
            e.printStackTrace();
            result.setMessage("查询标签失败!");
        }
        return result;
    }
}
