package co.caffet.mapper;

import java.util.List;

import co.caffet.vo.BoardVO;
import co.caffet.vo.CommentVO;

public interface BoardMapper {
	// 매퍼(MemberMapper.xml) 에서 실행할 메소드 정의
	// 게시판에서 실행할 메소드 정의
	// Mapper.xml에 기재된 sql문들을 호출함. 변수명은 mapper.xml의 id

	// 놀이터 목록보기
	public List<BoardVO> boardList();

	public List<BoardVO> boardListWithPaging(int page);

	// 놀이터 글등록
	public int addBoardPlay(BoardVO vo);

	// 놀이터 글조회
	public BoardVO searchBoard(int boardNum);

	// 글전체수
	public int getTotalCount();

	// 글조회수
	public void boardPlayCount(int boardNum);

	// 글수정
	public int modifyBoard(BoardVO vo);
	
	//글삭제
	public int removeBoard(int boardNum);

	//-------------------------------------------------------------------------------------//
	
	// QaA 목록보기
	// public List<BoardVO> boardList();
	public List<BoardVO> qnaListWithPaging(int page);

	// QnA 글등록
	public int addBoardQnA(BoardVO vo);

	// QnA 글조회
	public BoardVO searchQnA(int boardNum);

	
	
	
	//----------------------------------------------------------------------------------//
	//댓글 목록보기
	public List<CommentVO> commentList();
	
	
	
	
}
