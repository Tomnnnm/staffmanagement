package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 *疫苗接种：(Vaccination)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "Vaccination")
public class Vaccination implements Serializable {

    //Vaccination编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "vaccination_id")
    private Integer vaccination_id;
    // 员工工号
    @Basic
    private Integer employee_job_number;
    // 员工姓名
    @Basic
    private String employee_name;
    // 部门
    @Basic
    private String department;
    // 接种日期
    @Basic
    private Timestamp vaccination_date;
    // 接种针数
    @Basic
    private String number_of_inoculation_needles;
    // 接种凭证
    @Basic
    private String vaccination_certificate;

    // 更新时间
    @Basic
    private Timestamp update_time;

    // 创建时间
    @Basic
    private Timestamp create_time;

}
