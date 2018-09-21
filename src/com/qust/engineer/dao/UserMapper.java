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
    
    @Select("SELECT u_id, u_name,u_email,u_sex,u_desc,u_img,u_online,u_date,u_growth,u_vip FROM tbl_user where u_email = #{email}")
    User selectByEmail(String email);
    
    @Select("SELECT u_id, u_name,u_email,u_sex,u_desc,u_img,u_online,u_date,u_growth,u_vip FROM tbl_user where u_name = #{username}")
    User selectByName(String username);
    
    @Select("SELECT u_id, u_name,u_email,u_sex,u_desc,u_img,u_online,u_date,u_growth,u_vip FROM tbl_user")
    List<User> selectAll();
}