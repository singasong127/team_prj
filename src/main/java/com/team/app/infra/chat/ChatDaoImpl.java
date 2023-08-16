package com.team.app.infra.chat;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class ChatDaoImpl implements ChatDao {
    @Autowired
    SqlSession sqlSession;

    String namespace = "ChatMapper";
    @Override
    public List<ChatVo> list() {
        return sqlSession.selectList(namespace +".list");
    }

    @Override
    public void insert(ChatVo vo) {
        sqlSession.insert(namespace +".insert",vo);
    }

    @Override
    public void delete(int id) {
        sqlSession.delete(namespace + ".delete",id);
    }

    @Override
    public int last() {
        return sqlSession.selectOne(namespace + ".last");
    }
}
