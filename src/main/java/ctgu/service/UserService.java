package ctgu.service;

import ctgu.entity.User;
import ctgu.entity.UserExample;

import java.util.List;

public interface UserService {
    int deleteByPrimaryKey(String username);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectByExample(UserExample example);

    User selectByPrimaryKey(String username);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}
