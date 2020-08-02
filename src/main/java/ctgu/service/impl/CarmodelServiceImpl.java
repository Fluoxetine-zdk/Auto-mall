package ctgu.service.impl;

import ctgu.dao.CarmodelMapper;
import ctgu.entity.Carmodel;
import ctgu.entity.CarmodelExample;
import ctgu.service.CarmodelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CarmodelServiceImpl implements CarmodelService {
    @Autowired
    private CarmodelMapper carmodelMapper;
    @Override
    public int deleteByPrimaryKey(Integer modelid) {
        return carmodelMapper.deleteByPrimaryKey(modelid);
    }

    @Override
    public int insert(Carmodel record) {
        return carmodelMapper.insert(record);
    }

    @Override
    public int insertSelective(Carmodel record) {
        return carmodelMapper.insertSelective(record);
    }

    @Override
    public List<Carmodel> selectByExample(CarmodelExample example) {
        return carmodelMapper.selectByExample(example);
    }

    @Override
    public Carmodel selectByPrimaryKey(Integer modelid) {
        return carmodelMapper.selectByPrimaryKey(modelid);
    }

    @Override
    public int updateByPrimaryKeySelective(Carmodel record) {
        return carmodelMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Carmodel record) {
        return carmodelMapper.updateByPrimaryKey(record);
    }
}
