package ctgu.service.impl;

import ctgu.dao.ShoppingcartMapper;
import ctgu.entity.Shoppingcart;
import ctgu.entity.ShoppingcartExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ShoppingcartService implements ctgu.service.ShoppingcartService {
    @Autowired
    private ShoppingcartMapper shoppingcartMapper;

    @Override
    public int deleteByPrimaryKey(Integer shoppingcartid) {
        return shoppingcartMapper.deleteByPrimaryKey(shoppingcartid);
    }

    @Override
    public int insert(Shoppingcart record) {
        return shoppingcartMapper.insert(record);
    }

    @Override
    public int insertSelective(Shoppingcart record) {
        return shoppingcartMapper.insertSelective(record);
    }

    @Override
    public List<Shoppingcart> selectByExample(ShoppingcartExample example) {
        return shoppingcartMapper.selectByExample(example);
    }

    @Override
    public Shoppingcart selectByPrimaryKey(Integer shoppingcartid) {
        return shoppingcartMapper.selectByPrimaryKey(shoppingcartid);
    }

    @Override
    public int updateByPrimaryKeySelective(Shoppingcart record) {
        return shoppingcartMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Shoppingcart record) {
        return shoppingcartMapper.updateByPrimaryKey(record);
    }
}
