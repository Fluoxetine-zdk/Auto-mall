package ctgu.dao;

import ctgu.entity.Carmodle;
import ctgu.entity.CarmodleExample;
import java.util.List;

public interface CarmodleMapper {
    int deleteByPrimaryKey(Integer modleid);

    int insert(Carmodle record);

    int insertSelective(Carmodle record);

    List<Carmodle> selectByExample(CarmodleExample example);

    Carmodle selectByPrimaryKey(Integer modleid);

    int updateByPrimaryKeySelective(Carmodle record);

    int updateByPrimaryKey(Carmodle record);
}