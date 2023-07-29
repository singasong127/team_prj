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
        return sqlSession.selectOne("Code.SelectOneCount",vo);
    }
}
