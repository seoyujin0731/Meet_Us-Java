package Meet_Us;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

@SpringBootApplication
//@SpringBootApplication의 의미는
//@SpringBootApplication = @Configuration + @EnableAutoConfiguration + @ComponentScan
//이런 의미 입니다.
//@Configuration : 현재 클래스가 Spring의 설정 파일임을 알려주는 어노테이션
//@EnableAutoConfiguration : Spring boot 클래스패스 세팅 및 다양한 Bean 추가 등을 시켜주는 어노테이션
//@ComponetScan : 다른 컴포넌트, 서비스, 설정 등을 찾을 수 있게 도와주는 어노테이션
@MapperScan(value={"Meet_Us.main.dao", "Meet_Us.board.dao","Meet_Us.userTeam.dao", "Meet_Us.meeter.dao", "Meet_Us.Notification.dao"})

public class Index extends SpringBootServletInitializer{
	
  @Override
  protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
      return application.sources(Index.class);
  }
  
  public static void main(String[] args) {
        SpringApplication.run(Index.class, args);
    }
	
  @Bean
  public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception{
      SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
      sessionFactory.setDataSource(dataSource);
      
      Resource[] res = new PathMatchingResourcePatternResolver().getResources("classpath:mapper/*Mapper.xml");
      sessionFactory.setMapperLocations(res);
      
      return sessionFactory.getObject();
  }
  
	@Bean
	public TilesConfigurer tilesConfigurer(){
		final TilesConfigurer configurer = new TilesConfigurer();
		configurer.setDefinitions(new String[] {"/WEB-INF/views/template/tiles-layout.xml"});
		configurer.setCheckRefresh(true);
		return configurer;
	}
	
	@Bean
	public UrlBasedViewResolver tilesViewResolver(){
		UrlBasedViewResolver resolver = new UrlBasedViewResolver();
		resolver.setViewClass(TilesView.class);
		return resolver;
	}
}

