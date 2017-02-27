package com.echo.model;

import javax.persistence.*;

@Table(name = "book_rec")
public class BookRec {
    @Column(name = "bookNum")
    private Long booknum;

    @Column(name = "bookSum")
    private Long booksum;

    /**
     * @return bookNum
     */
    public Long getBooknum() {
        return booknum;
    }

    /**
     * @param booknum
     */
    public void setBooknum(Long booknum) {
        this.booknum = booknum;
    }

    /**
     * @return bookSum
     */
    public Long getBooksum() {
        return booksum;
    }

    /**
     * @param booksum
     */
    public void setBooksum(Long booksum) {
        this.booksum = booksum;
    }
}