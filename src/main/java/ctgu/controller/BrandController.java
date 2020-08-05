package ctgu.controller;

import com.github.pagehelper.PageInfo;
import ctgu.entity.Brand;
import ctgu.entity.BrandExample;
import ctgu.service.BrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class BrandController {

    @Autowired
    private BrandService brandService;

    @RequestMapping("/findBrandList.do")
    public ModelAndView findBrandList(@RequestParam(name = "page",required = true,defaultValue = "1") Integer page, @RequestParam(name = "size",required = true,defaultValue = "5") Integer size){
        ModelAndView mv = new ModelAndView();
        List<Brand> brandList = brandService.selectAll(new BrandExample(), page, size);
        PageInfo pageInfo = new PageInfo(brandList);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("backstage/brand-list");
        return mv;
    }

    @RequestMapping("/findBrandByBrandId.do")
    public ModelAndView findBrandByBrandId(Integer brandid){
        ModelAndView mv = new ModelAndView();
        Brand brand = brandService.selectByPrimaryKey(brandid);
        mv.addObject("brand",brand);
        mv.setViewName("backstage/brand-update");
        return mv;
    }

    @RequestMapping("/addBrand.do")
    public ModelAndView addBrand(Brand brand){
        ModelAndView mv = new ModelAndView();
        Brand result = brandService.selectByPrimaryKey(brand.getBrandid());
        if (result == null){
            brandService.insertSelective(brand);
            mv.setViewName("redirect:findBrandList.do");
        } else {
            mv.addObject("addBrandErrorMessage","品牌ID已存在，请重新输入或默认不填！");
            mv.setViewName("backstage/brand-add");
        }
        return mv;
    }

    @RequestMapping("/updateBrand.do")
    public ModelAndView updateBrand(Brand brand){
        ModelAndView mv = new ModelAndView();
        brandService.updateByPrimaryKeySelective(brand);
        mv.setViewName("redirect:findBrandList.do");
        return mv;
    }
}
