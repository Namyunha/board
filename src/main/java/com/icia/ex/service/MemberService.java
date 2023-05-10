package com.icia.ex.service;

import com.icia.ex.dto.MemberDTO;
import com.icia.ex.dto.MemberFileDTO;
import com.icia.ex.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
public class MemberService {
    @Autowired
    MemberRepository memberRepository;
//    public int save(MemberDTO memberDTO) {
//        return memberRepository.save(memberDTO);
//    }

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

    public MemberDTO findById(String memberId) {
        return memberRepository.findById(memberId);
    }

    public MemberDTO findByUser(Long id) {
        return memberRepository.findByUser(id);
    }

    public void save(MemberDTO memberDTO) throws IOException {
        // 파일 있음, 없음.
        if (memberDTO.getMemberProfile().get(0).isEmpty()) {
            // 파일 없음.
            System.out.println("파일없음");
            memberDTO.setFileAttached(0);
            memberRepository.save(memberDTO);
        } else {
            // 파일 있음.
            /*
                1. 파일첨부 여부 값 1로 세팅하고 DB에 제목 등 내용 board_table에 저장 처리
                2. 파일의 이름을 가져오고 DTO 필드값에 세팅
                3. 저장용 파일 이름 만들고 DTO 필드값에 세팅
                4. 로컬에 파일 저장
                5. board_file_table에 저장 처리
             */
            System.out.println("파일있음");
            memberDTO.setFileAttached(1);
            MemberDTO dto = memberRepository.save(memberDTO);
            for (MultipartFile memberFile: memberDTO.getMemberProfile()) {
                // 원본 파일 이름 가져오기
                String originalFilename = memberFile.getOriginalFilename();
                System.out.println("originalFilename = " + originalFilename);
                // 저장용 이름 만들기
                System.out.println(System.currentTimeMillis());
                System.out.println(UUID.randomUUID().toString());
                String storedFileName = System.currentTimeMillis() + "-" + originalFilename;
                System.out.println("storedFileName = " + storedFileName);
                // 저장을 위한 FileDTO 세팅
                MemberFileDTO memberFileDTO = new MemberFileDTO();
                memberFileDTO.setOriginalFileName(originalFilename);
                memberFileDTO.setStoredFileName(storedFileName);
                memberFileDTO.setMemberId(memberDTO.getId());
                System.out.println("확인용"+dto);
                // 로컬에 파일 저장
                // 저장할 경로 설정 (저장할폴더+저장할이름)
                String savePath = "D:\\springframework_img\\" + storedFileName;
                // 저장처리
                memberFile.transferTo(new File(savePath));
                memberRepository.saveFile(memberFileDTO);
            }
        }
    }
    public List<MemberFileDTO> findFile(Long id) {
        return memberRepository.findFile(id);
    }
    public MemberDTO duCheck(String checkId) {
        return memberRepository.duCheck(checkId);
    }
    public MemberDTO findDTO(String memberEmail) {
        return memberRepository.findDTO(memberEmail);
    }
    public MemberDTO login2(MemberDTO memberDTO) {
        return memberRepository.login2(memberDTO);
    }

}
