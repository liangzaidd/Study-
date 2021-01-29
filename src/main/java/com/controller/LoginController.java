package com.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {

    @RequestMapping("/toLogin")
    public String toLogin(){
        return "login";
    }

    @RequestMapping("/login")
    public String login(@RequestParam String username, @RequestParam String password, Model model){
        Subject currentUser = SecurityUtils.getSubject();  //获取当前登录用户
        UsernamePasswordToken token = new UsernamePasswordToken(username, password);  //封装用户数据
        try {
            currentUser.login(token);
            return "redirect:/book/welcome";
        } catch (Exception e) {
            model.addAttribute("msg","用户名或者密码错误，请重新登陆");
            return "login";
        }
    }

    @RequestMapping("/unAuthorized")
    @ResponseBody
    public String unAuthorized(){
        return "权限不足，不能访问";
    }

    @RequestMapping("/logout")
    public String logOut(){
        Subject currentUser = SecurityUtils.getSubject(); //获取当前用户
        currentUser.logout(); //登出
        return "login";
    }
}
