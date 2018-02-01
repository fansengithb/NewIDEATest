package com.crud.service;

import com.crud.bean.Employee;
import com.crud.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by fansen on 2018/1/25.
 */
@Service
public class EmployeeService {

    @Autowired
    EmployeeMapper employeeMapper;

    /**
     *
     * 查询所有员工
     * @return
     */
    public List<Employee> getAll(){

        return  employeeMapper.selectByExampleWithDept(null);
    }

    /**
     * 员工保存方法
     */
    public  void  saveEmp(Employee employee){
        employeeMapper.insertSelective(employee);
    }
}
