package com.jxt.hql;

import java.io.Serializable;
import java.util.List;

/**
 * 分页信息封装类
 * 
 * @author xfzhou
 * @version 2009-8-31
 * @param <T> 分页范行类参数
 */
public class Pagination<T> implements Serializable {
    /**
     * 
     */
    private static final long serialVersionUID = 1L;;

    /**
     * 记录总数
     */
    private int totalRecords;

    /**
     * 分页总数
     */
    private int totalPages;

    /**
     * 分页显示记录数
     */
    private int pageSize;

    /**
     * 记录当前页码，默认为1
     */
    private int currentPage;

    /**
     * 下一页页码
     */
    private int nextPage;

    /**
     * 上一页页码
     */
    private int previousPage;

    /**
     * 页面显示数据实体集合
     */
    private List<T> entityList;

    /**
     * 构造分页对象并舒适化各项属性
     * 
     * @param totalRecords 总记录数
     * @param pageSize 每页记录数
     * @param currentPage 当前页面
     */
    public Pagination( int totalRecords, int pageSize, int currentPage ) {
        //初始化总页数
        this.totalRecords = totalRecords;
        this.pageSize = pageSize;
        this.totalPages = this.totalRecords / pageSize;
        if( ( this.totalRecords % this.pageSize ) != 0 ) {
            this.totalPages++;
        }
        //修正当前页，初始化前后页码
        this.currentPage = currentPage;
        if( this.currentPage > this.totalPages )
            this.currentPage = this.totalPages;
        else if( this.currentPage < 1 )
            this.currentPage = 1;
        this.previousPage = this.currentPage > 1 ? ( this.currentPage - 1 ) : this.currentPage;
        this.nextPage = this.currentPage < this.totalPages ? ( this.currentPage + 1 ) : this.currentPage;
    }

    /**
     * 获取当前页数
     * 
     * @return 返回当前页数
     */
    public int getCurrentPage() {
        return currentPage;
    }

    /**
     * @return the totalRecords
     */
    public int getTotalRecords() {
        return totalRecords;
    }

    /**
     * @return the totalPages
     */
    public int getTotalPages() {
        return totalPages;
    }

    /**
     * @return the pageSize
     */
    public int getPageSize() {
        return pageSize;
    }

    /**
     * @return the nextPage
     */
    public int getNextPage() {
        return nextPage;
    }

    /**
     * @return the previousPage
     */
    public int getPreviousPage() {
        return previousPage;
    }

    /**
     * @return the entityList
     */
    public List<T> getEntityList() {
        return entityList;
    }

    /**
     * @param entityList the entityList to set
     */
    public void setEntityList( List<T> entityList ) {
        this.entityList = entityList;
    }
}
