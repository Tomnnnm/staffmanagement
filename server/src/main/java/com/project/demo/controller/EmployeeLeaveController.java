package com.project.demo.controller;

import com.project.demo.entity.EmployeeLeave;
import com.project.demo.service.EmployeeLeaveService;
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
 *员工请假：(EmployeeLeave)表控制层
 *
 */
@RestController
@RequestMapping("/employee_leave")
public class EmployeeLeaveController extends BaseController<EmployeeLeave,EmployeeLeaveService> {

    /**
     *员工请假对象
     */
    @Autowired
    public EmployeeLeaveController(EmployeeLeaveService service) {
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
