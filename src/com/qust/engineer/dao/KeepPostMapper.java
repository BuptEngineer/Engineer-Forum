package com.qust.engineer.dao;

import com.qust.engineer.pojo.KeepPostKey;

public interface KeepPostMapper {
    int deleteByPrimaryKey(KeepPostKey key);

    int insert(KeepPostKey record);

    int insertSelective(KeepPostKey record);
}