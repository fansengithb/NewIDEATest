package com.crud.test;

import com.crud.bean.Department;
import com.crud.bean.Employee;
import com.crud.dao.DepartmentMapper;
import com.crud.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

/**
 *
 * 测试dao层
 * Created by fansen on 2018/1/24.
 * 使用spring的单元测试，注入我们需要的组件.
 *
 * 1 导入springTest模块。
 * 2  使用ContextConfiguration指定spring配置文件的位置。
 * 3 直接aurowired要使用的组件.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {
    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    EmployeeMapper employeeMapper;

    @Autowired
    SqlSession sqlSession;

    @Test
    public void testCRUD(){
        System.out.println(departmentMapper);

//      1 --  插入几个部门
//        departmentMapper.insertSelective(new Department(null,"后勤部"));

//      2  -- 生成员工数据
//        employeeMapper.insertSelective(new Employee(null,"www","M","were@qq.com",1));


//        使用sqlsession（）批量插入多个数据！
        
        EmployeeMapper mapper =sqlSession.getMapper(EmployeeMapper.class);
        for (int i = 0; i <20 ; i++) {
            String uid = UUID.randomUUID().toString().substring(0,3)+i;
                    employeeMapper.insertSelective(new Employee(null,uid,"M",uid+"were@qq.com",1));

        }


        System.out.println("success!");

//
    }

}
