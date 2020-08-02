package ctgu.dao;

import ctgu.entity.Userclass;
import ctgu.entity.UserclassExample;
import java.util.List;

public interface UserclassMapper {
    int deleteByPrimaryKey(Integer classno);

    int insert(Userclass record);

    int insertSelective(Userclass record);

    List<Userclass> selectByExample(UserclassExample example);

    Userclass selectByPrimaryKey(Integer classno);

    int updateByPrimaryKeySelective(Userclass record);

    int updateByPrimaryKey(Userclass record);
}