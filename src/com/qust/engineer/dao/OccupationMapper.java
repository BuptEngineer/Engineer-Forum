package com.qust.engineer.dao;

import com.qust.engineer.pojo.Occupation;

public interface OccupationMapper {
    int deleteByPrimaryKey(Integer oId);

    int insert(Occupation record);

    int insertSelective(Occupation record);

    Occupation selectByPrimaryKey(Integer oId);

    int updateByPrimaryKeySelective(Occupation record);

    int updateByPrimaryKey(Occupation record);
}