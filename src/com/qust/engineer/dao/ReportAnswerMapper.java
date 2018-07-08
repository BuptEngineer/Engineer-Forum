package com.qust.engineer.dao;

import com.qust.engineer.pojo.ReportAnswer;

public interface ReportAnswerMapper {
    int deleteByPrimaryKey(Integer raId);

    int insert(ReportAnswer record);

    int insertSelective(ReportAnswer record);

    ReportAnswer selectByPrimaryKey(Integer raId);

    int updateByPrimaryKeySelective(ReportAnswer record);

    int updateByPrimaryKey(ReportAnswer record);
}