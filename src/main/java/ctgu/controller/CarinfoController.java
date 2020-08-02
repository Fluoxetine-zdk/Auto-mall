package ctgu.controller;

import com.github.pagehelper.PageInfo;
import ctgu.entity.*;
import ctgu.service.BrandService;
import ctgu.service.CarService;
import ctgu.service.CarmodelService;
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
    @Autowired
    private CarmodelService carmodelService;


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

    @RequestMapping("/findCarListByBackstage.do")
    public ModelAndView findCarListByBackstage(@RequestParam(name = "page",required = true,defaultValue = "1") Integer page, @RequestParam(name = "size",required = true,defaultValue = "12") Integer size){
        ModelAndView mv = new ModelAndView();
        CarinfoExample carinfoExample = new CarinfoExample();
        List<Carinfo> carinfoList = carService.selectByExample(carinfoExample, page, size);
        PageInfo pageInfo = new PageInfo(carinfoList);
        BrandExample brandExample = new BrandExample();
        List<Brand> brandList = brandService.selectByExample(brandExample);
        CarmodelExample carmodelExample = new CarmodelExample();
        List<Carmodel> carmodelList = carmodelService.selectByExample(carmodelExample);
        mv.addObject(pageInfo);
        mv.addObject(brandList);
        mv.addObject(carmodelList);
        mv.setViewName("/backstage/car-list");
        return mv;
    }

    @RequestMapping("/backstageFindCarById.do")
    public ModelAndView backstageFindCarById(Integer carid){
        ModelAndView mv = new ModelAndView();
        Carinfo carinfo = carService.selectByPrimaryKey(carid);
        mv.addObject("carinfo",carinfo);
        mv.setViewName("backstage/car-list");
        return mv;
    }

    @RequestMapping("/updateCarInfoByBackstage.do")
    public String updateCarInfoByBackstage(Carinfo carinfo){
        carService.updateByPrimaryKeySelective(carinfo);
        return "redirect:findCarListByBackstage.do";
    }

}
