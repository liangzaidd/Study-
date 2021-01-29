package com.service;
import com.pojo.User;

public interface UserService {
    // 获取登录用户 通过用户名
    User getUser (String username);
}
