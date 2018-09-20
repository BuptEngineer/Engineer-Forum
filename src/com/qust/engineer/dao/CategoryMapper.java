package com.qust.engineer.dao;


import java.util.List;

import org.apache.ibatis.annotations.ResultType;
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
    
//    @Select("SELECT ctg_name as ctgName FROM tbl_category")
//    @ResultType(Category.class)
    List<Category> selectAllCtg();
}