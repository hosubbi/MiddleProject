package co.caffet.service;

import co.caffet.vo.MemberVO;

public interface MemberService {

	public MemberVO login(MemberVO vo);
	
	public boolean addMember(MemberVO vo);

	public MemberVO getMember(String id);

	public boolean updateMember(MemberVO vo);
	
	public boolean removeMember(String id);

	
}
