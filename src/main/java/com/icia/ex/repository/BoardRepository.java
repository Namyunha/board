package com.icia.ex.repository;

import com.icia.ex.dto.BoardDTO;
import com.icia.ex.dto.BoardFileDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

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

    public void delete(String password) {
        sql.delete("Board.delete", password);
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
        sql.insert("Board.saveFile", boardFileDTO);
    }

    public List<BoardFileDTO> findFile(Long boardId) {
        return sql.selectList("Board.findFile", boardId);
    }


    public List<BoardDTO> pagingList(Map<String, Integer> pagingParams) {
        return sql.selectList("Board.paging", pagingParams);
    }

    public int boardCount() {
        return sql.selectOne("Board.count");
    }

    public List<BoardDTO> searchList(Map<String, Object> pagingParams) {
        return sql.selectList("Board.search", pagingParams);
    }

    public int boardSearchCount(Map<String, Object> pagingParams) {
        return sql.selectOne("Board.searchCount", pagingParams);
    }

//    public List<BoardDTO> search(String keyword, String searchKeyword) {
//    }
}
