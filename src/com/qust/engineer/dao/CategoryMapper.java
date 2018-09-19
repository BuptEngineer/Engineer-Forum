package com.qust.engineer.dao;


import org.apache.ibatis.annotations.Select;

import com.qust.engineer.pojo.Category;

public interface CategoryMapper {
    int deleteByPrimaryKey(Integer ctgId);

    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(Integer ctgId);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);
    
    @Select("SELECT count(*) FROM tbl_category WHERE ctg_name = #{ctgName}")
    int selectByCtgName(String ctgName);
}