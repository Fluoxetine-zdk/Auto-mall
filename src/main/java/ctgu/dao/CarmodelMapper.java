package ctgu.dao;

import ctgu.entity.Carmodel;
import ctgu.entity.CarmodelExample;
import java.util.List;

public interface CarmodelMapper {
    int deleteByPrimaryKey(Integer modelid);

    int insert(Carmodel record);

    int insertSelective(Carmodel record);

    List<Carmodel> selectByExample(CarmodelExample example);

    Carmodel selectByPrimaryKey(Integer modelid);

    int updateByPrimaryKeySelective(Carmodel record);

    int updateByPrimaryKey(Carmodel record);
}