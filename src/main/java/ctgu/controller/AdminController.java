package ctgu.controller;

import ctgu.entity.Admin;
import ctgu.entity.AdminExample;
import ctgu.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class AdminController {
    @Autowired
    private AdminService adminService;

    @RequestMapping("/adminLogin.do")
    public String adminLogin(Admin loginingAdmin, Model model){
        AdminExample adminExample = new AdminExample();
        AdminExample.Criteria criteria = adminExample.createCriteria();
        criteria.andAdminnameEqualTo(loginingAdmin.getAdminname());
        criteria.andPasswordEqualTo(loginingAdmin.getPassword());
        List<Admin> admins = adminService.selectByExample(adminExample);
        if (admins.size() == 1){
            Admin admin =  admins.get(0);
            model.addAttribute("adminname",admin.getAdminname());
            return "backstage/backstage-main";
        } else {
            model.addAttribute("login-msg","登录失败，用户名或密码错误");
            return "forward:backstageLogin.jsp";
        }
    }
}
