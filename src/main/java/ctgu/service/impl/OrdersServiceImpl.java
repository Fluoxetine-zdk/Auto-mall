package ctgu.service.impl;


import ctgu.dao.OrdersMapper;
import ctgu.entity.Orders;
import ctgu.entity.OrdersExample;
import ctgu.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class OrdersServiceImpl implements OrdersService {

    @Autowired
    private OrdersMapper ordersMapper;


    @Override
    public int deleteByPrimaryKey(Integer orderid) {
        return ordersMapper.deleteByPrimaryKey(orderid);
    }

    @Override
    public int insert(Orders record) {
        return ordersMapper.insert(record);
    }

    @Override
    public int insertSelective(Orders record) {
        return ordersMapper.insertSelective(record);
    }

    @Override
    public List<Orders> selectByExample(OrdersExample example, Integer page, Integer size) {
        return ordersMapper.selectByExample(example);
    }

    @Override
    public Orders selectByPrimaryKey(Integer orderid) {
        return ordersMapper.selectByPrimaryKey(orderid);
    }

    @Override
    public int updateByPrimaryKeySelective(Orders record) {
        return ordersMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Orders record) {
        return ordersMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<Orders> selectByExample(OrdersExample example) {
        return ordersMapper.selectByExample(example);
    }
}
