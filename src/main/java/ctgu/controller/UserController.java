package ctgu.controller;

import ctgu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/login.do")
    public String userLogin(){

        return "";
    }
}
