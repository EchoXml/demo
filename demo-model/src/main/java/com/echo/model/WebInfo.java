package com.echo.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "web_info")
public class WebInfo {
    @Id
    @Column(name = "rec_date")
    private Date recDate;

    /**
     * 当日用户注册数
     */
    @Column(name = "user_register_num")
    private Integer userRegisterNum;

    /**
     * 当日网站IP数
     */
    @Column(name = "rec_ip")
    private Integer recIp;

    /**
     * 当日图书归还数
     */
    @Column(name = "rec_book_return")
    private Integer recBookReturn;

    /**
     * 当日图书预约数
     */
    @Column(name = "rec_book_appoint")
    private Integer recBookAppoint;

    /**
     * 当日独立访客人数
     */
    @Column(name = "rec_uv")
    private Integer recUv;

    /**
     * @return rec_date
     */
    public Date getRecDate() {
        return recDate;
    }

    /**
     * @param recDate
     */
    public void setRecDate(Date recDate) {
        this.recDate = recDate;
    }

    /**
     * 获取当日用户注册数
     *
     * @return user_register_num - 当日用户注册数
     */
    public Integer getUserRegisterNum() {
        return userRegisterNum;
    }

    /**
     * 设置当日用户注册数
     *
     * @param userRegisterNum 当日用户注册数
     */
    public void setUserRegisterNum(Integer userRegisterNum) {
        this.userRegisterNum = userRegisterNum;
    }

    /**
     * 获取当日网站IP数
     *
     * @return rec_ip - 当日网站IP数
     */
    public Integer getRecIp() {
        return recIp;
    }

    /**
     * 设置当日网站IP数
     *
     * @param recIp 当日网站IP数
     */
    public void setRecIp(Integer recIp) {
        this.recIp = recIp;
    }

    /**
     * 获取当日图书归还数
     *
     * @return rec_book_return - 当日图书归还数
     */
    public Integer getRecBookReturn() {
        return recBookReturn;
    }

    /**
     * 设置当日图书归还数
     *
     * @param recBookReturn 当日图书归还数
     */
    public void setRecBookReturn(Integer recBookReturn) {
        this.recBookReturn = recBookReturn;
    }

    /**
     * 获取当日图书预约数
     *
     * @return rec_book_appoint - 当日图书预约数
     */
    public Integer getRecBookAppoint() {
        return recBookAppoint;
    }

    /**
     * 设置当日图书预约数
     *
     * @param recBookAppoint 当日图书预约数
     */
    public void setRecBookAppoint(Integer recBookAppoint) {
        this.recBookAppoint = recBookAppoint;
    }

    /**
     * 获取当日独立访客人数
     *
     * @return rec_uv - 当日独立访客人数
     */
    public Integer getRecUv() {
        return recUv;
    }

    /**
     * 设置当日独立访客人数
     *
     * @param recUv 当日独立访客人数
     */
    public void setRecUv(Integer recUv) {
        this.recUv = recUv;
    }

    @Override
    public String toString() {
        return "WebInfo{" +
                "recDate=" + recDate +
                ", userRegisterNum=" + userRegisterNum +
                ", recIp=" + recIp +
                ", recBookReturn=" + recBookReturn +
                ", recBookAppoint=" + recBookAppoint +
                ", recUv=" + recUv +
                '}';
    }
}