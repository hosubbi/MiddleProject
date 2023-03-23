package co.caffet.service;

import org.apache.ibatis.session.SqlSession;

import co.caffet.common.DataSource;

public class RatingsServiceMybatis implements RatingsService{
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);

}
