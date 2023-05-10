package com.icia.ex.repository;


import com.icia.ex.dto.MemberDTO;
import com.icia.ex.dto.MemberFileDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public MemberDTO save(MemberDTO memberDTO) {
        System.out.println("insert 전 memberDTO = " + memberDTO);
        sql.insert("Member.save", memberDTO);
        System.out.println("insert 후 memberDTO = " + memberDTO);
        return memberDTO;
    }
    public MemberDTO login(MemberDTO memberDTO) {
        return sql.selectOne("Member.login", memberDTO);
    }
    public List<MemberDTO> findAll() {
        return sql.selectList("Member.findAll");
    }
    public MemberDTO findById(String memberId) {
        return sql.selectOne("Member.findById", memberId);
    }
    public MemberDTO findByUser(Long id) {
        return sql.selectOne("Member.findByUser", id);
    }
    public void saveFile(MemberFileDTO memberFileDTO) {
        sql.insert("Member.saveFile", memberFileDTO);
    }
    public List<MemberFileDTO> findFile(Long id) {
        System.out.println(id);
        return sql.selectList("Member.findFile", id);
    }
    public MemberDTO duCheck(String checkId) {
        return sql.selectOne("Member.findById", checkId);
    }
    public MemberDTO findDTO(String memberEmail) {
        return sql.selectOne("Member.findByEmail", memberEmail);
    }
    public MemberDTO login2(MemberDTO memberDTO) {
        return sql.selectOne("Member.findDTO",memberDTO);
    }
}
