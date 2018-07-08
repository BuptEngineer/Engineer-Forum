package com.qust.engineer.dao;

import com.qust.engineer.pojo.Letter;

public interface LetterMapper {
    int deleteByPrimaryKey(Integer lId);

    int insert(Letter record);

    int insertSelective(Letter record);

    Letter selectByPrimaryKey(Integer lId);

    int updateByPrimaryKeySelective(Letter record);

    int updateByPrimaryKey(Letter record);
}