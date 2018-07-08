package com.qust.engineer.dao;

import com.qust.engineer.pojo.Admin;

public interface AdminMapper {
    int deleteByPrimaryKey(Integer admId);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(Integer admId);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);
}