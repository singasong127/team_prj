package com.team.app.infra.report;

import java.util.List;

public interface ReportService {
	
//	신고 조회 리스트 페이지
	public int selectOneCount(ReportVo vo);
	
//	신고 조회 리스트
	public List<Report> selectList(ReportVo vo);
	
//	신고 내용 열람
	public Report selectOne(ReportVo vo);
	
//	신고하겠습니다
	public int repot_insert(Report dto);
	
}
