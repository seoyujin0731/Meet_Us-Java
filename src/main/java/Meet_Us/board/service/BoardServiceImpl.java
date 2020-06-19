package Meet_Us.board.service;

import java.util.HashMap; 
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Meet_Us.board.dao.BoardMapper;
import Meet_Us.board.vo.BoardVo;
import Meet_Us.board.vo.FileVo;
import Meet_Us.board.vo.PageCriteria;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;

	@Override
	public List<BoardVo> selectBoardList() throws Exception {
		return mapper.selectBoardList();
	}

	@Override
	public List<BoardVo> selectBoardPageList(PageCriteria cri) throws Exception {
		return mapper.selectBoardPageList(cri);
	}

	@Override
	public List<Map<String, Object>> selectCountBoardList() throws Exception {
		return mapper.selectCountBoardList();
	}

	@Override
	public List<BoardVo> selectSearchPageList(PageCriteria cri) throws Exception {
		return mapper.selectSearchPageList(cri);
	}

	@Override
	public List<Map<String, Object>> selectCountSearchList(String keyword) throws Exception {
		return mapper.selectCountSearchList(keyword);
	}

	@Override
	public BoardVo selectBoardDetail(int board_no) throws Exception {
		return mapper.selectBoardDetail(board_no);
	}

	@Override
	public int deleteBoard(int board_no) throws Exception {
		return mapper.deleteBoard(board_no);
	}

	@Override
	public int insertBoard(BoardVo vo) throws Exception {
		return mapper.insertBoard(vo);
	}

	@Override
	public int ModifyBoard(BoardVo vo) throws Exception {
		return mapper.ModifyBoard(vo);
	}

	@Override
	public int IncreaseBoardViewCount(BoardVo vo) throws Exception {
		return mapper.IncreaseBoardViewCount(vo);
	}
	
//	첨부파일 관련
	//파일 업로드 
	@Override
	public void fileInsert(FileVo file) throws Exception {
		mapper.fileInsert(file);
	}
	
	//파일 리스트
	@Override
	public List<FileVo> fileDetail(int seq) throws Exception {
		return mapper.fileDetail(seq);
	}
	//파일 다운로드
	@Override
	public String downloadFileName(String up_Seq, String seq) throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("up_Seq", up_Seq);
		map.put("seq", seq);
		return mapper.downloadFileName(map);
	}
	//파일 삭제
	@Override
	public void fileDelete(int up_Seq, int seq) throws Exception {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("up_Seq", up_Seq);
		map.put("seq", seq);
		mapper.fileDelete(map);
	}
	//파일 다운로드 회수 증가
	@Override
	public void fileDownloadCnt(int up_Seq, int seq) throws Exception {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("up_Seq", up_Seq);
		map.put("seq", seq);
		mapper.fileDownloadCnt(map);
	}
	//첨부파일 upSeq
	@Override
	public int latelyBoard() throws Exception {
		return mapper.latelyBoard();
	}  

}
