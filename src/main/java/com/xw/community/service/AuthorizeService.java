package com.xw.community.service;

import com.xw.community.mapper.UserMapper;
import com.xw.community.model.User;
import com.xw.community.model.UserExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AuthorizeService {

    @Autowired
    private UserMapper userMapper;

    public void insertUser(User user){
        UserExample userExample = new UserExample();
        userExample.createCriteria()
                .andAccountIdEqualTo(user.getAccountId());
        List<User> users = userMapper.selectByExample(userExample);
            if (users.size() == 0){
                user.setGmtCreate(System.currentTimeMillis());
                user.setGmtModified(user.getGmtCreate());
                userMapper.insert(user);
            }else {
                User dbuser = users.get(0);
                User updateUser = new User();
                updateUser.setName(user.getName());
                updateUser.setGmtModified(System.currentTimeMillis());
                updateUser.setAvatarUrl(user.getAvatarUrl());
                updateUser.setToken(user.getToken());
                UserExample example = new UserExample();
                example.createCriteria()
                        .andIdEqualTo(dbuser.getId());
                userMapper.updateByExampleSelective(updateUser, example);
            }

    }
}
