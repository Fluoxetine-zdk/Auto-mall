package ctgu.service.impl;

import com.github.pagehelper.PageHelper;
import ctgu.dao.CarinfoMapper;
import ctgu.entity.Carinfo;
import ctgu.entity.CarinfoExample;
import ctgu.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CarServiceImpl implements CarService {
    @Autowired
    private CarinfoMapper carinfoMapper;

    @Override
    public int deleteByPrimaryKey(Integer carid) {
        return carinfoMapper.deleteByPrimaryKey(carid);
    }

    @Override
    public int insert(Carinfo record) {
        return carinfoMapper.insert(record);
    }

    @Override
    public int insertSelective(Carinfo record) {
        return carinfoMapper.insertSelective(record);
    }

    @Override
    public List<Carinfo> selectByExample(CarinfoExample example) {
        return carinfoMapper.selectByExample(example);
    }

    @Override
    public Carinfo selectByPrimaryKey(Integer carid) {
        return carinfoMapper.selectByPrimaryKey(carid);
    }

    @Override
    public int updateByPrimaryKeySelective(Carinfo record) {
        return carinfoMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Carinfo record) {
        return carinfoMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<Carinfo> selectListByPages(CarinfoExample example, Integer page, Integer size) {
        PageHelper.startPage(page,size);
        return carinfoMapper.selectByExample(example);
    }
}
