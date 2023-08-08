package com.team.app.infra.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {

    @GetMapping("/")
    public String index() {
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






}
