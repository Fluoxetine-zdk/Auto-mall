package ctgu.service;



import ctgu.entity.Orders;
import ctgu.entity.OrdersExample;

import java.util.List;

public interface OrdersService {
    int deleteByPrimaryKey(Integer orderid);

    int insert(Orders record);

    int insertSelective(Orders record);

    List<Orders> selectByExample(OrdersExample example, Integer page, Integer size);

    Orders selectByPrimaryKey(Integer orderid);

    int updateByPrimaryKeySelective(Orders record);

    int updateByPrimaryKey(Orders record);

    List<Orders> selectByExample(OrdersExample example);

}
