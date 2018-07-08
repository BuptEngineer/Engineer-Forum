package com.qust.engineer.dao;

import com.qust.engineer.pojo.Section;

public interface SectionMapper {
    int deleteByPrimaryKey(Integer sId);

    int insert(Section record);

    int insertSelective(Section record);

    Section selectByPrimaryKey(Integer sId);

    int updateByPrimaryKeySelective(Section record);

    int updateByPrimaryKeyWithBLOBs(Section record);

    int updateByPrimaryKey(Section record);
}