package com.team.app.infra.codegroup;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class CodeGroupDao {
	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;

	
	public int selectOneCount(CodeGroupVo vo) { return sqlSession.selectOne( "CodeGroup.selectOneCount", vo); }
	public List<CodeGroup> selectList(CodeGroupVo vo){ return sqlSession.selectList( "CodeGroup.selectList", vo); }
	
	public CodeGroup selectOne(CodeGroupVo vo) {
		CodeGroup codeGroup = sqlSession.selectOne( "CodeGroup.selectOne", vo);
		
		return codeGroup;
	}
	
	public int update(CodeGroup dto) {
		
		return sqlSession.update( "CodeGroup.update", dto);
	}
	
	public int uelete(CodeGroup dto) {
		
		return sqlSession.update( "CodeGroup.uelete", dto);
	}
	
	public int delete(CodeGroup dto) {
		
		return sqlSession.delete( "CodeGroup.delete", dto);
	}
	
	public int insert(CodeGroup dto) {
		
		return sqlSession.insert( "CodeGroup.insert", dto);
	}

	/**
	 * @return: codeForm을 위한 리스트 뿌려줌
	 */
	public List<CodeGroup> selectOpt() {
		return sqlSession.selectList("CodeGroup.selectOpt");
	}
}
