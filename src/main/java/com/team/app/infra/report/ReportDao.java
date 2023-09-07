package com.team.app.infra.report;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ReportDao {
	@Inject
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.team.app.infra.report.ReportMapper";
	
	public List<Report> selectList(ReportVo vo){
		return sqlSession.selectList(namespace + ".selectList", vo);
	}
	
	public Report selectOne(ReportVo vo) {
		return sqlSession.selectOne(namespace + ".selectOne", vo);
	}
	
	
	public int selectOneCount(ReportVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneCount", vo);
	}
	
	public int repot_insert(Report dto) {
		return sqlSession.insert(namespace + ".repot_insert", dto);
	}
}
