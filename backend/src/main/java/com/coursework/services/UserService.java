package com.example.informationsystemlab1.services;


import com.example.informationsystemlab1.classes.Role;
import com.example.informationsystemlab1.classes.User;
import com.example.informationsystemlab1.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;


@Service
@RequiredArgsConstructor
public class UserService {
    @Autowired
    final private UserRepository repository;
    private final JwtService jwtService;

    /**
     * Сохранение пользователя
     */
    public User save(User user){
        return repository.save(user);
    }

    /**
     * Создание пользователя
     */
    public User create(User user){
        if(repository.existsByUsername(user.getUsername())){
            throw new RuntimeException("Пользователь с таким именем уже существует");
        }
        return save(user);
    }

    /**
     * Получение пользователя по имени пользователя
     */
    public User getByUserName(String username){
        return repository.findByUsername(username)
                .orElseThrow(() -> new UsernameNotFoundException("Пользователя не найден"));
    }

    public User getByJwtTokenFromHttpHeader(String token){
        return getByUserName(jwtService.extractUserName(token.substring(7)));
    }

    /**
     * Получение пользователя по имени пользователя
     * Нужно для Spring security
     */
    public UserDetailsService userDetailsService(){
        return this::getByUserName;
    }

    public User getCurrentUser(){
        var username = SecurityContextHolder.getContext().getAuthentication().getName();
        return getByUserName(username);
    }

    /**
     * Выдача прав администратора
     */
    public void getAdmin(){
        var user = getCurrentUser();
        user.setRole(Role.ROLE_ADMIN);
        save(user);
    }

}
