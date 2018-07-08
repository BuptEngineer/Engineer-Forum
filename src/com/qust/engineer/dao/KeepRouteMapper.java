package com.qust.engineer.dao;

import com.qust.engineer.pojo.KeepRouteKey;

public interface KeepRouteMapper {
    int deleteByPrimaryKey(KeepRouteKey key);

    int insert(KeepRouteKey record);

    int insertSelective(KeepRouteKey record);
}