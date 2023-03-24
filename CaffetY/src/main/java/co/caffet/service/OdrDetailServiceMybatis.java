package co.caffet.service;

import org.apache.ibatis.session.SqlSession;

import co.caffet.common.DataSource;
import co.caffet.mapper.OdrDetailMapper;
import co.caffet.vo.OdrDetailVO;

public class OdrDetailServiceMybatis implements OdrDetailService{
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private OdrDetailMapper mapper = sqlSession.getMapper(OdrDetailMapper.class);

	@Override
	public boolean orderDtl(OdrDetailVO vo) {
		
		return mapper.detailOdr(vo)==1;
	}

}
