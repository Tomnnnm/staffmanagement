package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 *员工工资：(EmployeeSalary)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "EmployeeSalary")
public class EmployeeSalary implements Serializable {

    //EmployeeSalary编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "employee_salary_id")
    private Integer employee_salary_id;
    // 员工
    @Basic
    private Integer staff;
    // 发薪月份
    @Basic
    private String salary_month;
    // 基本工资
    @Basic
    private Integer base_pay;
    // 加班费
    @Basic
    private Integer overtime_pay;
    // 提成
    @Basic
    private Integer commission;
    // 考勤扣款
    @Basic
    private Integer attendance_deduction;
    // 五险一金
    @Basic
    private Integer five_insurances_and_one_fund;
    // 税费
    @Basic
    private Integer taxation;
    // 实发工资
    @Basic
    private String net_salary;
    // 备注
    @Basic
    private String remarks;

    // 更新时间
    @Basic
    private Timestamp update_time;

    // 创建时间
    @Basic
    private Timestamp create_time;

}
