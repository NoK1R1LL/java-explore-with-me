package ru.practicum.exception;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class BadHttpMessageNotReadableException extends RuntimeException {
    public BadHttpMessageNotReadableException(String message) {
        super(message);
        log.error(message);
    }
}