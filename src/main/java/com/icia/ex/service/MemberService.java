package com.icia.ex.service;

import com.icia.ex.dto.MemberDTO;
import com.icia.ex.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberService {
    @Autowired
    MemberRepository memberRepository;
    public int save(MemberDTO memberDTO) {
        return memberRepository.save(memberDTO);
    }

    public boolean login(MemberDTO memberDTO) {
        MemberDTO resultDTO = memberRepository.login(memberDTO);
        if(resultDTO == null){
            return false;
        } else {
            return true;
        }
    }

    public List<MemberDTO> findAll() {
       return memberRepository.findAll();
    }

    public MemberDTO findById(String memberEmail) {
        return memberRepository.findById(memberEmail);
    }

    public MemberDTO findByUser(Long id) {
        return memberRepository.findByUser(id);
    }
}
