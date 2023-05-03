package com.icia.ex.controller;

import com.icia.ex.dto.MemberDTO;
import com.icia.ex.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class MemberController {
    @Autowired
    MemberService memberService;

    @GetMapping("/join")
    public String join() {
        return "join";
    }

    @PostMapping("/join")
    public String joinParam(@ModelAttribute MemberDTO memberDTO, Model model) {
        System.out.println(memberDTO);
        int saveDTO = memberService.save(memberDTO);
        model.addAttribute("result", saveDTO);
        if (saveDTO > 0) {
            model.addAttribute("dto", memberDTO);
            return "index";
        } else {
            return "join";
        }
    }

    @PostMapping("/search")
    public ResponseEntity searchId(@RequestParam("checkId") String checkId) {
        System.out.println("memberId: " + checkId);
        MemberDTO dto = memberService.findById(checkId);
        if (dto == null) {
            return new ResponseEntity<>(HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.CONFLICT);
        }
    }
    @GetMapping("/list")
    public String memberDTOList(Model model) {
        List<MemberDTO> memberDTOList = memberService.findAll();
        model.addAttribute("memberList", memberDTOList);
        return "members";
    }
    @GetMapping("/memberDetail")
    public String viewUser(@RequestParam("id") Long id, Model model) {
        System.out.println("id: " + id);
        MemberDTO memberDTO = memberService.findByUser(id);
        model.addAttribute("memberDTO", memberDTO);
        System.out.println("memberDTO" + memberDTO);
        return "memberDetail";
    }
    @PostMapping("/detail-ajax")
    public ResponseEntity detailUser(@RequestParam("id") Long id) {
        MemberDTO memberDTO = memberService.findByUser(id);
        if (memberDTO == null) {
            return new ResponseEntity<>(memberDTO, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.CONFLICT);
        }
    }
}

// 수정요청은 memberMain.jsp에서 시작
// 컨트롤러에서 세션값 가져올 때: session.getAttribute("loginEmail)
// 수정페이지(memberUpdate.jsp) 에서 이름, 전화번호만 수정
// 그리고 비밀번호 입력칸은 비워두고 사용자 입력을 받아서
// 기존 비밀번호와 일치하면 수정처리, 일치하지 않으면 alert으로 비밀번호 불일치 출력