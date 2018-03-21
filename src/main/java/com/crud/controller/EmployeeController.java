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

import java.util.ArrayList;
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
     * 单个，批量二合一
     * 批量删除： 1-2-3
     * 单个删除 ： 1
     * @param
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.DELETE)
    public Msg deleteEmpById(@PathVariable("ids")String ids){
        if (ids.contains("-")){
            List<Integer> del_ids = new ArrayList<>();
            String[] strings = ids.split("-");
//            组装id的集合
                for(String string:strings){
                   del_ids.add( Integer.parseInt(string));
                }
            employeeService.deleteBatch(del_ids);
        }else {
            Integer id = Integer.parseInt(ids);
            employeeService.deleteEmp(id);

        }
        return  Msg.success();
    }


    /**
     * 员工更新方法
     *
     *
     * 如果直接发送ajax=put的请求
     * 封装的数据
     * Employee{empId=8, empName='null', gender='null', email='null', dId=null, department=null}
     *
     * 问题；请求体中有数据,但在employee中封装不上;
     *
     *原因:
     *tomcat 中  1 将请求体中的数据封装为一个map
     *           2 request.getparamter("empName") 会从map中取值
     *           3 springMVC疯转POJO对象的时候，
     *               会把POJO中属性的值从request.getparamter();中获取。
     *AJAX发送PUT请求引发的血案：
     * PUT请求,请求体中数据 requet.getParamter() 拿不到
     * tomcat看到是PUT请求，不会封装请求体中数据为map,
     * 只有POST请求才会封装为map
     *
     * 解决方法：
     * 1 配置  HttpPutFormContentFilter
     * 要解决发送put之类的请求，还要封装请求体中的数据
     * 需要配置HttpPutFormContentFilter
     * 2 作用 ：请求体中数据解析包装成一个map
     * 3  request被重新包装，request.getparamter()被重写，就会从中取数据。
     *
     *
     * @param employee
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/emp/{empId}",method = RequestMethod.PUT)
    public Msg saveEmp(Employee employee){
        System.out.println("  修改的员工数据："+employee);
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
