package com.team.app.infra.report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	ReportDao dao;
	
	@Override
	public int selectOneCount(ReportVo vo) {
		return dao.selectOneCount(vo);
	}

	@Override
	public List<Report> selectList(ReportVo vo) {
		List<Report> reportList = dao.selectList(vo);
		
		return reportList;
	}

	@Override
	public Report selectOne(ReportVo vo) {
		return dao.selectOne(vo);
	}

	@Override
	public int repot_insert(Report dto) {
		return dao.repot_insert(dto);
	}

}
