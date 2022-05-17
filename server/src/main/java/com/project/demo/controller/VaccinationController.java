package com.project.demo.controller;

import com.project.demo.entity.Vaccination;
import com.project.demo.service.VaccinationService;
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
 *疫苗接种：(Vaccination)表控制层
 *
 */
@RestController
@RequestMapping("/vaccination")
public class VaccinationController extends BaseController<Vaccination,VaccinationService> {

    /**
     *疫苗接种对象
     */
    @Autowired
    public VaccinationController(VaccinationService service) {
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
