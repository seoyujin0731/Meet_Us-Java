package Meet_Us.userTeam.service;

import java.util.List;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Meet_Us.userTeam.dao.UserTeamMapper;
import Meet_Us.userTeam.vo.UImageVo;
import Meet_Us.userTeam.vo.UserTeamVo;
import com.sendgrid.*;
import java.io.IOException;

@Service
public class UserTeamServiceImp implements UserTeamService {
   
   @Autowired
   private JavaMailSender mailSender;

   @Autowired
   private UserTeamMapper mapper;

   // 아이디 중복 체크
   @Override
   public int userIdCheck(String user_id) {
      return mapper.userIdCheck(user_id);
   }
   
   @Override
   public int nameIsCheck(String user_name) {
      return mapper.nameIsCheck(user_name);
   }


   // 이메일 중복 체크
   @Override
   public int emailIsCheck(String user_email) {
      return mapper.emailIsCheck(user_email);
   }

   // 사용자 가입 트랜젝션 걸자 망필 온다-> 이거하고 CustomUserDetailsService 여기 고쳐랴 해요
   @Override
   @Transactional
   public int userInsert(UserTeamVo vo) throws Exception{
      if(vo.getUser_email()!=null) {
         Email from = new Email("coogys@naver.com");
          String subject = "meet_us 회원인증입니다.";
          Email to = new Email(vo.getUser_email());
          Content content = new Content("text/html",   new StringBuffer()
               .append("<div style=\"box-shadow: 0 8px 16px 0 #e2c0bb; transition: 0.3s; width: 40%; height:40%;text-align:center; margin:2rem;\" ")
                   .append("'>")
                   .append("<img src=\"https://meet-us.s3.ap-northeast-2.amazonaws.com/meet-background.jpg\" alt=\"Avatar\" style=\"width:50%; margin:2rem;\">")
                   .append("<div style=\"margin-bottom:3rem;\">")
                   .append("<h2 style=\"color: #e2c0bb; margin-top: 2rem;\">")
                   .append(" <b>Meet-Us</b>")
                   .append("</h2>")
                   .append("<p class=\"jg\">Meet-Us의 회원이 되신걸 축하합니다.</p>")
                   .append("<a href='http://meet-us.herokuapp.com/emailConfirm?user_email=")
                   .append(vo.getUser_email())
                   .append("&user_authority=")
                   .append(vo.getUser_authority())
                   .append("&key=99")
                   .append("' target='_blank'>이메일 인증 확인</a>")
                   .toString());
          Mail mail = new Mail(from, subject, to, content);
//          
           Request request = new Request();
           try {
             request.setMethod(Method.POST);
             request.setEndpoint("mail/send");
             request.setBody(mail.build());
             Response response = sg.api(request);
             mapper.userInsert(vo);
             mapper.insertAuthority(vo.getUser_id());
           } catch (IOException ex) {
             throw ex;
           }
            
         
           return 1;
      }
      return 0;
   }

   // 사용자 고유 번호 넣기
   @Override
   public int seqlIsCheck(int user_seq) {
      return mapper.seqlIsCheck(user_seq);
   }
   
   //사용자 최솟값 넣기
   @Override
   public int userIdMin() {
      return mapper.userIdMin();
   }

   @Override
   public int emailConfirm(UserTeamVo vo) {
      return mapper.emailConfirm(vo);
   }

   @Override
   public void updateEmailConfirm(String user_email) {
      mapper.updateEmailConfirm(user_email);
   }

   @Override
   public String SeachUserId(UserTeamVo vo) {
      return mapper.SeachUserId(vo);
   }

   @Override
   public int SeachUserPw(UserTeamVo vo) throws Exception {
     BCryptPasswordEncoder bcryptPasswordEncoder = new BCryptPasswordEncoder();
     String result = new TempKey().getKey(9, true);
      vo.setUser_password(bcryptPasswordEncoder.encode(result));
      if(mapper.SeachUserPw(vo) == 1) {
//         MailHandler sendMail = new MailHandler(mailSender);
//         sendMail.setSubject("[Meet_us 서비스 이메일 인증]");
//              sendMail.setText(
//                   new StringBuffer().append("<h1>메일인증</h1>")
//                                  .append("<a href='localhost:8087/")
//                                  .append("' target='_blank'>Login</a>")
//                                  .append("<h1>"+result+"</h1>").toString());
//           sendMail.setFrom("jodummy158@gmail.com", "Meet_us");
//           sendMail.setTo(vo.getUser_email());
//           sendMail.send();
         
         Email from = new Email("coogys@naver.com");
          String subject = "meet_us 찾기 시스템";
          Email to = new Email(vo.getUser_email());
          Content content = new Content("text/html",  new StringBuffer()
               .append("<div style=\"box-shadow: 0 8px 16px 0 #e2c0bb; transition: 0.3s; width: 40%; height:40%;text-align:center; margin:2rem;\" ")
                   .append("'>")
                   .append("<img src=\"https://meet-us.s3.ap-northeast-2.amazonaws.com/meet-background.jpg\" alt=\"Avatar\" style=\"width:50%; margin:2rem;\">")
                   .append("<div style=\"margin-bottom:3rem;\">")
                   .append("<h2 style=\"color: #e2c0bb; margin-top: 2rem;\">")
                   .append(" <b>Meet-Us</b>")
                   .append("</h2>")
                   .append("<p class=\"jg\">비밀번호 찾기</p>")
                                                          .append("<a href='https://meet-us.herokuapp.com/Login") //주소 수정
                                                          .append("' target='_blank'>Login</a>")
                                                          .append("<h1>"+result+"</h1>").toString());
          Mail mail = new Mail(from, subject, to, content);
    
           SendGrid sg = new SendGrid("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");
           Request request = new Request();
           try {
             request.setMethod(Method.POST);
             request.setEndpoint("mail/send");
             request.setBody(mail.build());
             Response response = sg.api(request);
           } catch (IOException ex) {
             throw ex;
           }
           System.out.println(vo.toString());
           mapper.UpdateUserPw(vo);
           
           
         
           return 1;  
      }else {
         return 0;
      }
   }

   @Override
   public UserTeamVo userSetting(String user_name) {
      return mapper.userSetting(user_name);
   }

   @Override
   public int userSettingUpdate(UserTeamVo vo) {
      return mapper.userSettingUpdate(vo);
   }

   @Override
   public String userPwCheck(String user_password) {
      return mapper.userPwCheck(user_password);
   }

   @Override
   public int userPwUpdate(UserTeamVo vo) {
      return mapper.userPwUpdate(vo);
   }

   @Override
   public List<UserTeamVo> userLsitAdmin() {
      return mapper.userLsitAdmin();
   }
   
   @Override
   public void profileDelete(String name) {
      mapper.profileDelete(name);
   }
   
   @Override
   public void profileInsert(UImageVo vo) {
	   mapper.profileInsert(vo);
   }
   
   @Override
   public String profilePath(String name) {
	   return mapper.profilePath(name);
   }
}