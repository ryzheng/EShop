package com.eshop.entity;

/**
 * <author> 丰
 * <date>   2018/12/31 12:12
 * <desc>   基本的JSON返回格式
 */
public class BaseResponse<T> {
    private Integer code;
    private String msg;
    private Integer count;
    private T data;

    public BaseResponse() {
    }

    public BaseResponse(Integer code, String msg, Integer count, T data) {
        this.code = code;
        this.msg = msg;
        this.count = count;
        this.data = data;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
