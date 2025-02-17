package com.example.informationsystemlab1.dto.request;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
@Schema(description = "Запрос на аутентефикацию")
public class SignInRequest {
    @Schema (description = "Имя пользователя", example = "John")
    @Size(min = 5, max = 50, message = "Имя пользователя должно быть от 5 до 50 символов")
    @NotBlank(message = "Имя пользователя не должно быть пустым")
    private String username;

    @Schema (description = "Пароль", example = "my_first_password")
    @Size (max = 255, message = "Длинна пароля должна быть не более 255 символов")
    @NotBlank(message = "Пароль не должен быть пустым")
    private String password;
}