package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 *员工加班：(EmployeeOvertime)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "EmployeeOvertime")
public class EmployeeOvertime implements Serializable {

    //EmployeeOvertime编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "employee_overtime_id")
    private Integer employee_overtime_id;
    // 员工
    @Basic
    private Integer staff;
    // 加班日期
    @Basic
    private Timestamp overtime_date;
    // 加班时长
    @Basic
    private String overtime_hours;
    // 下班时间
    @Basic
    private Timestamp closing_time;

    // 更新时间
    @Basic
    private Timestamp update_time;

    // 创建时间
    @Basic
    private Timestamp create_time;

}
