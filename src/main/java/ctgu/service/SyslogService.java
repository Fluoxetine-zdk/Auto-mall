package ctgu.service;

import ctgu.entity.Syslog;
import ctgu.entity.SyslogExample;

import java.util.List;

public interface SyslogService {
    int deleteByPrimaryKey(Integer id);

    int insert(Syslog record);

    int insertSelective(Syslog record);

    List<Syslog> selectByExample(SyslogExample example);

    Syslog selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Syslog record);

    int updateByPrimaryKey(Syslog record);
}
