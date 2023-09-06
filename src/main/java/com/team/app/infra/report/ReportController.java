package com.team.app.infra.report;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.app.infra.code.Code;
import com.team.app.infra.code.CodeServiceImpl;
import com.team.app.infra.code.CodeVo;
import com.team.app.infra.index.CurrentDt;
import com.team.app.infra.member.Member;
import com.team.app.infra.member.MemberServiceImpl;
import com.team.app.infra.member.MemberVo;

@Controller
public class ReportController {

		@Autowired
		ReportServiceImpl service;
		@Autowired
		CodeServiceImpl codeService;
		@Autowired
		MemberServiceImpl memService;
		
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
		public String reportView( ReportVo vo, Model model) {
			Report report = service.selectOne(vo);
			
			model.addAttribute("item", report);
			
			return "admin/infra/report/reportForm";
		}
		
		
//		사용자 신고하기
		@RequestMapping(value="/reportYou")
		public String reportYou(Report dto, Member memdto, ReportVo vo, MemberVo mevo, CurrentDt dt, Model model, CodeVo cdvo) {
			dto.setType(vo.getType());
			dto.setDatetime(dt.getNowDt());
			dto.setActee(vo.getActee());
			System.out.println("신고 대상 : " + vo.getActee());
			dto.setActor(vo.getActor());
			System.out.println("신고자 : " + vo.getActor());
			
			List<Code> code = codeService.selectCodeName(cdvo); 
			
			
			model.addAttribute("code", code);
			
			
			service.repot_insert(dto);
			
			return "redirect:/ptform";
		}
}
