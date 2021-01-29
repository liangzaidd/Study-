package com.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.Alias;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Alias("User")
public class User {
    private String name;
    private String password;
    private String perms;



}
