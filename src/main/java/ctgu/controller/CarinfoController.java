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
        List<Carinfo> carList = carService.selectListByPages(carinfoExample,page,size);
        PageInfo pageInfo = new PageInfo(carList);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("brandList",brandService.selectByExample(new BrandExample()));
        mv.addObject("carmodelList",carmodelService.selectByExample(new CarmodelExample()));
        return mv;
    }

    public ModelAndView findCarListByBrand(Integer brandid,Integer page,Integer size){
        ModelAndView mv = new ModelAndView();
        CarinfoExample carinfoExample = new CarinfoExample();
        CarinfoExample.Criteria criteria = carinfoExample.createCriteria();
        criteria.andBrandidEqualTo(brandid);
        List<Carinfo> carList = carService.selectListByPages(carinfoExample,page,size);
        PageInfo pageInfo = new PageInfo(carList);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("brandList",brandService.selectByExample(new BrandExample()));
        mv.addObject("carmodelList",carmodelService.selectByExample(new CarmodelExample()));
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

    @RequestMapping("/unLoginFindCarListByBrand.do")
    public ModelAndView unLoginFindCarListByBrand(Integer brandid,@RequestParam(name = "page",required = true,defaultValue = "1") Integer page, @RequestParam(name = "size",required = true,defaultValue = "12") Integer size){
        ModelAndView mv = findCarListByBrand(brandid,page,size);
        mv.addObject("brandid",brandid);
        mv.setViewName("list-brand");
        return mv;
    }

    @RequestMapping("/loginFindCarListByBrand.do")
    public ModelAndView loginFindCarListByBrand(Integer brandid,@RequestParam(name = "page",required = true,defaultValue = "1") Integer page, @RequestParam(name = "size",required = true,defaultValue = "12") Integer size){
        ModelAndView mv = findCarListByBrand(brandid,page,size);
        mv.addObject("brandid",brandid);
        mv.setViewName("user/list-brand");
        return mv;
    }

    @RequestMapping("/findCarListByBackstage.do")
    public ModelAndView findCarListByBackstage(@RequestParam(name = "page",required = true,defaultValue = "1") Integer page, @RequestParam(name = "size",required = true,defaultValue = "5") Integer size){
        ModelAndView mv = findAllCarList(page, size);
        mv.setViewName("/backstage/car-list");
        return mv;
    }

    @RequestMapping("/backstageFindCarById.do")
    public ModelAndView backstageFindCarById(Integer carid){
        ModelAndView mv = new ModelAndView();
        Carinfo carinfo = carService.selectByPrimaryKey(carid);
        mv.addObject("carInfo",carinfo);
        mv.addObject("brandList",brandService.selectByExample(new BrandExample()));
        mv.addObject("carmodelList",carmodelService.selectByExample(new CarmodelExample()));
        mv.setViewName("backstage/car-update");
        return mv;
    }

    @RequestMapping("/updateCarInfoByBackstage.do")
    public String updateCarInfoByBackstage(Carinfo carinfo){
        System.out.println(carService.updateByPrimaryKeySelective(carinfo));
        return "redirect:findCarListByBackstage.do";
    }

    @RequestMapping("/toAddCarInfoPage.do")
    public ModelAndView toAddCarInfoPage(){
        ModelAndView mv = new ModelAndView();
        mv.addObject("brandList",brandService.selectByExample(new BrandExample()));
        mv.addObject("carmodelList",carmodelService.selectByExample(new CarmodelExample()));
        mv.setViewName("backstage/car-add");
        return mv;
    }

    @RequestMapping("/addCarInfo.do")
    public ModelAndView addCarInfo(Carinfo carinfo){
        ModelAndView mv = new ModelAndView();
        Carinfo result = carService.selectByPrimaryKey(carinfo.getCarid());
        if (result != null){
            mv.addObject("addCarErrorMessage","添加失败，产品ID已被占用，请重新输入或不填写默认生成。");
            mv.addObject("brandList",brandService.selectByExample(new BrandExample()));
            mv.addObject("carmodelList",carmodelService.selectByExample(new CarmodelExample()));
            mv.setViewName("backstage/car-add");
        } else {
            carService.insertSelective(carinfo);
            mv.setViewName("redirect:findCarListByBackstage.do");
        }
        return mv;
    }

    @RequestMapping("/deleteCarInfoByCarId.do")
    public String deleteCarInfoByCarId(Integer carid){
        carService.deleteByPrimaryKey(carid);
        return "redirect:findCarListByBackstage.do";
    }

    @RequestMapping("/userFindCarInfoByCarId.do")
    public ModelAndView userFindCarInfoByCarId(Integer carid){
        ModelAndView mv = new ModelAndView();
        Carinfo carInfo = carService.selectByPrimaryKey(carid);
        mv.addObject("carInfo",carInfo);
        mv.setViewName("user/details");
        return mv;
    }

    @RequestMapping("/unLoginFindCarInfoByCarId.do")
    public ModelAndView unLoginFindCarInfoByCarId(Integer carid){
        ModelAndView mv = new ModelAndView();
        Carinfo carInfo = carService.selectByPrimaryKey(carid);
        mv.addObject("carInfo",carInfo);
        mv.setViewName("details");
        return mv;
    }


}
