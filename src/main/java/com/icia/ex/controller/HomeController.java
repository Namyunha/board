package com.icia.ex.controller;

import com.icia.ex.dto.MemberDTO;
import com.icia.ex.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

    @PostMapping("/")
    public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session) {
        System.out.println(memberDTO);
        boolean dto = memberService.login(memberDTO);
        if (dto) {
            session.setAttribute("loginDTO", memberDTO.getMemberId());
            System.out.println(session.getAttribute("loginDTO"));
            return "index";
        } else {
            return "index";
        }
    }

}
