package com.qust.engineer.dao;

import com.qust.engineer.pojo.Comment;

public interface CommentMapper {
    int deleteByPrimaryKey(Integer acId);

    int insert(Comment record);

    int insertSelective(Comment record);

    Comment selectByPrimaryKey(Integer acId);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKey(Comment record);
}