package com.coursework.dto.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
public class SignUpRequest {
    @Size(min = 5, max = 50, message = "Имя пользователя должно быть от 5 до 50 символов")
    @NotBlank(message = "Имя пользователя не должно быть пустым")
    private String username;

    @Size (max = 255, message = "Длинна пароля должна быть не более 255 символов")
    @NotBlank(message = "Пароль не должен быть пустым")
    private String password;
}