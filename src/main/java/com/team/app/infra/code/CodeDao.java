package com.team.app.infra.code;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CodeDao {
    @Autowired
    SqlSessionTemplate sqlSession;

    public List<Code> selectList() {
        return sqlSession.selectList("com.team.app.infra.code.CodeMapper");
    }
}
