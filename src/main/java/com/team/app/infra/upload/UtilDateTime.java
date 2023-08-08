package com.team.app.infra.upload;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class UtilDateTime {
    public static String nowString() throws Exception {
        LocalDateTime localDateTime = LocalDateTime.now();
        String localDateTimeString = localDateTime.format(DateTimeFormatter.ofPattern(Constants_b.DATETIME_FORMAT_BASIC));
        return localDateTimeString;
    }
}
