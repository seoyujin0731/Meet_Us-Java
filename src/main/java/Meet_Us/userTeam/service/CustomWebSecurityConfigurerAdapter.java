package Meet_Us.userTeam.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;


@EnableWebSecurity
public class CustomWebSecurityConfigurerAdapter extends WebSecurityConfigurerAdapter {

   
   @Autowired
   CustomUserDetailsService customUserDetailsService;

   @Bean
   public PasswordEncoder passwordEncoder() {
      return new BCryptPasswordEncoder();
   }

   @Bean
   public AuthenticationSuccessHandler successHandler() {
      return new CustomLoginSuccessHandler("/");
   }
   
   @Override
    public void configure(WebSecurity web) throws Exception {
        // 허용되어야 할 경로들
        web.ignoring().antMatchers("/resources/**"
//                                   "/MeeterDetail",
//                                   "/NoticeDetail",
                                   ,"/emailConfirm"
//                                   "/IdSearch",
                                   ,"/SuccessPage",
                                      "/nameIsCheck",
                                    "/SeachUserId",
                                    "/SeachUserPw",
                                    "/emailIsCheck",
                                    "/idIsCheck",
                                    "/insertReply",
                                    "/replyDelete"
                                   ); 
    }
   
   
   @Override
    protected void configure(HttpSecurity http) throws Exception {
       http.authorizeRequests()
         // ROLE_USER, ROLE_ADMIN으로 권한 분리 유알엘 정의 여기 밑에 넣으면 nav가 활성화가 된다. 위에는 그냥 참고만 하자 
            .antMatchers("/"
                  , 
                  "/Login",
                  "/error**",
                  "/IdSearch",
                  "/PasswordSearch",
                  "/signUp",
                  "/selectSocial",
                  "/Notice",
                  "/Developers",
                  "/Map",
                  "/emailConfirm",
                  "/NoticeDetail"
                  )
            .permitAll()
            .antMatchers("/AdminManager","/NoticeInsert","/NoticeModify","/NoticeDelete").access("hasRole('ROLE_ADMIN')") //hasRole 이걸 붙이고 괄호 해주고 , ROLE_ <-이거 안붙ㅊ이면 오류가 발생한다. 이걸 몇일이나 고민하냐 '안에는 이걸 붙여주세요
//            .antMatchers("/Map").hasRole("ADMIN")
            .anyRequest().authenticated() //나머지 요청에 대해서는 인증된  사용자만 접근이 되도록 설정하고 있다.
//            .antMatchers("/**").authenticated()
         .and()
             .formLogin()
             .loginProcessingUrl("/login")
             .loginPage("/Login")
             .usernameParameter("user_id")
             .passwordParameter("user_password")
             .successHandler(successHandler())
             .permitAll()
         .and()
            .logout()
            .logoutSuccessUrl("https://meet-us.herokuapp.com/")
            .invalidateHttpSession(true)
       .and()
           .csrf();
//      에러 문제점 forbidden 403
       http.cors().and();
       http.csrf().disable();
       http.headers().frameOptions().disable();
    }
   
   @Override
   protected void configure(AuthenticationManagerBuilder auth) throws Exception {
      auth.userDetailsService(customUserDetailsService).passwordEncoder(passwordEncoder());
   }
   
}