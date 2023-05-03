package com.icia.ex.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;

@Getter
@Setter
@ToString
public class BoardDTO {
    private Long id;
    private String boardWriter;
    private String boardPass;
    private String boardTitle;
    private String boardContents;
    private Timestamp board_created_time;
    private Timestamp board_updated_time;
    private Long board_hits;
    private int board_file_attached;
}
