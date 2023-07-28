package com.team.app.infra.codegroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class CodeGroupController {

	@Autowired
	CodeGroupServiceImpl service;
	
	  @RequestMapping(value="/cglist") 
	  public String codeGroupList(@ModelAttribute("vo") CodeGroupVo vo, Model model) {
	  
	  vo.setCgName(vo.getCgName() == null ? "" : vo.getCgName());
	  
	  vo.setParamsPaging(service.selectOneCount(vo));
	  
	  if(vo.getTotalRows() > 0) {
		  List<CodeGroup> list = service.selectList(vo);
		  model.addAttribute("list", list); 
		  // model.addAttribute("vo", vo); } 
	  } else {
		  // by pass 
	  }
	  
	  	return "admin/infra/codeGroup/codeGroupList";
	  }
	 
	
	@RequestMapping(value="/cgform") 
	public String codeGroupForm(CodeGroupVo vo, Model model) { 
		CodeGroup codeGroup = service.selectOne(vo);
	  
		model.addAttribute("item", codeGroup);
	  
		return "admin/infra/codeGroup/codeGroupForm"; 
	}
	 
	
	@RequestMapping(value="/cgupdate")
	public String codeGroupUpdate(CodeGroup dto) {
		
		System.out.println("codeGroupUpdate");
		
		service.update(dto);
		
		return "redirect:/cglist";
	}
	
	@RequestMapping(value="/cguelete")
	public String codeGroupUelete(CodeGroup dto) {
		
		System.out.println("Uelete");
		
		service.uelete(dto);
		
		return "redirect:/cglist";
	}
	
	@RequestMapping(value="/cgdelete")
	public String codeGroupDelete(CodeGroup dto) {
		
		System.out.println("Deleted");
		
		service.delete(dto);
		
		return "redirect:/cglist";
	}
	
	@RequestMapping(value="/cginsert")
	public String codeGroupInsert(CodeGroup dto) {
		
		System.out.println("Inserted");
		
		service.insert(dto);
		
		return "redirect:/cglist";
	}
}
