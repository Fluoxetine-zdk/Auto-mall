package ctgu.service.impl;

import ctgu.dao.BrandMapper;
import ctgu.entity.Brand;
import ctgu.entity.BrandExample;
import ctgu.service.BrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class BrandServiceImpl implements BrandService {
    @Autowired
    private BrandMapper brandMapper;
    @Override
    public int deleteByPrimaryKey(Integer brandid) {
        return brandMapper.deleteByPrimaryKey(brandid);
    }

    @Override
    public int insert(Brand record) {
        return brandMapper.insert(record);
    }

    @Override
    public int insertSelective(Brand record) {
        return brandMapper.insertSelective(record);
    }

    @Override
    public List<Brand> selectByExample(BrandExample example) {
        return brandMapper.selectByExample(example);
    }

    @Override
    public Brand selectByPrimaryKey(Integer brandid) {
        return brandMapper.selectByPrimaryKey(brandid);
    }

    @Override
    public int updateByPrimaryKeySelective(Brand record) {
        return brandMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Brand record) {
        return brandMapper.updateByPrimaryKey(record);
    }
}
