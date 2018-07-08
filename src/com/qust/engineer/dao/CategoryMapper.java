package com.qust.engineer.dao;

import com.qust.engineer.pojo.Category;

public interface CategoryMapper {
    int deleteByPrimaryKey(Integer ctgId);

    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(Integer ctgId);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);
}