package com.qust.engineer.dao;

import com.qust.engineer.pojo.ReportRoute;

public interface ReportRouteMapper {
    int deleteByPrimaryKey(Integer rrId);

    int insert(ReportRoute record);

    int insertSelective(ReportRoute record);

    ReportRoute selectByPrimaryKey(Integer rrId);

    int updateByPrimaryKeySelective(ReportRoute record);

    int updateByPrimaryKey(ReportRoute record);
}