package co.caffet.service;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.caffet.common.DataSource;
import co.caffet.mapper.BoardMapper;
import co.caffet.vo.BoardVO;
import co.caffet.vo.CommentVO;

public class BoardServiceMybatis implements BoardService {

	// jdbc : MemberDAO dao;
	// mybatis : DataSource : SqlSessionFactory -> SqlSession;
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	// Mapper.xml 파일의 메소드를 호출.
	private BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);

	@Override
	// 놀이터 목록전체보기
	public List<BoardVO> getBoards(int page) {
		// return mapper.boardList();
		return mapper.boardListWithPaging(page); 
	}

	@Override
	// 놀이터 글등록하기
	public boolean addBoard(BoardVO vo) {
		int r = mapper.addBoardPlay(vo);
		return r == 1;
	}

	@Override
	// 놀이터 단건글보기
	public BoardVO boardPlayView(int boardNum) {
		mapper.boardPlayCount(boardNum);// 게시판 조회수
		return mapper.searchBoard(boardNum); // 게시판 보기

	}

	@Override
	// 조회수처리 -놀이터,큐엔에이
	public int getTotalCount() {
		return mapper.getTotalCount();
	}

//	//글수정처리
	@Override
	public boolean modifyBoard(BoardVO vo) {
		int r = mapper.modifyBoard(vo);
		return r == 1;
	}
	//글삭제처리	
	@Override
	public boolean removeBoard(int boardNum) {
		int r = mapper.removeBoard(boardNum);
		return r == 1;
		
	}

	// -------------------------------------------------//

	@Override
	// QnA-목록보기
	public List<BoardVO> getQna(int parseInt) {
		// return mapper.boardList();
		return mapper.qnaListWithPaging(parseInt);
	}

	@Override
	// QnA-글등록하기
	public boolean addQnA(BoardVO vo) {
		int r = mapper.addBoardQnA(vo);
		return r == 1;
	}

	// QnA-단건보기
	@Override
	public BoardVO boardQnAView(int boardNum) {
		mapper.boardPlayCount(boardNum);// 게시판 조회수
		return mapper.searchQnA(boardNum); // 게시판 보기
	}

	
	//------------------------------------------
	
	
	//댓글 목록보기
	@Override
	public List<CommentVO> getComments(int boardNum) {
		// TODO Auto-generated method stub
		return mapper.commentList();
	}

	

}
