package ctgu.service;

import ctgu.entity.OrderDetails;
import ctgu.entity.OrderDetailsExample;

import java.util.List;

public interface OrderDetailsService {
    int deleteByPrimaryKey(Integer id);

    int insert(OrderDetails record);

    int insertSelective(OrderDetails record);

    List<OrderDetails> selectByExample(OrderDetailsExample example);

    OrderDetails selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OrderDetails record);

    int updateByPrimaryKey(OrderDetails record);
}
