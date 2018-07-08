package com.qust.engineer.dao;

import com.qust.engineer.pojo.ScReply;

public interface ScReplyMapper {
    int deleteByPrimaryKey(Integer scrId);

    int insert(ScReply record);

    int insertSelective(ScReply record);

    ScReply selectByPrimaryKey(Integer scrId);

    int updateByPrimaryKeySelective(ScReply record);

    int updateByPrimaryKey(ScReply record);
}