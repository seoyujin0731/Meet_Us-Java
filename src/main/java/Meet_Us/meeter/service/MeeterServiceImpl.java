package Meet_Us.meeter.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Meet_Us.meeter.dao.MeeterMapper;
import Meet_Us.meeter.vo.AttendUserInfo;
import Meet_Us.meeter.vo.FileVo;
import Meet_Us.meeter.vo.ImageVo;
import Meet_Us.meeter.vo.MeetBoardReplyVo;
import Meet_Us.meeter.vo.MeetingBoardVo;
import Meet_Us.meeter.vo.PageCriteria;
import Meet_Us.meeter.vo.PushUsertokens;
import Meet_Us.userTeam.vo.UserTeamVo;
 
@Service
public class MeeterServiceImpl implements MeeterService {

	@Autowired
	private MeeterMapper mapper;
	
	@Override
	public MeetingBoardVo[] selectHomeMeetingList() throws Exception {
		return mapper.selectHomeMeetingList();
	}
	
	@Override
	public MeetingBoardVo[] selectMeetingList(PageCriteria cri) throws Exception {
		return mapper.selectMeetingList(cri);
	}
	
	@Override
	public List<Map<String, Object>> selectCountMeetingList() throws Exception {
		return mapper.selectCountMeetingList();
	}
	
	@Override
	public List<Map<String, Object>> selectCountSearchMeetingList(PageCriteria cri) throws Exception {
		if(cri.getPlaceKeyword() == "" || cri.getPlaceKeyword() ==  null)
			cri.setPlaceKeyword("null");
		if(cri.getPurposeKeyword() == "" || cri.getPurposeKeyword() == null)
			cri.setPurposeKeyword("null");
		if(cri.getDateKeyword() == "" || cri.getDateKeyword() == null)
			cri.setDateKeyword("null");
		if(cri.getTitleKeyword() == "" || cri.getTitleKeyword() == null)
			cri.setTitleKeyword("null");
		
		return mapper.selectCountSearchMeetingList(cri);
	}
	
	@Override
	public MeetingBoardVo[] selectSearchMeetingList(PageCriteria cri) throws Exception {
		if(cri.getPlaceKeyword() == "" || cri.getPlaceKeyword() ==  null)
			cri.setPlaceKeyword("null");
		if(cri.getPurposeKeyword() == "" || cri.getPurposeKeyword() == null)
			cri.setPurposeKeyword("null");
		if(cri.getDateKeyword() == "" || cri.getDateKeyword() == null)
			cri.setDateKeyword("null");
		if(cri.getTitleKeyword() == "" || cri.getTitleKeyword() == null)
			cri.setTitleKeyword("null");
		
		return mapper.selectSearchMeetingList(cri);
	}
	
	@Override
	public MeetingBoardVo selectOne(int MB_NO) throws Exception {
		 return mapper.selectOne(MB_NO);
	}
	
	@Override
	public void viewCountIncrease(int no) throws Exception {
		 mapper.viewCountIncrease(no);
	}
	
	@Override
	public void MeetingDelete(int no) throws Exception{
		mapper.MeetingDelete(no);
	}
	
	@Override
	public void MeetingDeleteImage(int no) throws Exception{
		mapper.MeetingDeleteImage(no);
	}
	
	@Override
	public String imagePath(int no) throws Exception{
		return mapper.imagePath(no);
	}

	@Override
	public MeetingBoardVo selectMeetingDetail(int MB_NO) throws Exception {
		return mapper.selectMeetingDetail(MB_NO);
	}
	
	@Override
	public List<MeetingBoardVo> selectSimilarMeeting(String MB_NO, String MB_PURPOSE) throws Exception {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("MB_NO", MB_NO);
		map.put("MB_PURPOSE", MB_PURPOSE);
		return mapper.selectSimilarMeeting(map);
	}
	
	@Override
	public void insertMeetingBoard(MeetingBoardVo meetingBoardVo) throws Exception {
		switch(meetingBoardVo.getMB_PURPOSE()){
			case "0001" : meetingBoardVo.setMB_PURPOSE("주류");
			break;
			case "0002" : meetingBoardVo.setMB_PURPOSE("스터디");
			break;
			case "0003" : meetingBoardVo.setMB_PURPOSE("운동");
			break;
			case "0004" : meetingBoardVo.setMB_PURPOSE("프로젝트");
			break;
			case "0005" : meetingBoardVo.setMB_PURPOSE("카페");
			break;
		}
		if(meetingBoardVo.getMB_LIMIT_GENDER() == ""  || meetingBoardVo.getMB_LIMIT_GENDER() == null)
			meetingBoardVo.setMB_LIMIT_GENDER("n");
		if(meetingBoardVo.getMB_LIMIT_OTHER() == "" || meetingBoardVo.getMB_LIMIT_OTHER() == null)
			meetingBoardVo.setMB_LIMIT_OTHER("미정");
		mapper.insertMeetingBoard(meetingBoardVo);
	}
	
