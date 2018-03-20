package com.crud.controller;

import com.crud.bean.Employee;
import com.crud.bean.Msg;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import  com.crud.service.EmployeeService;

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
     * 员工更新方法
     * @param employee
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.PUT)
    public Msg saveEmp(Employee employee){

        employeeService.updateEmp(employee);
        return  Msg.success();
    }

    /**
     * 根据id 查询员工
     * @param id
     * @return
     */
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    @ResponseBody
    public  Msg getEmp(@PathVariable("id") Integer id){
        Employee employee = employeeService.getEmp(id);
        return  Msg.success().add("emp",employee);
    }



    /**
     * 检查用户名是否可用
     * @param empName
     * @return
     */
    @ResponseBody
    @RequestMapping("/checkuser")
    public Msg checkuser(@RequestParam("empName")String empName){
        //先判断用户名是否是合法的表达式;
        String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})";
        if(!empName.matches(regx)){
            return Msg.fail().add("va_msg", "用户名必须是6-16位数字和字母的组合或者2-5位中文");
        }

        //数据库用户名重复校验
        boolean b = employeeService.checkUser(empName);
        if(b){
            return Msg.success();
        }else{
            return Msg.fail().add("va_msg", "用户名不可用");
        }
    }

    /**
     * 员工保存
     * @return
     */
    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    @ResponseBody
    public Msg saveEmp1(Employee employee){
        employeeService.saveEmp(employee);
        return Msg.success();
    }

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
