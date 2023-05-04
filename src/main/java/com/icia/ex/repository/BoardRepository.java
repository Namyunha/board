package com.icia.ex.repository;

import com.icia.ex.dto.BoardDTO;
import com.icia.ex.dto.BoardFileDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardRepository {
    @Autowired
    private SqlSessionTemplate sql;

    //    public int save(BoardDTO boardDTO) {
//        return sql.insert("Board.save", boardDTO);
//    }

    public BoardDTO save(BoardDTO boardDTO) {
        System.out.println("insert 전 boardDTO = " + boardDTO);
        sql.insert("Board.save", boardDTO);
        System.out.println("insert 후 boardDTO = " + boardDTO);
        return boardDTO;
    }

    public List<BoardDTO> findAll() {
        return sql.selectList("Board.findAll");
    }

    public List<BoardDTO> findAll2() {
        return sql.selectList("Board.findAll2");
    }

    public BoardDTO findById(Long id) {
        return sql.selectOne("Board.findById", id);
    }

    public void delete(Long id) {
        sql.delete("Board.delete", id);
    }

    public void upHits(Long id) {
        sql.update("Board.upHits", id);
    }

    public void update(BoardDTO boardDTO) {
        sql.update("Board.update", boardDTO);
    }

    public BoardDTO findOne(BoardDTO boardDTO) {
        return sql.selectOne("Board.findOne", boardDTO);
    }

    public void saveFile(BoardFileDTO boardFileDTO) {
        sql.insert("BoardFile.findFile", boardFileDTO);
    }
}
