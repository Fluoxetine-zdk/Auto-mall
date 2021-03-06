package ctgu.dao;

import ctgu.entity.Admin;
import ctgu.entity.AdminExample;
import java.util.List;

public interface AdminMapper {
    int deleteByPrimaryKey(String adminname);

    int insert(Admin record);

    int insertSelective(Admin record);

    List<Admin> selectByExample(AdminExample example);

    Admin selectByPrimaryKey(String adminname);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);
}