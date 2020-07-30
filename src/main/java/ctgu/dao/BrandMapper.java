package ctgu.dao;

import ctgu.entity.Brand;
import ctgu.entity.BrandExample;
import java.util.List;

public interface BrandMapper {
    int deleteByPrimaryKey(Integer brandid);

    int insert(Brand record);

    int insertSelective(Brand record);

    List<Brand> selectByExample(BrandExample example);

    Brand selectByPrimaryKey(Integer brandid);

    int updateByPrimaryKeySelective(Brand record);

    int updateByPrimaryKey(Brand record);
}