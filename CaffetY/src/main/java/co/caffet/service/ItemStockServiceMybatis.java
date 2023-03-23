package co.caffet.service;

import org.apache.ibatis.session.SqlSession;

import co.caffet.common.DataSource;

public class ItemStockServiceMybatis implements ItemStockService{
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);

}
