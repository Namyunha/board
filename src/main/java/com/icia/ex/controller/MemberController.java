package com.icia.ex.controller;

import com.icia.ex.dto.MemberDTO;
import com.icia.ex.dto.MemberFileDTO;
import com.icia.ex.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/member")
public class MemberController {
    @Autowired
    MemberService memberService;
    @GetMapping("/join")
    public String join() {
        return "memberPages/memberSave";
    }
    @PostMapping("/join")
    public String joinParam(@ModelAttribute MemberDTO memberDTO, Model model) throws IOException {
        System.out.println(memberDTO);
        memberService.save(memberDTO);
        return "index";
    }
    @PostMapping("/checkId")
    public ResponseEntity searchId(@RequestParam("checkId") String checkId) {
        System.out.println("memberId: " + checkId);
        MemberDTO dto = memberService.duCheck(checkId);
        if (dto == null) {
            return new ResponseEntity<>(HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.CONFLICT);
        }
    }
    @PostMapping("/checkEmail")
    public ResponseEntity searchEmail(@RequestParam("memberEmail") String memberEmail) {
        System.out.println("memberEmail: " + memberEmail);
        MemberDTO dto = memberService.findDTO(memberEmail);
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
        return "memberPages/members";
    }
    @GetMapping("/detail")
    public String viewUser(@RequestParam("id") Long id, Model model) {
        System.out.println("id: " + id);
        MemberDTO memberDTO = memberService.findByUser(id);
        model.addAttribute("memberDTO", memberDTO);
        if (memberDTO.getFileAttached() == 1) {
            List<MemberFileDTO> memberFileDTO = memberService.findFile(id);
            model.addAttribute("memberFileList", memberFileDTO);
            System.out.println("memberFileDTO = " + memberFileDTO);
        }
        System.out.println("memberDTO" + memberDTO);
        return "/memberPages/memberDetail";
    }
    @GetMapping("/mypage")
    public String detail(@RequestParam("memberId") String memberId, Model model){
        System.out.println(memberId);
        MemberDTO dto = memberService.findById(memberId);
        System.out.println("dto= "+dto);
        model.addAttribute("memberDTO", dto);
        if (dto.getFileAttached() == 1) {
            List<MemberFileDTO> memberFileDTO = memberService.findFile(dto.getId());
            model.addAttribute("memberFileList", memberFileDTO);
            System.out.println("memberFileDTO = " + memberFileDTO);
        }
        return "/memberPages/memberDetail";
    }
    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "index";
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
    @GetMapping("/update")
    public String update(@RequestParam("id") Long id, Model model){
        MemberDTO memberDTO = memberService.findByUser(id);
        model.addAttribute("memberDTO", memberDTO);
        if (memberDTO.getFileAttached() == 1) {
            List<MemberFileDTO> memberFileDTO = memberService.findFile(memberDTO.getId());
            model.addAttribute("memberFileList", memberFileDTO);
            System.out.println("memberFileDTO = " + memberFileDTO);
        }
        System.out.println(memberDTO);
        return "/memberPages/memberUpdate";
    }
    @GetMapping("/delete")
    public String delete(){
        return "/memberPages/memberDelete";
    }
}