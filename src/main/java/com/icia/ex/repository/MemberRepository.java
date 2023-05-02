package com.icia.ex.repository;


import com.icia.ex.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public int save(MemberDTO memberDTO){
        return sql.insert("Member.save", memberDTO);
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
}
