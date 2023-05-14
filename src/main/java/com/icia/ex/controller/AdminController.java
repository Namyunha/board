package com.icia.ex.controller;

import com.icia.ex.dto.MemberDTO;
import com.icia.ex.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    MemberService memberService;
    @GetMapping
    public String adminHome(){
    return "/adminPages/admin";
    }
    @GetMapping("/list")
    public ResponseEntity customerList(){
    List<MemberDTO>customerList = memberService.findAll();
    return new ResponseEntity<>(customerList, HttpStatus.OK);
    }
}