	@Override
	public void modifyMeetingBoard(MeetingBoardVo meetingBoardVo) throws Exception {
		switch(meetingBoardVo.getMB_PURPOSE()){
			case "0001" : meetingBoardVo.setMB_PURPOSE("주류");
			break;
			case "0002" : meetingBoardVo.setMB_PURPOSE("스터디");
			break;
			case "0003" : meetingBoardVo.setMB_PURPOSE("운동");
			break;
			case "0004" : meetingBoardVo.setMB_PURPOSE("프로젝트");
			break;
			case "0005" : meetingBoardVo.setMB_PURPOSE("카페");
			break;
		}
		if(meetingBoardVo.getMB_LIMIT_GENDER() == ""  || meetingBoardVo.getMB_LIMIT_GENDER() == null)
			meetingBoardVo.setMB_LIMIT_GENDER("n");
		if(meetingBoardVo.getMB_LIMIT_OTHER() == "" || meetingBoardVo.getMB_LIMIT_OTHER() == null)
			meetingBoardVo.setMB_LIMIT_OTHER("미정");
		mapper.modifyMeetingBoard(meetingBoardVo);
	}
	
	//이미지 업로드 
	@Override
	public void fileInsert(FileVo file) throws Exception {
		mapper.fileInsert(file);
	}
	
	//이미지 url 조회
	public List<String> selectMeetingImageUrl(int MB_NO) throws Exception{
		return mapper.selectMeetingImageUrl(MB_NO);
	}
	
	//이미지 url 조회
	public List<ImageVo> selectImage(int MB_NO) throws Exception{
		return mapper.selectImage(MB_NO);
	}
	
	//댓글
	@Override
	   public List<MeetBoardReplyVo> replyList(int mb_no) {
	      return mapper.replyList(mb_no);
	   }

	   @Override
	   public int insertReply(MeetBoardReplyVo vo) {
	      return mapper.insertReply(vo);
	   }

	   @Override
	   public int replyDelete(int board_reply_no) {
	      return mapper.replyDelete(board_reply_no);
	   }

	   @Override
	   public int replyCount(int mb_no) {
	      return mapper.replyCount(mb_no);
	   }
	   
	   //Meeting 참석
	   public void MeetingAttend(String MB_NO, String name) throws Exception{
		   HashMap<String, String> map = new HashMap<String, String>();
		   map.put("MB_NO", MB_NO);
		   map.put("name", name);
		   mapper.MeetingAttend(map);
	   }
	   
	   //CURRENT_MEMBER 증가
	   public void CurrentCountInc(String MB_NO) throws Exception{
		     mapper.CurrentCountInc(MB_NO);
	   }
	   
	   //ATTEND LIST 
	   public List<AttendUserInfo> AttendMember(int MB_NO) throws Exception{
		   return mapper.AttendMember(MB_NO);
	   }
	   
	   //Meeting 참석 취소
	   public void MeetingAttendCancel(String MB_NO, String name) throws Exception{
		   HashMap<String, String> map = new HashMap<String, String>();
		   map.put("MB_NO", MB_NO);
		   map.put("name", name);
		   mapper.MeetingAttendCancel(map);
	   }
	   
	   //CURRENT_MEMBER 증가
	   public void CurrentCountDec(String MB_NO) throws Exception{
		     mapper.CurrentCountDec(MB_NO);
	   }
	   
	   @Override
	   public List<MeetingBoardVo> userSettingMeeter(String mb_writer) {
	      return mapper.userSettingMeeter(mb_writer);
	   }

	   @Override
	   public List<MeetingBoardVo> metterListAdmin() {
	      return mapper.metterListAdmin();
	   }
	   
	   // myBoardList
	   @Override
	   public List<MeetingBoardVo> myAttendList(String name){
		   return mapper.myAttendList(name);
	   }
	   
	   // 로그인 사용자 프로필 가져오기
	   @Override
	   public String LoginUserProfile(String name) {
		   return mapper.LoginUserProfile(name);
	   }
	   
	   //푸시 알림 관련 서비스-------------------------------------------------------------------------
	   //등록된 Meeting 조회
	   @Override
	   public List<Integer> SelectRegisterMeeting(){
	   		return mapper.SelectRegisterMeeting();
	   }
	   //마감 Meeting 등록
	   @Override
	   public void registerMeeting(int MB_NO) {
		   mapper.registerMeeting(MB_NO);
	   }
	   //푸시 카운트 +1
	   @Override
	   public void pushCountIcre(int MB_NO){
		    mapper.pushCountIcre(MB_NO);
	   }
	   //푸시 카운트 0인 Meeting에 참가한 사람의 토근 조회
	   @Override
	   public List<PushUsertokens> registerUserToken(int MB_NO){
	   return mapper.registerUserToken(MB_NO);
	   }
	   
	 //푸시에 보낸 가장 처음 사진
	 @Override
	 public String pushImage(int MB_NO) {
		 return mapper.pushImage(MB_NO);
	 }
	 
	//유저 제한 사항 조회
	 @Override
     public UserTeamVo userLimit(String name){
		 return mapper.userLimit(name);
	 }
	 
	//유저 제한 사항 조회
	@Override
	    public String masterToken(String name){
		return mapper.masterToken(name);
		 }
}
