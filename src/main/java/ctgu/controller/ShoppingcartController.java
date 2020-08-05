package ctgu.controller;

import ctgu.entity.Carinfo;
import ctgu.entity.CarinfoExample;
import ctgu.entity.Shoppingcart;
import ctgu.entity.ShoppingcartExample;
import ctgu.service.CarService;
import ctgu.service.ShoppingcartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller

public class ShoppingcartController {

    @Autowired
    private ShoppingcartService shoppingcartService;

    @Autowired
    private CarService carService;

    public void addShoppingCart(String username,Integer carid){
        Carinfo carinfo = carService.selectByPrimaryKey(carid);
        Shoppingcart shoppingcart = new Shoppingcart();
        ShoppingcartExample shoppingcartExample = new ShoppingcartExample();
        ShoppingcartExample.Criteria criteria = shoppingcartExample.createCriteria();
        criteria.andUsernameEqualTo(username);
        criteria.andCaridEqualTo(carid);
        List<Shoppingcart> result = shoppingcartService.selectByExample(shoppingcartExample);
        if (result.size()==0){
            shoppingcart.setUsername(username);
            shoppingcart.setCarid(carid);
            shoppingcart.setNumber(1);
            shoppingcart.setPrice(carinfo.getPrice());
            shoppingcartService.insertSelective(shoppingcart);
        } else {
            shoppingcart = result.get(0);
            shoppingcart.setNumber(shoppingcart.getNumber()+1);
            shoppingcartService.updateByPrimaryKeySelective(shoppingcart);
        }
    }

    @RequestMapping("/addShoppingCartInList.do")
    public String addShoppingCartInList(String username,Integer carid){
        addShoppingCart(username,carid);
        return "redirect:/user/findAllCarList.do";
    }

    @RequestMapping("/addShoppingCartInDetail.do")
    public String addShoppingCartInDetail(String username,Integer carid){
        addShoppingCart(username,carid);
        return "redirect:userFindCarInfoByCarId.do?carid="+carid;
    }

    @RequestMapping("/findShoppingCartByUsername.do")
    public ModelAndView findShoppingCartByUsername(String username){
        ModelAndView mv = new ModelAndView();
        ShoppingcartExample shoppingcartExample = new ShoppingcartExample();
        ShoppingcartExample.Criteria criteria = shoppingcartExample.createCriteria();
        criteria.andUsernameEqualTo(username);
        List<Shoppingcart> shoppingcartList = shoppingcartService.selectByExample(shoppingcartExample);
        List<Carinfo> carInfoList = carService.selectByExample(new CarinfoExample());
        mv.addObject("shoppingcartList",shoppingcartList);
        mv.addObject("carInfoList",carInfoList);
        mv.setViewName("user/shoppingcart");
        return mv;
    }


    @RequestMapping("/CarInfoNumUpdate.do")
    @ResponseBody
    public void CarInfoNumUpdate(Integer shoppingcartid,Integer number){
        Shoppingcart shoppingcart = new Shoppingcart();
        shoppingcart.setShoppingcartid(shoppingcartid);
        shoppingcart.setNumber(number);
        shoppingcartService.updateByPrimaryKeySelective(shoppingcart);
    }

    @RequestMapping("/deleteShoppingCartById.do")
    public ModelAndView deleteShoppingCartById(Integer shoppingcartid,String username){
        ModelAndView mv = new ModelAndView();
        System.out.println(shoppingcartService.deleteByPrimaryKey(shoppingcartid));
        mv.setViewName("redirect:findShoppingCartByUsername.do?username="+username);
        return mv;
    }

}
