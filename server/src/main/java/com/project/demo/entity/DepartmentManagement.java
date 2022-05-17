package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 *部门管理：(DepartmentManagement)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "DepartmentManagement")
public class DepartmentManagement implements Serializable {

    //DepartmentManagement编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "department_management_id")
    private Integer department_management_id;
    // 部门编号
    @Basic
    private String department_number;
    // 部门
    @Basic
    private String department;
    // 负责人
    @Basic
    private String person_in_charge;
    // 部门人数
    @Basic
    private Integer number_of_departments;
    // 成立日期
    @Basic
    private Timestamp date_of_incorporation;

    // 更新时间
    @Basic
    private Timestamp update_time;

    // 创建时间
    @Basic
    private Timestamp create_time;

}
