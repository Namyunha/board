package com.icia.ex.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Getter
@Setter
@ToString

public class MemberDTO {
    private Long id;
    private String memberId;
    private String memberPassword;
    private String memberName;
    private String memberBirth;
    private String gender;
    private String memberEmail;
    private String memberMobile;
    private int fileAttached;
    private List<MultipartFile> memberProfile;
}
