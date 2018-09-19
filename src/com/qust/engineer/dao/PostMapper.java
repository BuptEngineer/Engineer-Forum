package com.qust.engineer.dao;

import com.qust.engineer.pojo.Post;

public interface PostMapper {
    int deleteByPrimaryKey(Integer pId);

    int insert(Post record);

    int insertSelective(Post record);

    Post selectByPrimaryKey(Integer pId);

    int updateByPrimaryKeySelective(Post record);

    int updateByPrimaryKey(Post record);
}