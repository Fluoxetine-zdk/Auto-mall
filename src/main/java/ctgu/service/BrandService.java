package ctgu.service;

import ctgu.entity.Brand;
import ctgu.entity.BrandExample;

import java.util.List;

public interface BrandService {
    int deleteByPrimaryKey(Integer brandid);

    int insert(Brand record);

    int insertSelective(Brand record);

    List<Brand> selectByExample(BrandExample example);

    Brand selectByPrimaryKey(Integer brandid);

    int updateByPrimaryKeySelective(Brand record);

    int updateByPrimaryKey(Brand record);

    List<Brand> selectAll(BrandExample example, Integer page, Integer size);
}
