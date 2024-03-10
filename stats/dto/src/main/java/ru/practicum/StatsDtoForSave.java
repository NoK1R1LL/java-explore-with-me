package ru.practicum.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class StatsDtoForSave {
    private Long id;
    @NotBlank(message = "Имя приложения должно быть не пустым.")
    private String app;
    @NotBlank(message = "Строка, по которой сохраняется обращение в БД должна быть не пустой.")
    private String uri;
    @NotBlank(message = "IP-адрес, с которого идёт запрос не должен быть пустым для сохранения в БД.")
    private String ip;
    @NotNull(message = "Отсутствует параметр 'timestamp' или он равен null DTO-объекта при сохранении " +
            "в БД обращения к ресурсу.")
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime timestamp;
}