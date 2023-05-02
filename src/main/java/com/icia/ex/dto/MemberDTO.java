package com.icia.ex.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

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
}
