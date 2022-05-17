package com.project.demo.controller;

import com.project.demo.entity.EmployeeOvertime;
import com.project.demo.service.EmployeeOvertimeService;
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
 *员工加班：(EmployeeOvertime)表控制层
 *
 */
@RestController
@RequestMapping("/employee_overtime")
public class EmployeeOvertimeController extends BaseController<EmployeeOvertime,EmployeeOvertimeService> {

    /**
     *员工加班对象
     */
    @Autowired
    public EmployeeOvertimeController(EmployeeOvertimeService service) {
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
