package ctgu.service;

import ctgu.entity.Order;
import ctgu.entity.OrderExample;

import java.util.List;

public interface OrderService {
    int deleteByPrimaryKey(Integer orderid);

    int insert(Order record);

    int insertSelective(Order record);

    List<Order> selectByExample(OrderExample example);

    Order selectByPrimaryKey(Integer orderid);

    int updateByPrimaryKeySelective(Order record);

    int updateByPrimaryKey(Order record);
}