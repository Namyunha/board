package com.icia.ex.controller;

import com.icia.ex.dto.BoardDTO;
import com.icia.ex.dto.MemberDTO;
import com.icia.ex.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.util.List;

@Controller
public class BoardController {

    @Autowired
    BoardService boardService;

    @GetMapping("board")
    public String board() {
        return "board";
    }

    @GetMapping("boardSave")
    public String boardSave() {
        return "boardSave";
    }

//    @PostMapping("boardSave")
//    public String saveParam(BoardDTO boardDTO, Model model) {
//        int board = boardService.save(boardDTO);
//        model.addAttribute("result", board);
//        return "board";
//    }

    @PostMapping("boardSave")
    public String saveParam(BoardDTO boardDTO) throws IOException {
        boardService.save(boardDTO);
        return "board";
    }
    @GetMapping("boardList")
    public String boardList(Model model) {
        List<BoardDTO> boardDTOList = boardService.findAll();
        model.addAttribute("boardList", boardDTOList);
        System.out.println(boardDTOList);
        return "boardList";
    }

    @GetMapping("boardList2")
    public String boardList2(Model model) {
        List<BoardDTO> boardDTOList = boardService.findAll2();
        model.addAttribute("boardList", boardDTOList);
        System.out.println(boardDTOList);
        return "boardList";
    }

    @GetMapping("ajax-detail")
    public ResponseEntity detailAjax(@RequestParam("id") Long id) {
        System.out.println("id = " + id);
        BoardDTO dto = boardService.findById(id);
        boardService.upHits(id);
        System.out.println("dto: " + dto);
        if (dto != null) {
            return new ResponseEntity<>(dto, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping("ajax-delete")
    public String deleteAjax(@RequestParam("id") Long id) {
        System.out.println("id = " + id);
        boardService.delete(id);
        return "board";
    }

    @GetMapping("boardUpdate")
    public String boardUpdate(@RequestParam("id") Long id, Model model) {
        System.out.println("id = " + id);
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("boardDTO", boardDTO);
        return "boardUpdate";
    }

    @PostMapping("boardUpdate")
    public String boardUpdate(@ModelAttribute BoardDTO boardDTO) {
        System.out.println(boardDTO);
        boardService.update(boardDTO);
        return "board";
    }

    @GetMapping("deleteCheck")
    public String deleteCheck(@RequestParam("id") Long id, Model model) {
        BoardDTO deleteBoard = boardService.findById(id);
        model.addAttribute("deleteBoard", deleteBoard);
        return "deleteCheck";
    }

    @PostMapping("deleteCheck")
    public String delete(@RequestParam("id") Long id){
        boardService.delete(id);
        return "board";
    }

    @GetMapping("searchBoard")
    public String search() {
        return "boardSearch";
    }

    @PostMapping("searchBoard")
    public String searchParam(@ModelAttribute BoardDTO boardDTO, Model model) {
        BoardDTO searchDTO = boardService.findOne(boardDTO);
        System.out.println(searchDTO);
        model.addAttribute("searchDTO", searchDTO);
        return "searchResult";
    }


}
