package com.team.app.infra.code;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class CodeController {
    @Autowired
    CodeServiceImpl service;
    @RequestMapping("/cdlist")
    public String selectList(Model model){
        List<Code> list = service.selectList();
        model.addAttribute("list",list);

        return "admin/infra/code/cdlist";
    }
}
