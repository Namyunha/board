package com.icia.ex.controller;

import com.icia.ex.dto.MemberDTO;
import com.icia.ex.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

@Controller
public class HomeController {
    @Autowired
    MemberService memberService;
    @GetMapping("/")
    public String index() {
        return "index";
    }
    @GetMapping("index2")
    public String index2() {
        return "index2";
    }
    @PostMapping("/")
    public String indexParam(@ModelAttribute MemberDTO memberDTO, HttpSession session) {
        boolean loginResult = memberService.login(memberDTO);
        if (loginResult) {
            session.setAttribute("dto", memberDTO);
            return "memberPage";
        } else {
            return "index";
        }
    }
}
