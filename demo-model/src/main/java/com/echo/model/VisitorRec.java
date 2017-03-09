package com.echo.model;

import java.util.Date;
import javax.persistence.*;

@Table(name = "visitor_rec")
public class VisitorRec {
    /**
     * 主键
     */
    @Id
    @Column(name = "visit_id")
    private Integer visitId;

    /**
     * 访问时间
     */
    @Column(name = "visit_time")
    private Date visitTime;

    /**
     * ip地址
     */
    @Column(name = "ip_address")
    private String ipAddress;

    public String getRequestUrl() {
        return requestUrl;
    }

    public void setRequestUrl(String requestUrl) {
        this.requestUrl = requestUrl;
    }

    /**
     * 请求的Url地址
     */
    @Column(name = "request_url")
    private String requestUrl;

    /**
     * 浏览器版本号、类型
     */
    @Column(name = "user_agent")
    private String userAgent;

    /**
     * 获取主键
     *
     * @return visit_id - 主键
     */
    public Integer getVisitId() {
        return visitId;
    }

    /**
     * 设置主键
     *
     * @param visitId 主键
     */
    public void setVisitId(Integer visitId) {
        this.visitId = visitId;
    }

    /**
     * 获取访问时间
     *
     * @return visit_time - 访问时间
     */
    public Date getVisitTime() {
        return visitTime;
    }

    /**
     * 设置访问时间
     *
     * @param visitTime 访问时间
     */
    public void setVisitTime(Date visitTime) {
        this.visitTime = visitTime;
    }

    /**
     * 获取ip地址
     *
     * @return ip_address - ip地址
     */
    public String getIpAddress() {
        return ipAddress;
    }


    /**
     * 设置ip地址
     *
     * @param ipAddress ip地址
     */
    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }

    /**
     * 获取浏览器版本号、类型
     *
     * @return user_agent - 浏览器版本号、类型
     */
    public String getUserAgent() {
        return userAgent;
    }

    /**
     * 设置浏览器版本号、类型
     *
     * @param userAgent 浏览器版本号、类型
     */
    public void setUserAgent(String userAgent) {
        this.userAgent = userAgent;
    }


    public VisitorRec(Integer visitId, Date visitTime, String ipAddress, String requestUrl, String userAgent) {
        this.visitId = visitId;
        this.visitTime = visitTime;
        this.ipAddress = ipAddress;
        this.requestUrl = requestUrl;
        this.userAgent = userAgent;
    }

    public VisitorRec(Date visitTime, String ipAddress, String requestUrl, String userAgent) {
        this.visitTime = visitTime;
        this.ipAddress = ipAddress;
        this.requestUrl = requestUrl;
        this.userAgent = userAgent;
    }

    public VisitorRec() {
    }

    @Override
    public String toString() {
        return "VisitorRec{" +
                "visitId=" + visitId +
                ", visitTime=" + visitTime +
                ", ipAddress='" + ipAddress + '\'' +
                ", requestUrl='" + requestUrl + '\'' +
                ", userAgent='" + userAgent + '\'' +
                '}';
    }
}