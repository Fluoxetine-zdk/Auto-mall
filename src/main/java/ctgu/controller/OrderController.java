package ctgu.controller;

import com.github.pagehelper.PageInfo;
import ctgu.entity.*;
import ctgu.service.CarService;
import ctgu.service.OrderDetailsService;
import ctgu.service.OrdersService;
import ctgu.service.ShoppingcartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class OrderController {

    @Autowired
    private OrdersService ordersService;

    @Autowired
    private ShoppingcartService shoppingcartService;

    @Autowired
    private OrderDetailsService orderDetailsService;

    @Autowired
    private CarService carService;

    @RequestMapping("/findOrderListByBackstage.do")
    public ModelAndView findOrderListByBackstage(@RequestParam(name = "page",required = true,defaultValue = "1") Integer page, @RequestParam(name = "size",required = true,defaultValue = "5") Integer size){
        ModelAndView mv = new ModelAndView();
        OrdersExample ordersExample = new OrdersExample();
        ordersExample.setOrderByClause("createdate DESC");
        List<Orders> orderList = ordersService.selectByExample(ordersExample,page,size);
        PageInfo pageInfo = new PageInfo(orderList);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("backstage/order-list");
        return mv;
    }

    @RequestMapping("/backstageFindOrderByOrderId.do")
    public ModelAndView findOrderByOrderId(Integer orderid){
        ModelAndView mv = new ModelAndView();
        Orders order = ordersService.selectByPrimaryKey(orderid);
        mv.addObject("order",order);
        mv.setViewName("backstage/order-update");
        return mv;
    }

    @RequestMapping("/backstageUpdateOrder.do")
    public ModelAndView backstageUpdateOrder(Orders order){
        ModelAndView mv = new ModelAndView();
        ordersService.updateByPrimaryKeySelective(order);
        mv.setViewName("redirect:findOrderListByBackstage.do");
        return mv;
    }

    @RequestMapping("/insertOrder.do")
    public ModelAndView insertOrder(String username){
        ModelAndView mv = new ModelAndView();
        ShoppingcartExample shoppingcartExample = new ShoppingcartExample();
        ShoppingcartExample.Criteria criteria = shoppingcartExample.createCriteria();
        criteria.andUsernameEqualTo(username);
        List<Shoppingcart> shoppingcartList = shoppingcartService.selectByExample(shoppingcartExample);
        Orders order =new Orders();
        float totalprice = 0;
        for (int i = 0 ; i < shoppingcartList.size(); i++){
            totalprice += (shoppingcartList.get(i).getNumber()*shoppingcartList.get(i).getPrice());
        }
        order.setTotalprice(totalprice);
        order.setUsername(username);
        ordersService.insertSelective(order);
        OrdersExample ordersExample = new OrdersExample();
        ordersExample.setOrderByClause("createdate DESC");
        List<Orders> ordersList = ordersService.selectByExample(ordersExample, 1, 1);
        int orderid = ordersList.get(0).getOrderid();
        for (int i = 0 ; i < shoppingcartList.size(); i++) {
            OrderDetails orderDetails = new OrderDetails();
            orderDetails.setOrderid(orderid);
            orderDetails.setCarid(shoppingcartList.get(i).getCarid());
            orderDetails.setNumber(shoppingcartList.get(i).getNumber());
            orderDetailsService.insertSelective(orderDetails);
            shoppingcartService.deleteByPrimaryKey(shoppingcartList.get(i).getShoppingcartid());
        }
        mv.addObject("orderDetails",shoppingcartList);
        mv.addObject("order",ordersList.get(0));
        mv.addObject("carInfoList",carService.selectByExample(new CarinfoExample()));
        mv.setViewName("user/order-submit");
        return mv;
    }

    @RequestMapping("/orderStatusUpate.do")
    public ModelAndView orderStatusUpate(Integer orderid){
        ModelAndView mv = new ModelAndView();
        Orders orders = new Orders();
        orders.setOrderid(orderid);
        orders.setStatus(1);
        ordersService.updateByPrimaryKeySelective(orders);
        mv.setViewName("user/index");
        return mv;
    }

}
