package Meet_Us.main.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import Meet_Us.main.vo.MainVo;

@Repository
public interface MainMapper {
	
	public List<MainVo> selectMainList() throws Exception;

}
