package com.team.app.infra.party;

import java.util.List;

<<<<<<< HEAD
=======
import javax.servlet.http.HttpServletRequest;
>>>>>>> branch 'main' of https://github.com/singasong127/team_prj.git
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.app.infra.code.Code;
import com.team.app.infra.code.CodeServiceImpl;
import com.team.app.infra.code.CodeVo;
import com.team.app.infra.index.CurrentDt;


@Controller
public class PartyController {
	@Autowired
	PartyServiceImpl service;
	@Autowired
	CodeServiceImpl cdService;
	
	  @RequestMapping(value="/ptlist") 
	  public String partyList(@ModelAttribute("vo") PartyVo vo, Model model, CodeVo cdVo) {
	  
	  vo.setPartyName(vo.getPartyName() == null ? "" : vo.getPartyName());
	  
	  vo.setParamsPaging(service.selectOneCount(vo));
	  

	  if(vo.getTotalRows() > 0) {
		  List<Party> list = service.selectList(vo);
		  model.addAttribute("list", list); 
		  // model.addAttribute("vo", vo); } 
		  
	  } else {
		  // by pass 
	  }
	  	
	  	return "admin/infra/party/partyList";
	  }
	 
	
	@RequestMapping(value="/ptform") 
	public String partyForm(PartyVo vo, Model model) { 
		Party party = service.selectOne(vo);
	  
		model.addAttribute("item", party);
	  
		return "usr/infra/member/partyStatus"; 
	}
	 
	
	@RequestMapping(value="/ptupdate")
	public String partyUpdate(Party dto) {
		
		System.out.println("Update");
		
		service.update(dto);
		
		return "redirect:/ptlist";
	}
	
	@RequestMapping(value="/ptuelete")
	public String partyUelete(Party dto) {
		
		System.out.println("Uelete");
		
		service.uelete(dto);
		
		return "redirect:/ptlist";
	}
	
	
	@RequestMapping(value="/ptinsert")
<<<<<<< HEAD
	public String partyInsert(Party dto, PartyVo vo, CurrentDt dt ) {
=======
	public String partyInsert(Party dto, PartyVo vo, CurrentDt dt) {
>>>>>>> branch 'main' of https://github.com/singasong127/team_prj.git
		dto.setMadeTime(dt.getNowDt());
		dto.setPartyLeader(vo.getPartyLeader());
<<<<<<< HEAD
=======
		
		System.out.println("partyLeader: " + dto.getPartyLeader());
>>>>>>> branch 'main' of https://github.com/singasong127/team_prj.git
		
		service.insert(dto);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/newChallger")
<<<<<<< HEAD
	public String newParty(Model model, CodeVo cdVo, PartyVo vo, HttpSession session) {
		
		vo.setPartyLeader((String)session.getAttribute("sessionSeq"));
    	
		Party party = service.selectOne(vo);
		model.addAttribute("party", party);
		
    	List<Code> cdList = cdService.selectCodeName(cdVo);
    	model.addAttribute("code", cdList);
=======
	public String newParty(Model model, PartyVo vo, HttpSession session) {
		vo.setPartyLeader( (String)session.getAttribute("sessionSeq") );
		
		System.out.println("partyLeader: " + vo.getPartyLeader());
		
		Party party = service.selectOne(vo);
		model.addAttribute("party", party);
>>>>>>> branch 'main' of https://github.com/singasong127/team_prj.git
		
		return "usr/infra/member/newParty";
	}
	
	
}
