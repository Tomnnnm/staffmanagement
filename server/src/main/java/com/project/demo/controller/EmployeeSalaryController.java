package com.project.demo.controller;

import com.project.demo.entity.EmployeeSalary;
import com.project.demo.service.EmployeeSalaryService;
import com.project.demo.controller.base.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 *员工工资：(EmployeeSalary)表控制层
 *
 */
@RestController
@RequestMapping("/employee_salary")
public class EmployeeSalaryController extends BaseController<EmployeeSalary,EmployeeSalaryService> {

    /**
     *员工工资对象
     */
    @Autowired
    public EmployeeSalaryController(EmployeeSalaryService service) {
        setService(service);
    }

    @PostMapping("/add")
    @Transactional
    public Map<String, Object> add(HttpServletRequest request) throws IOException {
        Map<String,Object> paramMap = service.readBody(request.getReader());
        this.addMap(paramMap);
        return success(1);
    }

}
