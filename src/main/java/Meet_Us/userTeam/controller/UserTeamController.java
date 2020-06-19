package Meet_Us.userTeam.controller;

import java.io.File; 
import java.security.Principal;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import Meet_Us.Notification.service.NotificationService;
import Meet_Us.meeter.service.MeeterService;
import Meet_Us.userTeam.service.KakaoAPI;
import Meet_Us.userTeam.service.TempKey;
import Meet_Us.meeter.service.MAmazonS3ClientService;
import Meet_Us.userTeam.service.UserTeamService;
import Meet_Us.userTeam.vo.UImageVo;
import Meet_Us.userTeam.vo.UserTeamVo;

@Controller
@EnableAutoConfiguration
public class UserTeamController {
   @Autowired
   private UserTeamService service;
   
   @Autowired
   private MeeterService mService;

   @Autowired
   private KakaoAPI kakao;
   
   @Autowired
   private MAmazonS3ClientService amazonS3ClientService;
   
   @Autowired NotificationService notificationService;

   @RequestMapping(value = "/UserSetting", method = { RequestMethod.GET, RequestMethod.POST })
   public String UserSetting(Principal principal, Model model) throws Exception {
	   
	  
      model.addAttribute("name", principal.getName());
      model.addAttribute("myAttendList", mService.myAttendList(principal.getName()));
      model.addAttribute("user", service.userSetting(principal.getName()));
      model.addAttribute("team", mService.userSettingMeeter(principal.getName()));
      model.addAttribute("profilePath", service.profilePath(principal.getName()));
      model.addAttribute("pushUser", notificationService.SelectPushUserActice(principal.getName()));
      return "bootstrap.UserSetting";
   }

   @RequestMapping(value = "/UserSettingModify", method = { RequestMethod.GET, RequestMethod.POST })
   public String UserSettingModify(Principal principal, Model model,@RequestParam("code") String code) throws Exception {
      
      model.addAttribute("name", principal.getName());
      model.addAttribute("user", service.userSetting(principal.getName()));
      model.addAttribute("profilePath", service.profilePath(principal.getName()));
      
      
      if(code.equals("1")) {//값이 있을떄
         model.addAttribute("key",code);
         return "bootstrap.UserSettingModify";
      }else { //값이 없을때
         model.addAttribute("key",code);
         return "bootstrap.UserSettingModify";
      }
   }
   
   @RequestMapping(value = "/updateUser", method = { RequestMethod.GET, RequestMethod.POST })
   public String updateUser( Model model,UserTeamVo vo) throws Exception {
      if(vo.getUser_id()!=null) {
         service.userSettingUpdate(vo);
         return "redirect:UserSetting";
      }else 
         return "redirect:UserSetting";
   }
   
   @RequestMapping(value = "/userPwUpdate", method = RequestMethod.POST )
   public String userPwUpdate( Model model,UserTeamVo vo) throws Exception {
      BCryptPasswordEncoder pp = new BCryptPasswordEncoder();
      vo.setUser_password(pp.encode(vo.getUser_password()));
      try {
         service.userPwUpdate(vo);
      } catch (Exception e) {
      }
   
      return "redirect:UserSetting";
   }

   @RequestMapping(value = "/TeamManager", method = { RequestMethod.GET, RequestMethod.POST })
   public String TeamManager() throws Exception {
      return "bootstrap/TeamManager";
   }

   @RequestMapping(value = "/AdminManager", method = { RequestMethod.GET, RequestMethod.POST })
   public String AdminManager(Model model) throws Exception {
      model.addAttribute("user", service.userLsitAdmin());
      model.addAttribute("team", mService.metterListAdmin());
      return "bootstrap.AdminManager";
   }

   // 로그인 jsp
   @RequestMapping(value = "/Login", method = { RequestMethod.GET, RequestMethod.POST })
   public String Login() throws Exception {
      return "bootstrap.Login";
   }

   // default door 회원 가입
   @RequestMapping(value = "/signUp", method = { RequestMethod.GET, RequestMethod.POST })
   public String signUp(Model model) throws Exception {
      model.addAttribute("key", 1);
      return "bootstrap.UserInsert";
   }

   // 수정해야 해요
   // kakao api 로그인 정보 확인 ,HttpSession session
   @RequestMapping(value = "/kakaoLogin", method = { RequestMethod.GET, RequestMethod.POST })
   public String kakaoLogin(@RequestParam("code") String code, HttpSession session, Model model) throws Exception {

      String access_Token = kakao.getAccessToken(code);
      HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
      if (userInfo.get("user_email") != null) {
         session.setAttribute("userId", userInfo.get("user_email"));
         session.setAttribute("access_Token", access_Token);
      }

      // 이거 확인해줘요 이메일 정보가 있으면 뱉어줘 카카오만 빠짐
      if (service.seqlIsCheck(Integer.parseInt((String) userInfo.get("id"))) == 1) {
         model.addAttribute("key", 3);
         return "bootstrap.SuccessPage";
      } else {
         model.addAttribute("key", 2);
         model.addAttribute("user_seq", userInfo.get("id"));
         model.addAttribute("user_email", userInfo.get("user_email"));
         model.addAttribute("user_kakaoImg", userInfo.get("user_kakaoImg"));
         return "bootstrap.UserInsert";
      }
   }

   // id 중복 확인
   @RequestMapping(value = "/idIsCheck", method = RequestMethod.GET)
   @ResponseBody
   public int idIsCheck(UserTeamVo vo) {
      return service.userIdCheck(vo.getUser_id());
   }

