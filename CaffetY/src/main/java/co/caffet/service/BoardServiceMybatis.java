package co.caffet.service;

import org.apache.ibatis.session.SqlSession;

import co.caffet.common.DataSource;

public class BoardServiceMybatis implements BoardService{
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	// Mapper.xml 파일의 메소드를 호출.

}
