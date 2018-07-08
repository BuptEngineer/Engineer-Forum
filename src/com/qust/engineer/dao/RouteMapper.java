package com.qust.engineer.dao;

import com.qust.engineer.pojo.Route;

public interface RouteMapper {
    int deleteByPrimaryKey(Integer rtId);

    int insert(Route record);

    int insertSelective(Route record);

    Route selectByPrimaryKey(Integer rtId);

    int updateByPrimaryKeySelective(Route record);

    int updateByPrimaryKey(Route record);
}