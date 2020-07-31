package ctgu.controller;

import ctgu.entity.User;
import ctgu.entity.UserExample;
import ctgu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/login.do")
    public String userLogin(User loginingUser, Model model){
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andUsernameEqualTo(loginingUser.getUsername());
        criteria.andPasswordEqualTo(loginingUser.getPassword());
        List<User> list = userService.selectByExample(userExample);
        if (list.size() ==1){
            User loginedUser = list.get(0);
            model.addAttribute("username",loginedUser.getUsername());
            return "index";
        } else {
            model.addAttribute("login-msg","登录失败，用户名或密码错误");
            return "forward:login.jsp";
        }

    }

    @RequestMapping("/register.do")
    public String userRegister(User registerUser,Model model){
        User user = userService.selectByPrimaryKey(registerUser.getUsername());
        if (user != null){
            model.addAttribute("register-msg","用户名已被注册，请重新输入用户名");
            return "forward:register.jsp";
        } else {
            userService.insertSelective(registerUser);
            return "redirect:login.jsp";
        }


    }
}
