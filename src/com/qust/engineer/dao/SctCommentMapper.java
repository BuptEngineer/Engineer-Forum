package com.qust.engineer.dao;

import com.qust.engineer.pojo.SctComment;

public interface SctCommentMapper {
    int deleteByPrimaryKey(Integer scId);

    int insert(SctComment record);

    int insertSelective(SctComment record);

    SctComment selectByPrimaryKey(Integer scId);

    int updateByPrimaryKeySelective(SctComment record);

    int updateByPrimaryKey(SctComment record);
}