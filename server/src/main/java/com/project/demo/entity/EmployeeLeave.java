package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 *员工请假：(EmployeeLeave)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "EmployeeLeave")
public class EmployeeLeave implements Serializable {

    //EmployeeLeave编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "employee_leave_id")
    private Integer employee_leave_id;
    // 员工工号
    @Basic
    private Integer employee_job_number;
    // 员工姓名
    @Basic
    private String employee_name;
    // 部门
    @Basic
    private String department;
    // 请假类型
    @Basic
    private String leave_type;
    // 请假天数
    @Basic
    private Integer leave_days;
    // 开始时间
    @Basic
    private Timestamp start_time;
    // 结束时间
    @Basic
    private Timestamp end_time;
    // 请假原因
    @Basic
    private String reason_for_leave;
    // 审核状态
    @Basic
    private String examine_state;
    // 审核回复
    @Basic
    private String examine_reply;

    // 更新时间
    @Basic
    private Timestamp update_time;

    // 创建时间
    @Basic
    private Timestamp create_time;

}
