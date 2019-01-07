package com.eshop.entity;

import java.sql.Timestamp;

public class Customer {
    private Integer index;
    private String cid;
    private String cname;
    private String cpass;
    private String realname;
    private String tel;
    private String email;
    private String address;
    private String status;
    private Timestamp add_time;

    public Integer getIndex() {
        return index;
    }

    public void setIndex(Integer index) {
        this.index = index;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getCpass() {
        return cpass;
    }

    public void setCpass(String cpass) {
        this.cpass = cpass;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getAdd_time() {
        return add_time;
    }

    public void setAdd_time(Timestamp add_time) {
        this.add_time = add_time;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "index=" + index +
                ", cid='" + cid + '\'' +
                ", cname='" + cname + '\'' +
                ", cpass='" + cpass + '\'' +
                ", realname='" + realname + '\'' +
                ", tel='" + tel + '\'' +
                ", email='" + email + '\'' +
                ", address='" + address + '\'' +
                ", status='" + status + '\'' +
                ", add_time=" + add_time +
                '}';
    }
}
