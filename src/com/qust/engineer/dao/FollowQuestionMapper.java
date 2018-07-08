package com.qust.engineer.dao;

import com.qust.engineer.pojo.FollowQuestionKey;

public interface FollowQuestionMapper {
    int deleteByPrimaryKey(FollowQuestionKey key);

    int insert(FollowQuestionKey record);

    int insertSelective(FollowQuestionKey record);
}