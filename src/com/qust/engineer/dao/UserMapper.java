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
    
    @Select("SELECT COUNT(*) FROM tbl_user where u_email = #{uEmail} and u_pwd = #{uPwd}") // 直接使用属性名即可，不必再引用参数对象名
    int selectByEmailPwd(User user);
    
    @Select("SELECT u_name FROM tbl_user where u_email = #{email}")
    String selectNameByEmail(String email);
    
    @Select("SELECT count(*) FROM tbl_user where u_email = #{email}")
    int selectByEmail(String email);
}