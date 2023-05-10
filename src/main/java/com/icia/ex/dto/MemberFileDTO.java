package com.icia.ex.dto;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberFileDTO {
    private Long id;
    private String originalFileName;
    private String storedFileName;
    private Long MemberId;
}
