package co.caffet.service;

import org.apache.ibatis.session.SqlSession;

import co.caffet.common.DataSource;

public class OdrDetailServiceMybatis implements OdrDetailService{
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);

}
