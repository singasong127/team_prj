package com.team.app.infra.index;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
    	
    	List<Party> list = service.selectList(vo);
    	List<Code> cdList = cdService.selectCodeName(cdVo);
    	model.addAttribute("list", list);
    	model.addAttribute("code", cdList);
    	
//    	Party item = service.selectOne(vo);
//    	model.addAttribute("item", item);
    	
        return "usr/infra/index/index";
    }
    
    @GetMapping("/findmap")
    public String findMap() {
    	return "usr/infra/include/map";
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
