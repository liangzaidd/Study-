package com.config;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authz.AuthorizationFilter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class RoleFilter extends AuthorizationFilter {
    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
        // 配置Roles角色认证 为或
        String[] roles= (String[]) mappedValue;

        if (roles==null||roles.length==0){ //没有角色限制，有权限访问
            return true;
        }

        Subject subject = getSubject(request, response);
        for (String role : roles) { //遍历角色  含有一个 则有权访问   为 或！
            if (subject.hasRole(role))
            return true;
        }
        return false;
    }
}
