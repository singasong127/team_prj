package com.team.app.infra.party;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PartyDao {
	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "Party";
	
	public int selectOneCount(PartyVo vo) { return sqlSession.selectOne(namespace + ".selectOneCount", vo); }
	public List<Party> selectList(PartyVo vo){ return sqlSession.selectList(namespace + ".selectList", vo); }
	
	public Party selectOne(PartyVo vo) {
		Party party = sqlSession.selectOne(namespace + ".selectOne", vo);
		
		return party;
	}
	
	public int update(Party dto) {
		
		return sqlSession.update(namespace + ".update", dto);
	}
	
	public int uelete(Party dto) {
		
		return sqlSession.update(namespace + ".uelete", dto);
	}
	
	
	public int insert(Party dto) {
		
		return sqlSession.insert(namespace + ".insert", dto);
	}
}
