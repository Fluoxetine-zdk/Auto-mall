package ctgu.controller;

import ctgu.entity.Carinfo;
import ctgu.entity.CarinfoExample;
import ctgu.entity.OrderDetails;
import ctgu.entity.OrderDetailsExample;
import ctgu.service.CarService;
import ctgu.service.OrderDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class OrderDetailsContronller {

    @Autowired
    private OrderDetailsService orderDetailsService;

    @Autowired
    private CarService carService;


    public ModelAndView findOrderDetailsByOrderId(Integer orderid){
        ModelAndView mv = new ModelAndView();
        OrderDetailsExample orderDetailsExample = new OrderDetailsExample();
        OrderDetailsExample.Criteria criteria = orderDetailsExample.createCriteria();
        criteria.andOrderidEqualTo(orderid);
        List<OrderDetails> orderDetails = orderDetailsService.selectByExample(orderDetailsExample);
        mv.addObject("orderDetails",orderDetails);
        List<Carinfo> carInfoList = carService.selectByExample(new CarinfoExample());
        mv.addObject("carInfoList",carInfoList);
        return mv;
    }

    @RequestMapping("/backstageFindOrderDetailsByOrderId.do")
    public ModelAndView BackstageFindOrderDetailsByOrderId(Integer orderid){
        ModelAndView mv = findOrderDetailsByOrderId(orderid);
        mv.setViewName("backstage/orderDetails-list");
        return mv;
    }
}
