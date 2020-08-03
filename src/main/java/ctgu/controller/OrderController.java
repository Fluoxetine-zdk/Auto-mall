package ctgu.controller;

import com.github.pagehelper.PageInfo;
import ctgu.entity.Orders;
import ctgu.entity.OrdersExample;
import ctgu.service.OrdersService;
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

    @RequestMapping("/findOrderListByBackstage.do")
    public ModelAndView findOrderListByBackstage(@RequestParam(name = "page",required = true,defaultValue = "1") Integer page, @RequestParam(name = "size",required = true,defaultValue = "12") Integer size){
        ModelAndView mv = new ModelAndView();
        List<Orders> orderList = ordersService.selectByExample(new OrdersExample(),page,size);
        PageInfo pageInfo = new PageInfo(orderList);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("backstage/order-list");
        return mv;
    }



}
