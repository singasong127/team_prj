package com.team.app.infra.code;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import javax.inject.Inject;
import java.util.List;

@Repository
public class CodeDao {
    @Inject
    @Resource(name = "sqlSession")
    SqlSessionTemplate sqlSession;

    public List<Code> selectList(CodeVo vo) {
        return sqlSession.selectList(  "Code.selectList",vo);
    }

    public int selectOneCount(CodeVo vo) {
        return sqlSession.selectOne("Code.selectOneCount",vo);
    }

    public Code selectOne(CodeVo vo) {
        return sqlSession.selectOne("Code.selectOne",vo);
    }

    public int update(Code dto) {
        return sqlSession.update("Code.update",dto);
    }

    public int insert(Code dto) {
        return sqlSession.insert("Code.insert",dto);
    }

    public int uelete(CodeVo vo) {
        return sqlSession.update("Code.uelete",vo);
    }
    
<<<<<<< HEAD
    public List<Code> selectOpt() {
		return sqlSession.selectList("Code.selectOpt");
	}
=======
>>>>>>> branch 'main' of https://github.com/singasong127/team_prj.git
}
