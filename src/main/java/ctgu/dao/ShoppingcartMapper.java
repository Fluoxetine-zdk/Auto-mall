package ctgu.dao;

import ctgu.entity.Shoppingcart;
import ctgu.entity.ShoppingcartExample;
import java.util.List;

public interface ShoppingcartMapper {
    int deleteByPrimaryKey(Integer shoppingcartid);

    int insert(Shoppingcart record);

    int insertSelective(Shoppingcart record);

    List<Shoppingcart> selectByExample(ShoppingcartExample example);

    Shoppingcart selectByPrimaryKey(Integer shoppingcartid);

    int updateByPrimaryKeySelective(Shoppingcart record);

    int updateByPrimaryKey(Shoppingcart record);
}