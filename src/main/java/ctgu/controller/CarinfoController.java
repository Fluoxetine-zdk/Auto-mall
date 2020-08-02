package ctgu.controller;

import com.github.pagehelper.PageInfo;
import ctgu.entity.Brand;
import ctgu.entity.BrandExample;
import ctgu.entity.Carinfo;
import ctgu.entity.CarinfoExample;
import ctgu.service.BrandService;
import ctgu.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class CarinfoController {

    @Autowired
    private CarService carService;
    @Autowired
    private BrandService brandService;


    public ModelAndView findAllCarList(Integer page,Integer size){
        ModelAndView mv = new ModelAndView();
        CarinfoExample carinfoExample = new CarinfoExample();
        CarinfoExample.Criteria criteria = carinfoExample.createCriteria();
        List<Carinfo> carList = carService.selectByExample(carinfoExample,page,size);
        PageInfo pageInfo = new PageInfo(carList);
        mv.addObject("pageInfo",pageInfo);
        BrandExample brandExample = new BrandExample();
        BrandExample.Criteria criteria1 = brandExample.createCriteria();
        List<Brand> brands = brandService.selectByExample(brandExample);
        mv.addObject("brands",brands);
        return mv;
    }

    @RequestMapping("/unLogin/findAllCarList.do")
    public ModelAndView findAllCarListByUnLogin(@RequestParam(name = "page",required = true,defaultValue = "1") Integer page, @RequestParam(name = "size",required = true,defaultValue = "12") Integer size){
        ModelAndView mv = findAllCarList(page,size);
        mv.setViewName("list");
        return mv;
    }

    @RequestMapping("/user/findAllCarList.do")
    public ModelAndView findAllCarListByUser(@RequestParam(name = "page",required = true,defaultValue = "1") Integer page, @RequestParam(name = "size",required = true,defaultValue = "12") Integer size){
        ModelAndView mv = findAllCarList(page,size);
        mv.setViewName("user/list");
        return mv;
    }

}
