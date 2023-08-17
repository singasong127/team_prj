package com.team.app.infra.party;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.app.infra.code.Code;
import com.team.app.infra.code.CodeServiceImpl;
import com.team.app.infra.code.CodeVo;


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
	  
	  System.out.println(vo.getPartyLocation());
	  
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
	public String partyInsert(Party dto) {
		
		System.out.println("Inserted");
		
		service.insert(dto);
		
		return "redirect:/ptlist";
	}
	
	@RequestMapping(value="/newChallger")
	public String newParty(Model model, CodeVo cdVo, PartyVo vo) {
		
		service.selectList(vo);
//    	service.selectOne(vo);
    	
    	List<Party> list = service.selectList(vo);
    	List<Code> cdList = cdService.selectCodeName(cdVo);
    	model.addAttribute("list", list);
    	model.addAttribute("code", cdList);
    	
    	System.out.println(vo.getPartyGen());
    	
//    	Party item = service.selectOne(vo);
//    	model.addAttribute("item", item);
		
		
		return "usr/infra/member/newParty";
	}
	
	
}
