package com.team.app.infra.party;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String partyInsert(Party dto, PartyVo vo, CurrentDt dt) {
		dto.setMadeTime(dt.getNowDt());
		dto.setPartyLeader(vo.getPartyLeader());
		
		System.out.println("partyLeader: " + dto.getPartyLeader());
		
		service.insert(dto);
		
		return "redirect:/";
	}
	
	
	@RequestMapping(value="/newChallger")
	public String newParty(Model model, @ModelAttribute PartyVo vo, CodeVo cdVo, HttpSession session,
			HttpServletRequest request, RedirectAttributes rttr) {
		
		vo.setPartyLeader( (String)session.getAttribute("sessionSeq") );
		vo.setPartyLocation( (String)model.getAttribute("location") );
		
		System.out.println("partyLeader: " + vo.getPartyLeader());
		System.out.println("partyLocation: " + vo.getPartyLocation());
		
		Party party = service.selectOne(vo);
		List<Code> code = cdService.selectCodeName(cdVo);
		model.addAttribute("code", code);
		model.addAttribute("party", party);
		
		return "usr/infra/member/newParty";
	}
	
	@ResponseBody
	@RequestMapping(value="/newChallger/post", method=RequestMethod.POST)
	public Map<String, Object> newPartyPost(Model model, @RequestBody Map<String, Object> location) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		Party pt = new Party();
		System.out.println("model: " + model.getAttribute("location"));
		
		if(pt != null) {
			
			model.addAttribute(model.getAttribute("location"));
			returnMap.put("rt", "success");
		} else {
			returnMap.put("rt", "fail");
		}
		
		return returnMap;
	}
	
	
}
