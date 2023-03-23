package co.caffet.service;

import org.apache.ibatis.session.SqlSession;

import co.caffet.common.DataSource;

public class CartServiceMybatis implements CartService{
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);

}
