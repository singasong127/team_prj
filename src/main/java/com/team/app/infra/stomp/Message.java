package com.team.app.infra.stomp;

import lombok.Data;

import java.util.Date;

@Data
public class Message {
    private String message;
    private String nickname;
    private Date date;

    Message(){
        date = new Date();
    }
}
