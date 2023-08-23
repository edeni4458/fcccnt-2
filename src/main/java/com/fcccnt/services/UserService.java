package com.fcccnt.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.fcccnt.models.LoginUser;
import com.fcccnt.models.User;
import com.fcccnt.repositories.UserRepository;

@Service
public class UserService {
    
    @Autowired
    private UserRepository userRepository;
    
    public User register(User newUser, BindingResult result) {

        
        if(!newUser.getPassword().equals(newUser.getConfirm())){
            result.rejectValue("confirm", "Confirm", "passwords must match");
            return null;
        }
        if(userRegistered(newUser.getEmail())){
            result.rejectValue("email", "Email", "email taken");
            return null;
        }
        if(result.hasErrors()){
            return null;
        }
    
        String hashedpw = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
        newUser.setPassword(hashedpw);        
        return userRepository.save(newUser);
    }


    public User login(LoginUser newLoginObject, BindingResult result) {

        if(!userRegistered(newLoginObject.getEmail())){
            result.rejectValue("email", "EmailLogin", "Invalid Credentials");     
                return null;
        }
        User user = findUserByEmaill(newLoginObject.getEmail());
        if(!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())){
            result.rejectValue("password", "Password", "Invalid Credentials");
            return null;
        }
        if(result.hasErrors()){
            return null;
        }

    
        return user;
    }
    private boolean userRegistered(String email){
        Optional<User> user = userRepository.findByEmail(email);
        return user.isPresent();
    }
    
    private User findUserByEmaill(String email){
        Optional<User> user = userRepository.findByEmail(email);
        return user.orElse(null);

    }
}