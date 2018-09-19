package com.qust.engineer.dao;

import org.apache.ibatis.annotations.Select;

import com.qust.engineer.pojo.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer uId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer uId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    // 简单的sql 语句可以使用注解来实现
    //@Select("select count(*) from tbl_user WHERE u_email = #{email}")
    int selectByEmail(String email);
//    @Select("select count(*) from tbl_user WHERE u_email = #{uEmail} AND u_pwd = #{uPwd}")
    int selectByEmailPwd(User user);
    @Select("select u_name from tbl_user where u_email = #{email}")
    String selectNameByEmail(String email);
}