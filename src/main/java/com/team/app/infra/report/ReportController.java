package com.team.app.infra.report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.app.infra.code.CodeServiceImpl;

@Controller
public class ReportController {

		@Autowired
		ReportServiceImpl service;
		@Autowired
		CodeServiceImpl codeService;
		
//		관리자 신고 내역 목록 관리
		@RequestMapping(value="/reportList")
		public String repotList(@ModelAttribute("vo") ReportVo vo, Model model ) {
			
			vo.setReason(vo.getReason() == null ? "" : vo.getReason());
			
			vo.setParamsPaging(service.selectOneCount(vo));
			
			if(vo.getTotalRows() > 0) {
				List<Report> list = service.selectList(vo);
				model.addAttribute("list", list);
			}else {
				
			}
			
			return "admin/infra/report/reportList";
		}
		
//		관리자 신고 내역 상세보기
		@RequestMapping(value="/reportView")
		public String reportView(ReportVo vo, Model model) {
			Report report = service.selectOne(vo);
			
			model.addAttribute("item", report);
			return "admin/infra/report/reportForm";
		}
		
//		사용자 신고서 작성페이지
		@RequestMapping(value="/repotPage")
		public String reportPage(Report dto) {
			dto.setActor(dto.getActor());
			dto.setActee(dto.getActee());
			
			
			return "usr/infra/member/reportForm";
		}
		
//		사용자 신고하기
		@RequestMapping(value="/reportYou")
		public String reportYou(Report dto, ReportVo vo, CurrentDt dt) {
			dto.setActor(vo.getActor());
			dto.setActee(vo.getActee());
			
			dto.setDatetime(dt.getNowDt());
			
			service.repot_insert(dto);
			
			return "";
		}
}
