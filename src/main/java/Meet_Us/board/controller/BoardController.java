package Meet_Us.board.controller;

import java.io.File; 
import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import Meet_Us.board.service.AmazonS3ClientService;
import Meet_Us.board.service.BoardService;
import Meet_Us.board.vo.BoardVo;
import Meet_Us.board.vo.FileVo;
import Meet_Us.board.vo.PageCriteria;
import Meet_Us.board.vo.PageMaker;

@Controller
@EnableAutoConfiguration
public class BoardController {

	@Autowired
	private BoardService service;
	@Autowired
	private AmazonS3ClientService amazonS3ClientService;

	@RequestMapping(value = "/boardTest", method = RequestMethod.GET)
	public String test(Model model) throws Exception {
		model.addAttribute("test", service.selectBoardList());

		return "board/BoardMain";
	}

	@RequestMapping(value = "/Notice", method = RequestMethod.GET)
	public String Notice(Model model, PageCriteria cri) throws Exception {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		
		List<Map<String, Object>> noticeCount = service.selectCountBoardList();
		pageMaker.setTotalCount(noticeCount.size()); 
		
		List<BoardVo> list = service.selectBoardPageList(cri);
		model.addAttribute("pageCriteria", cri);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);

		return "bootstrap.Notice";
	}
	
	@RequestMapping(value = "/NoticeSearchList", method = RequestMethod.GET)
	public String NoticeSearchList(Model model, PageCriteria cri) throws Exception {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		List<Map<String, Object>> noticeCount = service.selectCountSearchList(cri.getKeyword());
		pageMaker.setTotalCount(noticeCount.size()); 
		
		List<BoardVo> list = service.selectSearchPageList(cri);
		model.addAttribute("pageCriteria", cri);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);

		return "bootstrap.Notice";
	}

	@RequestMapping(value = "/NoticeDetail", method = RequestMethod.GET)
	public String NoticeDetail(Model model, BoardVo vo) throws Exception {
		service.IncreaseBoardViewCount(vo);
		model.addAttribute("detail", service.selectBoardDetail(vo.getBoard_no()));
		
		List<FileVo> files = service.fileDetail(vo.getBoard_no());
		model.addAttribute("files", files);

		return "bootstrap.NoticeDetail";
	}

	@RequestMapping(value = "/NoticeDelete", method = RequestMethod.GET)
	public String NoticeDelete(Model model, BoardVo vo) throws Exception {
		service.deleteBoard(vo.getBoard_no());
		model.addAttribute("list", service.selectBoardList());

		return "redirect:/Notice";
	}

	@RequestMapping(value = "/NoticeInsert", method = RequestMethod.GET)
	public String NoticeInsert() throws Exception {

		return "bootstrap.NoticeInsert";
	}

	@RequestMapping(value = "/NoticeInsertProcess", method = RequestMethod.POST)
	public String NoticeInsertProcess(Model model, BoardVo vo, FileVo file
												 , @RequestParam("files") MultipartFile[] files
												 , Principal principal) throws Exception {
		
		String description = vo.getBoard_content();
		vo.setBoard_content(description.replace("\r\n", "<br>")); // 줄바꿈 처리
		vo.setUser_id(principal.getName());
//		service.insertBoard(vo);
		int fileNo = service.latelyBoard();
		
		for(int i=0; i < files.length; i++) {
			if(files[i].getOriginalFilename() != "") {
				
		this.amazonS3ClientService.uploadFileToS3Bucket(files[i], true);
			
		String fileName = files[i].getOriginalFilename();
		String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();
		File destinationFile;
		String destinationFileName;
		String fileRealUrl = "https://meet-us.s3.ap-northeast-2.amazonaws.com/" + fileName;
		String fileUrl= fileRealUrl;
		
		do {
			destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension;
			destinationFile = new File(fileUrl + destinationFileName);
		} while (destinationFile.exists());

           file.setUp_Seq(fileNo);
           file.setFile_Name(destinationFileName);
           file.setFile_Real_Name(fileName);
           file.setFile_Path(fileUrl);

           service.fileInsert(file); //file insert
			}
		}
		service.insertBoard(vo);
		return "redirect:/Notice";
	}

	@RequestMapping(value = "/NoticeModify", method = RequestMethod.GET)
	public String NoticeModify(Model model, BoardVo vo) throws Exception {
		model.addAttribute("modify", service.selectBoardDetail(vo.getBoard_no()));
		
		List<FileVo> files = service.fileDetail(vo.getBoard_no());
		model.addAttribute("files", files);

		return "bootstrap.NoticeModify";
	}

	@RequestMapping(value = "/NoticeModifyProcess", method = RequestMethod.POST)
	public String NoticeModifyProcess(Model model, BoardVo vo
			                                     , FileVo file
			                                     , HttpSession session
			                                     , MultipartHttpServletRequest request
			                                     , @RequestParam("files") MultipartFile[] filesM ) throws Exception {
		
		String description = vo.getBoard_content();
		vo.setBoard_content(description.replace("\r\n", "<br>")); // 줄바꿈 처리
		service.ModifyBoard(vo);
		model.addAttribute("detail", service.selectBoardDetail(vo.getBoard_no()));
		
		int fileNo = service.latelyBoard();
		for(int i=0; i < filesM.length; i++) {
			if(filesM[i].getOriginalFilename() != "") {
			
		this.amazonS3ClientService.uploadFileToS3Bucket(filesM[i], true);	
		
		String fileName = filesM[i].getOriginalFilename();
		String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();
		File destinationFile;
		String destinationFileName;
		String fileRealUrl = "https://meet-us.s3.ap-northeast-2.amazonaws.com/" + fileName;
		String fileUrl= fileRealUrl;
		
		
		do {
			destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension;
			destinationFile = new File(fileUrl + destinationFileName);
		} while (destinationFile.exists());

           file.setUp_Seq(fileNo);
           file.setFile_Name(destinationFileName);
           file.setFile_Real_Name(fileName);
           file.setFile_Path(fileUrl);

           service.fileInsert(file); //file insert
           
			}
		}
		
		List<FileVo> files = service.fileDetail(vo.getBoard_no());
		model.addAttribute("files", files);
		
		return "bootstrap.NoticeDetail";
	}
	
	//파일 다운로드
	@RequestMapping("/fileDown/{up_Seq}/{seq}")
    private ResponseEntity<byte[]> fileDown(@PathVariable String up_Seq, @PathVariable String seq, HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        service.fileDownloadCnt(Integer.parseInt(up_Seq), Integer.parseInt(seq));
        
        //aws s3에서 파일 다운로드
        String fileName = service.downloadFileName(up_Seq, seq);
     
        return this.amazonS3ClientService.downloadFileFromS3Bucket(fileName);
        
    }
	
	 

		//파일 삭제
//		@ResponseBody
		@RequestMapping("/fileDelete/{up_Seq}/{seq}")
	    private String fileDelete(@PathVariable String up_Seq , @PathVariable String seq
	    		,Model model
	    		) throws Exception{ 
			
			//aws s3에서 파일 삭제
//			String fileName = service.downloadFileName(up_Seq, seq);
//			this.amazonS3ClientService.deleteFileFromS3Bucket(fileName);
		
			service.fileDelete(Integer.parseInt(up_Seq), Integer.parseInt(seq));
	        model.addAttribute("modify", service.selectBoardDetail(Integer.parseInt(up_Seq)));
			
			List<FileVo> files = service.fileDetail(Integer.parseInt(up_Seq));
			model.addAttribute("files", files);

			return "bootstrap.NoticeModify";
	    }

}
