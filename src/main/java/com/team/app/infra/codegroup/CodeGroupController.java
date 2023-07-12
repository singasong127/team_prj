package com.team.app.infra.codegroup;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CodeGroupController {

@RequestMapping("/")
    public String index(){
    return "index";
}
}
