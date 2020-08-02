package ctgu.service;

import ctgu.entity.Carinfo;
import ctgu.entity.CarinfoExample;

import java.util.List;

public interface CarService {
    int deleteByPrimaryKey(Integer carid);

    int insert(Carinfo record);

    int insertSelective(Carinfo record);

    List<Carinfo> selectByExample(CarinfoExample example, Integer page, Integer size);

    Carinfo selectByPrimaryKey(Integer carid);

    int updateByPrimaryKeySelective(Carinfo record);

    int updateByPrimaryKey(Carinfo record);
}
