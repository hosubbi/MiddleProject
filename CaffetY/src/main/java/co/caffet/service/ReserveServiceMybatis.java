package co.caffet.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.caffet.common.DataSource;
import co.caffet.mapper.OrderMapper;
import co.caffet.mapper.ReserveMapper;
import co.caffet.vo.ReserveVO;

public class ReserveServiceMybatis implements ReserveService{
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	ReserveMapper mapper = sqlSession.getMapper(ReserveMapper.class);

	@Override
	public List<ReserveVO> reserves() {
		
		return mapper.reserveList();
	}

}