   // 닉네임 중복 확인
   @RequestMapping(value = "/nameIsCheck", method = RequestMethod.GET)
   @ResponseBody
   public int nameIsCheck(UserTeamVo vo) {
      return service.nameIsCheck(vo.getUser_name());
   }

   // id 찾기
   @RequestMapping(value = "/SeachUserId", method = RequestMethod.GET)
   @ResponseBody
   public String SeachUserId(UserTeamVo vo) {
      return service.SeachUserId(vo);
   }

   // pw 찾기
   @RequestMapping(value = "/SeachUserPw", method = RequestMethod.GET)
   @ResponseBody
   public int SeachUserPw(UserTeamVo vo) throws Exception {
      return service.SeachUserPw(vo);
   }

   // 이메일 중복 체크
   @RequestMapping(value = "/emailIsCheck", method = RequestMethod.GET)
   @ResponseBody
   public int emailIsCheck(UserTeamVo vo) {
      return service.emailIsCheck(vo.getUser_email());
   }
   
   
   @RequestMapping(value = "/pwIsCheck", method = RequestMethod.GET)
   @ResponseBody
   public int pwIsCheck(UserTeamVo vo) {
      BCryptPasswordEncoder pp = new BCryptPasswordEncoder();
      //여기 작성
      if(pp.matches(vo.getUser_password(), service.userPwCheck(vo.getUser_name()))) {
         return 1;
      }else {
         return 0;
      }
      
   }

   // kakao login
   @RequestMapping(value = "/selectSocial")
   public String selectSocial() {
      return "bootstrap.selectSocial";
   }
   


   @RequestMapping(value = "/SuccessPage", method = { RequestMethod.GET, RequestMethod.POST })
   public String SuccessPage(UserTeamVo vo, @RequestParam("key") String key, Model model, BindingResult bindingResult,
         HttpServletRequest req) throws Exception {
      BCryptPasswordEncoder bcryptPasswordEncoder = new BCryptPasswordEncoder();
      try {

         vo.setUser_defaultAddress(
               vo.getUser_defaultAddress().substring(0, vo.getUser_defaultAddress().lastIndexOf("(") - 1));
      } catch (Exception e) {
         vo.setUser_defaultAddress(vo.getUser_defaultAddress());
      }
      // 일반
      if (Integer.parseInt(key) == 1) {
         // 1차 오류
         vo.setUser_seq(new TempKey().getKey(8, true) + service.userIdMin());
         vo.setUser_authority(new TempKey().getKey(20, true));
         vo.setUser_password(bcryptPasswordEncoder.encode(vo.getUser_password()));
         service.userInsert(vo);
         model.addAttribute("key", key);
         return "bootstrap.SuccessPage";
      }
      // 카카오
      else {
         vo.setUser_authority("Y");
         service.userInsert(vo);
         model.addAttribute("key", key);
         return "bootstrap.SuccessPage";
      }
   }

   @RequestMapping(value = "/emailConfirm", method = { RequestMethod.GET, RequestMethod.POST })
   public String emailConfirm(@RequestParam("key") String key, UserTeamVo vo, Model model) throws Exception {
      if (service.emailConfirm(vo) == 1) {
         model.addAttribute("key", key);
         model.addAttribute("user_email", vo.getUser_email());
         service.updateEmailConfirm(vo.getUser_email());
         return "bootstrap.SuccessPage";
      } else {
         model.addAttribute("key", 66);
         return "bootstrap.SuccessPage";
      }
   }

   @RequestMapping(value = "/IdSearch")
   public String EmailSearch(Model model) {
      model.addAttribute("check", "id");
      return "bootstrap.UserSearch";
   }

   @RequestMapping(value = "/PasswordSearch")
   public String PasswordSearch(Model model) {
      model.addAttribute("check", "password");
      return "bootstrap.UserSearch";
   }
   
//	@ResponseBody
//	@RequestMapping(value = "/PushNotice", method = RequestMethod.GET)
//	public void PushNotice(Model model, @RequestParam("subScription") HashMap subScription) throws Exception {
//	}
   
	@RequestMapping(value = "/MyPageImageSave", method = RequestMethod.GET)
	public String MyPageImageSave() throws Exception {
		return "bootstrap.MyPageImageSave";
	}
	
	@RequestMapping(value = "/MyPageImageSaveAction", method = RequestMethod.POST)
	public String MyPageImageSaveAction(Model model
									, UImageVo vo
									, MultipartHttpServletRequest request
									, Principal principal
									) throws Exception {
		
		service.profileDelete(principal.getName());
		String filecount = request.getParameter("image_count");
		
		MultipartFile[] files = new MultipartFile[Integer.parseInt(filecount)];
		for(int i=0; i<Integer.parseInt(filecount); i++) {
			String name = "image_" +i;
			files[i] = request.getFile(name);
		}
		for(int i=0; i < files.length; i++) {
		if(files[i].getOriginalFilename() != "") {
				
		this.amazonS3ClientService.uploadFileToS3Bucket(files[i], true);
			
		String fileName = files[i].getOriginalFilename();
		String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();
		File destinationFile;
		String destinationFileName;
		String fileRealUrl = "https://meet-us.s3.ap-northeast-2.amazonaws.com/MeetingImage/" + fileName;
		String fileUrl= fileRealUrl;
		
		do {
			destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension;
			destinationFile = new File(fileUrl + destinationFileName);
		} while (destinationFile.exists());

           vo.setUser_name(principal.getName());
           vo.setFile_Name(destinationFileName);
           vo.setFile_Real_Name(fileName);
           vo.setFile_Path(fileUrl);

           service.profileInsert(vo); //file insert
			}
		}
		
		return "bootstrap.MyPageImageSave";
	}

}