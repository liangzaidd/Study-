package com.config;

import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.servlet.Filter;
import java.util.LinkedHashMap;
import java.util.Map;

@Configuration
public class ShiroConfig {

    @Bean(name = "shiroFilter")   //  SpringMVC整合shiro 这个shiroFilterFactoryBean name 要与web.xml中的Filter name 一致
    public ShiroFilterFactoryBean getShiroFilterFactoryBean(@Autowired DefaultWebSecurityManager securityManager){
        ShiroFilterFactoryBean bean = new ShiroFilterFactoryBean();
        //设置安全管理
        bean.setSecurityManager(securityManager);

        //自定义设置shiro Filter Roles
        Map<String, Filter> filters=new LinkedHashMap<String, Filter>();
        filters.put("roles",new RoleFilter());
        bean.setFilters(filters);

        Map<String, String> map=new LinkedHashMap<String, String>();
//        map.put("/book/*","perms[admin:root]");
        map.put("/book/add","roles[admin:add,admin:root]"); //这些需要权限
        map.put("/book/update/*","roles[admin:update,admin:root]");
        map.put("/book/delete/*","roles[admin:root]");
        map.put("/book/*","authc");  // 访问书籍管理页需要认证

        bean.setFilterChainDefinitionMap(map);
        bean.setLoginUrl("/toLogin"); // 设置登录认证的页面
        bean.setUnauthorizedUrl("/unAuthorized"); //设置未授权的页面


        return bean;
    }


    // 2、
    @Bean
    public DefaultWebSecurityManager defaultWebSecurityManager(@Autowired UserRealm userRealm){
        return new DefaultWebSecurityManager(userRealm);
    }


    // 1、创建Realm对象
    @Bean
    public UserRealm userRealm(){
        return new UserRealm();
    }

}
