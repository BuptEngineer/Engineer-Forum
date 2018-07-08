package com.qust.engineer.dao;

import com.qust.engineer.pojo.Answer;

public interface AnswerMapper {
    int deleteByPrimaryKey(Integer aId);

    int insert(Answer record);

    int insertSelective(Answer record);

    Answer selectByPrimaryKey(Integer aId);

    int updateByPrimaryKeySelective(Answer record);

    int updateByPrimaryKeyWithBLOBs(Answer record);

    int updateByPrimaryKey(Answer record);
}