package com.xw.community.service;

import com.xw.community.mapper.QuestionMapper;
import com.xw.community.mapper.TagMapper;
import com.xw.community.model.Question;
import com.xw.community.model.Tag;
import com.xw.community.model.TagExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class PublishService {

    @Autowired
    private QuestionMapper questionMapper;

    @Autowired
    private TagMapper tagMapper;

    public int saveQuesstion(Question quesstion){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        if (quesstion.getTitle() == null || quesstion.getTitle() == ""){
            return 0;
        }else if (quesstion.getDescription() == null || quesstion.getDescription() == ""){
            return 0;
        }else if (quesstion.getTag() == null || quesstion.getTag() == ""){
            return 0;
        }
        if (quesstion.getId() == null) {
            quesstion.setGmtCreate(sdf.format(date));
            quesstion.setGmtModified(quesstion.getGmtCreate());
            return questionMapper.insertSelective(quesstion);
        }else {
            quesstion.setGmtModified(sdf.format(date));
            return questionMapper.updateByPrimaryKeySelective(quesstion);
        }
    }

    public Question queryById(Integer id) {
        return questionMapper.selectByPrimaryKey(id);
    }

    public List<Tag> queryTagByType(Integer type) {
        TagExample TagExample = new TagExample();
        TagExample.createCriteria()
                .andTypeEqualTo(type);
        return tagMapper.selectByExample(TagExample);
    }

    public List<String> queryAllTag() {
        return tagMapper.selectAllTag();
    }
}
