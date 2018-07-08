package com.qust.engineer.dao;

import com.qust.engineer.pojo.Reply;

public interface ReplyMapper {
    int deleteByPrimaryKey(Integer acrId);

    int insert(Reply record);

    int insertSelective(Reply record);

    Reply selectByPrimaryKey(Integer acrId);

    int updateByPrimaryKeySelective(Reply record);

    int updateByPrimaryKey(Reply record);
}