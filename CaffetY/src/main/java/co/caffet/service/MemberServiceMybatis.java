package co.caffet.service;

import org.apache.ibatis.session.SqlSession;

import co.caffet.common.DataSource;
import co.caffet.mapper.MemberMapper;
import co.caffet.vo.MemberVO;

public class MemberServiceMybatis implements MemberService{
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
	@Override
	public MemberVO login(MemberVO vo) {

		return mapper.login(vo);
	}
	@Override
	public boolean addMember(MemberVO vo) {
		
		return mapper.insertMember(vo)==1;
	}
	@Override
	public MemberVO getMember(String id) {
		
		return mapper.selectMember(id);
	}
	@Override
	public boolean updateMember(MemberVO vo) {
		
		return mapper.modifyMember(vo)==1;
	}
	@Override
	public boolean removeMember(String id) {
		
		return mapper.deleteMember(id)==1;
	}

}
