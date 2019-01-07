package com.eshop.entity;

import java.sql.Timestamp;

/**
 * <author> 丰
 * <date>   2019/1/1 13:31
 * <desc>   产品基本信息实体类
 */
public class Product {
    private Integer index;
    private String pid;
    private String pname;
    private String brand;
    private Double price;
    private Integer capacity;
    private Integer weight;
    private String size;
    private String category;
    private String color;
    private String material;
    private String image;
    private String intro;
    private String bar_code;
    private String sales_status;
    private Timestamp add_time;

    public Integer getIndex() {
        return index;
    }

    public void setIndex(Integer index) {
        this.index = index;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getCapacity() {
        return capacity;
    }

    public void setCapacity(Integer capacity) {
        this.capacity = capacity;
    }

    public Integer getWeight() {
        return weight;
    }

    public void setWeight(Integer weight) {
        this.weight = weight;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getBar_code() {
        return bar_code;
    }

    public void setBar_code(String bar_code) {
        this.bar_code = bar_code;
    }

    public String getSales_status() {
        return sales_status;
    }

    public void setSales_status(String sales_status) {
        this.sales_status = sales_status;
    }

    public Timestamp getAdd_time() {
        return add_time;
    }

    public void setAdd_time(Timestamp add_time) {
        this.add_time = add_time;
    }

    @Override
    public String toString() {
        return "Product{" +
                "index=" + index +
                ", pid='" + pid + '\'' +
                ", pname='" + pname + '\'' +
                ", brand='" + brand + '\'' +
                ", price=" + price +
                ", capacity=" + capacity +
                ", weight=" + weight +
                ", size='" + size + '\'' +
                ", category='" + category + '\'' +
                ", color='" + color + '\'' +
                ", material='" + material + '\'' +
                ", image='" + image + '\'' +
                ", intro='" + intro + '\'' +
                ", bar_code='" + bar_code + '\'' +
                ", sales_status='" + sales_status + '\'' +
                ", add_time=" + add_time +
                '}';
    }
}
