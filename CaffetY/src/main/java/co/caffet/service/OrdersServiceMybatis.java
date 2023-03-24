package co.caffet.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.caffet.common.DataSource;
import co.caffet.mapper.OrderMapper;
import co.caffet.vo.OrdersVO;


public class OrdersServiceMybatis implements OrdersService{
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	OrderMapper mapper = sqlSession.getMapper(OrderMapper.class);

	@Override
	public List<OrdersVO> orders() {
		
		return mapper.orderList();
	}

}
