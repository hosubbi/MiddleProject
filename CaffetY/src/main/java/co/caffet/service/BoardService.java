package co.caffet.service;

import java.util.List;

import co.caffet.vo.BoardVO;
import co.caffet.vo.CommentVO;


public interface BoardService {
	//업무로직을 처리하기 위한 인터페이스 선언
	
	//놀이터목록
	public List<BoardVO> getBoards(int page);
	
	//놀이터등록
	public boolean addBoard(BoardVO vo);
	
	//놀이터 단건글조회
	public BoardVO boardPlayView(int boardNum);
	
	public int getTotalCount();
	//게시글 수정
	public boolean modifyBoard(BoardVO vo);
	//게시글 삭제
	public boolean removeBoard(int boardNum);
	
	//QnA목록
	public List<BoardVO> getQna(int page);
	//QnA등록
	public boolean addQnA(BoardVO vo);
	//QnA 단건글조회
	public BoardVO boardQnAView(int boardNum);
	
	//댓글 목록
	public List<CommentVO> getComments(int commentNum);
	
	
}
