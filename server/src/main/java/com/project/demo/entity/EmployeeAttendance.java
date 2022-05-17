package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 *员工考勤：(EmployeeAttendance)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "EmployeeAttendance")
public class EmployeeAttendance implements Serializable {

    //EmployeeAttendance编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "employee_attendance_id")
    private Integer employee_attendance_id;
    // 员工
    @Basic
    private Integer staff;
    // 考勤月份
    @Basic
    private String attendance_month;
    // 应到天数
    @Basic
    private Integer days_due;
    // 实到天数
    @Basic
    private Integer actual_arrival_days;
    // 缺勤天数
    @Basic
    private Integer absence_days;
    // 出勤率
    @Basic
    private String attendance;
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
