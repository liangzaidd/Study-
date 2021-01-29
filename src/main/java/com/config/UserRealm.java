package com.config;

import com.pojo.User;
import com.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

// 自定义 Realm
public class UserRealm extends AuthorizingRealm {

    private UserService userService;
    @Autowired
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    //    授权信息    AuthorizationInfo
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        System.out.println("==执行了授权==");
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();

        // 获取当前用户
        Subject currentUser = SecurityUtils.getSubject();
        User user = (User) currentUser.getPrincipal();

        //授予权限  根据数据库内容授权roles
//        info.addStringPermission(user.getPerms());
        info.addRole(user.getPerms());

        System.out.println(user);
        return info;
    }

    //    认证信息    AuthenticationInfo
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        System.out.println("==执行了认证==");

        UsernamePasswordToken userToken= (UsernamePasswordToken) token;
        User user = userService.getUser(userToken.getUsername());

        return new SimpleAuthenticationInfo(user,user.getPassword(),"");
    }
}
