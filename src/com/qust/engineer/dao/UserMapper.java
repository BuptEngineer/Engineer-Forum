package com.qust.engineer.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.qust.engineer.pojo.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer uId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer uId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record); //待实现
    
    @Select("SELECT COUNT(*) FROM tbl_user where u_email = #{uEmail} and u_pwd = #{uPwd}") // 直接使用属性名即可，不必再引用参数对象名
    int selectByEmailPwd(User user);
    
    @Select("SELECT u_id, u_name, u_email FROM tbl_user where u_email = #{email}")
    User selectNameByEmail(String email);
    
    @Select("SELECT count(*) FROM tbl_user where u_email = #{email}")
    int selectByEmail(String email);
    
    User selectByName(String username);//待实现
    
    List<User> selectAll();//待实现
}