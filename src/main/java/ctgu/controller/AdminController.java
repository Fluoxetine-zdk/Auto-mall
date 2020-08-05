package ctgu.controller;

import com.github.pagehelper.PageInfo;
import ctgu.entity.Admin;
import ctgu.entity.AdminExample;
import ctgu.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@SessionAttributes("adminname")
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
        if (admins.size() == 1 && admins.get(0).getStatus() == 1){
            Admin admin =  admins.get(0);
            model.addAttribute("adminname",admin.getAdminname());
            return "backstage/backstage-main";
        } else {
            model.addAttribute("login-msg","登录失败，用户名或密码错误");
            return "forward:backstageLogin.jsp";
        }
    }

    @RequestMapping("/findAdminList.do")
    public ModelAndView findAdminList(@RequestParam(name = "page",required = true,defaultValue = "1") Integer page, @RequestParam(name = "size",required = true,defaultValue = "5") Integer size){
        ModelAndView mv = new ModelAndView();
        AdminExample adminExample = new AdminExample();
        List<Admin> adminList = adminService.findAdminList(adminExample, page, size);
        PageInfo pageInfo = new PageInfo(adminList);
        mv.addObject(pageInfo);
        mv.setViewName("backstage/admin-list");
        return mv;
    }

    @RequestMapping("addAdmin.do")
    public ModelAndView addAdmin(Admin admin){
        ModelAndView mv = new ModelAndView();
        Admin result = adminService.selectByPrimaryKey(admin.getAdminname());
        if (result != null){
            mv.addObject("addAdminErrorMessage","管理员账号已存在，请重新输入管理员账号！");
            mv.setViewName("backstage/admin-add");
        } else{
            adminService.insertSelective(admin);
            mv.setViewName("redirect:findAdminList.do");
        }
        return mv;
    }

    @RequestMapping("/findAdminByName.do")
    public ModelAndView findAdminByName(String adminname){
        ModelAndView mv = new ModelAndView();
        Admin admin = adminService.selectByPrimaryKey(adminname);
        mv.addObject("admin",admin);
        mv.setViewName("backstage/admin-update");
        return mv;
    }

    @RequestMapping("/backstageUpdateAdmin.do")
    public String updateUser(Admin admin){
        adminService.updateByPrimaryKeySelective(admin);
        return "redirect:findAdminList.do";
    }

    @RequestMapping("/adminLogout.do")
    public String tologout(HttpSession session, SessionStatus sessionStatus) {
        session.removeAttribute("adminname");
        sessionStatus.setComplete();
        return "redirect:backstageLogin.jsp";
    }
}
