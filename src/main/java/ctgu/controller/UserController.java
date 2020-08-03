package ctgu.controller;

import com.github.pagehelper.PageInfo;
import ctgu.entity.User;
import ctgu.entity.UserExample;
import ctgu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@SessionAttributes("username")
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
            return "user/index";
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

    @RequestMapping("/findUserList.do")
    public ModelAndView findUserList(@RequestParam(name = "page",required = true,defaultValue = "1") Integer page, @RequestParam(name = "size",required = true,defaultValue = "5") Integer size){
        ModelAndView mv = new ModelAndView();
        UserExample userExample = new UserExample();
        List<User> userList = userService.selectAll(userExample,page,size);
        PageInfo pageInfo = new PageInfo(userList);
        mv.addObject(pageInfo);
        mv.setViewName("backstage/user-list");
        return mv;
    }

    @RequestMapping("/addUser.do")
    public ModelAndView addUser(User user){
        ModelAndView mv = new ModelAndView();
        User result = userService.selectByPrimaryKey(user.getUsername());
        if (result != null){
            mv.addObject("addUserErrorMessage","用户名已存在，请重新输入！");
            mv.setViewName("backstage/user-add");
        } else {
            userService.insertSelective(user);
            mv.setViewName("redirect:findUserList.do");
        }
        return mv;
    }

    public ModelAndView selectByUsername(String username){
        ModelAndView mv = new ModelAndView();
        User user = userService.selectByPrimaryKey(username);
        mv.addObject("user",user);
        return mv;
    }

    @RequestMapping("/backstageFindUserByName.do")
    public ModelAndView findUserByName(String username){
        ModelAndView mv = selectByUsername(username);
        mv.setViewName("backstage/user-update");
        return mv;
    }

    @RequestMapping("/backstageUpdateUser.do")
    public String updateUserByBackstage(User user){
        userService.updateByPrimaryKeySelective(user);
        return "redirect:findUserList.do";
    }

    @RequestMapping("/findUserMessage.do")
    public ModelAndView findUserMessage(String username){
        ModelAndView mv = selectByUsername(username);
        mv.setViewName("user/userMessage");
        return mv;
    }

    @RequestMapping("/beforeUserMessageUpate.do")
    public ModelAndView beforeUserMessageUpate(String username){
        ModelAndView mv = selectByUsername(username);
        mv.setViewName("user/userUpdate");
        return mv;
    }

    @RequestMapping("/userMessageUpdateByUser.do")
    public ModelAndView updateUserByUser(User user){
        ModelAndView modelAndView = new ModelAndView();
        userService.updateByPrimaryKeySelective(user);
        modelAndView.setViewName("redirect:findUserMessage.do");
        return modelAndView;
    }



}
