package com.echo.model;

import javax.persistence.*;

public class Book {
    /**
     * 图书ID
     */
    @Id
    @Column(name = "book_id")
    private Long bookId;

    /**
     * 图书名称
     */
    private String name;

    /**
     * 馆藏数量
     */
    private Integer number;

    /**
     * 获取图书ID
     *
     * @return book_id - 图书ID
     */
    public Long getBookId() {
        return bookId;
    }

    /**
     * 设置图书ID
     *
     * @param bookId 图书ID
     */
    public void setBookId(Long bookId) {
        this.bookId = bookId;
    }

    /**
     * 获取图书名称
     *
     * @return name - 图书名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置图书名称
     *
     * @param name 图书名称
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取馆藏数量
     *
     * @return number - 馆藏数量
     */
    public Integer getNumber() {
        return number;
    }

    /**
     * 设置馆藏数量
     *
     * @param number 馆藏数量
     */
    public void setNumber(Integer number) {
        this.number = number;
    }
}