package com.team.app.infra.index;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.app.infra.code.Code;
import com.team.app.infra.code.CodeServiceImpl;
import com.team.app.infra.code.CodeVo;
import com.team.app.infra.party.Party;
import com.team.app.infra.party.PartyServiceImpl;
import com.team.app.infra.party.PartyVo;

@Controller
public class IndexController {
	
	@Autowired
	PartyServiceImpl service;
	@Autowired
	CodeServiceImpl cdService;
	
    @RequestMapping(value="/")
    public String index(Model model, PartyVo vo, CodeVo cdVo) {
    	
    	service.selectList(vo);
//    	service.selectOne(vo);
    	System.out.println("voPartySport" + vo.getPartySport());
    	System.out.println("voPartyName"+ vo.getPartyName());
    	System.out.println(vo.getPlayDt());
    	
    	List<Party> list = service.selectList(vo);
    	List<Code> cdList = cdService.selectCodeName(cdVo);
    	model.addAttribute("list", list);
    	model.addAttribute("code", cdList);
    	
    	System.out.println(vo.getPartyGen());
    	
//    	Party item = service.selectOne(vo);
//    	model.addAttribute("item", item);
    	
        return "usr/infra/index/index";
    }
    
    @RequestMapping(value="/findmap")
    public String findMap(Model model, PartyVo vo) {
    	
    	return "usr/infra/include/map";
    }
    
    @RequestMapping(value="/findmap/submit", method=RequestMethod.POST)
    public String submitFindMap(@RequestBody Map<String, Object> location, HttpServletRequest request) throws Exception {
    	
    	String lo = (String)location.get("location");
    	
    	request.setAttribute("location", lo);
    	
    	System.out.println("Location: " + (String)request.getAttribute("location"));
    	
    	
    	return "forward:/newChallger";
    }
    

    @RequestMapping(value = "/chat", method = RequestMethod.GET)
    public String chat() {
        return "chat";
    }


    @GetMapping("/three")
    public String indexy(){
        return "index";
    }



}
