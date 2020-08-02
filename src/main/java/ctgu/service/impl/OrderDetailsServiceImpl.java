package ctgu.service.impl;

import ctgu.dao.OrderDetailsMapper;
import ctgu.entity.OrderDetails;
import ctgu.entity.OrderDetailsExample;
import ctgu.service.OrderDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class OrderDetailsServiceImpl implements OrderDetailsService {
    @Autowired
    private OrderDetailsMapper orderDetailsMapper;
    @Override
    public int deleteByPrimaryKey(Integer id) {
        return orderDetailsMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(OrderDetails record) {
        return orderDetailsMapper.insert(record);
    }

    @Override
    public int insertSelective(OrderDetails record) {
        return orderDetailsMapper.insertSelective(record);
    }

    @Override
    public List<OrderDetails> selectByExample(OrderDetailsExample example) {
        return orderDetailsMapper.selectByExample(example);
    }

    @Override
    public OrderDetails selectByPrimaryKey(Integer id) {
        return orderDetailsMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(OrderDetails record) {
        return orderDetailsMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(OrderDetails record) {
        return orderDetailsMapper.updateByPrimaryKey(record);
    }
}
