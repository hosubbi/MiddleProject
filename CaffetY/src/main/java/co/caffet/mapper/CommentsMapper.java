package co.caffet.mapper;


import java.util.List;

import co.caffet.vo.CommentVO;

public interface CommentsMapper {
	//댓글 조회 
	public List<CommentVO> getComments(int num);
	//댓글 등록
	public int addComments(CommentVO cvo);
	//댓글 수정
	public CommentVO modifyComments(CommentVO cvo);
	//댓글 조회(한건)
	public CommentVO selectComment(int cNum);
}
