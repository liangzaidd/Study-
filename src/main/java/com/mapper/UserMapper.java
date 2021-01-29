package com.mapper;

import com.pojo.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    // 获取登录用户 通过用户名
    User getUser(@Param("username") String username);
}
