package co.caffet.mapper;

import co.caffet.vo.MemberVO;

public interface MemberMapper {

	public MemberVO login(MemberVO vo);
	
	public int insertMember(MemberVO vo);

	public MemberVO selectMember(String id);
	
	public int modifyMember(MemberVO vo);
	
	public int deleteMember(String id);
}
