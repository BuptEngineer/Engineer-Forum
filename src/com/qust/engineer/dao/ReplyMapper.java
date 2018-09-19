package com.qust.engineer.dao;

import com.qust.engineer.pojo.Reply;

public interface ReplyMapper {
    int deleteByPrimaryKey(Integer rId);

    int insert(Reply record);

    int insertSelective(Reply record);

    Reply selectByPrimaryKey(Integer rId);

    int updateByPrimaryKeySelective(Reply record);

    int updateByPrimaryKey(Reply record);
}