package Meet_Us.board.service;

import java.util.List;
import java.util.Map;

import Meet_Us.board.vo.BoardVo;
import Meet_Us.board.vo.FileVo;
import Meet_Us.board.vo.PageCriteria;

public interface BoardService {

	public List<BoardVo> selectBoardList() throws Exception;

	public List<BoardVo> selectBoardPageList(PageCriteria cri) throws Exception;
	
	public List<Map<String, Object>> selectCountBoardList() throws Exception;
	
	public List<BoardVo> selectSearchPageList(PageCriteria cri) throws Exception;
	
	public List<Map<String, Object>> selectCountSearchList(String keyword) throws Exception;

	public BoardVo selectBoardDetail(int board_no) throws Exception;

	public int deleteBoard(int board_no) throws Exception;

	public int insertBoard(BoardVo vo) throws Exception;

	public int ModifyBoard(BoardVo vo) throws Exception;

	public int IncreaseBoardViewCount(BoardVo vo) throws Exception;
	
//	파일 업로드 관련
	//파일 업로드
	public void fileInsert(FileVo file) throws Exception;
	
	//파일 리스트
	public List<FileVo> fileDetail(int seq) throws Exception;
	
	//파일 다운로드
	public String downloadFileName(String up_Seq, String seq) throws Exception;
	
	//파일 삭제
	public void fileDelete(int up_Seq, int seq) throws Exception;
	
	//파일 다운로드 회수 증가
	public void fileDownloadCnt(int up_Seq, int seq) throws Exception;
	
	//첨부파일 upSeq
	public int latelyBoard() throws Exception;
}
