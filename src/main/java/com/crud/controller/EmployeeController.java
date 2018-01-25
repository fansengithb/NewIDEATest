package com.crud.controller;

import com.crud.bean.Employee;
import com.crud.bean.Msg;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import  com.crud.service.EmployeeService;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 处理员工crud请求
 * Created by fansen on 2018/1/25.
 */
@Controller
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;
    /**
     *
     * 查询员工数据，，分页查询
     * @return
     */



    /**
     * 导入jackson包。
     * @param pn
     * @return
     */
    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmpsWithJson(
            @RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        //        引入pageHelper分页插件
        PageHelper.startPage(pn,10);
//        startPage后面紧跟的就是分页查询
        List<Employee> emps = employeeService.getAll();
//        使用pageInfo包装查询结果,将pageInfo交给页面
//        包括详细的分页信息，包括查询的数据  传入连续显示的页数
        PageInfo page = new PageInfo(emps,5);
        return  Msg.success().add("pageInfo",page);

    }






//    @RequestMapping("/emps")
    public String getEmps(
            @RequestParam(value = "pn", defaultValue = "1") Integer pn,
            Model model){
//        引入pageHelper分页插件
        PageHelper.startPage(pn,10);
//        startPage后面紧跟的就是分页查询
        List<Employee> emps = employeeService.getAll();
//        使用pageInfo包装查询结果,将pageInfo交给页面
//        包括详细的分页信息，包括查询的数据  传入连续显示的页数
        PageInfo page = new PageInfo(emps,5);
        model.addAttribute("pageInfo",page);

        return "list" ;
    }
}
