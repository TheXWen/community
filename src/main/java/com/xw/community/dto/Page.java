package com.xw.community.dto;

import java.util.List;

public class Page {
    private Integer pageno;
    private Integer pagesize;
    private List datas;
    private Integer totalsize;
    private Integer totalno;
    private String title;

    public Page(){}

    public Page(Integer pageno, Integer pagesize) {
        if (pageno <= 0){
            this.pageno = 1;
        }else {
            this.pageno = pageno;
        }
        if (pageno <= 0){
            this.pagesize = 5;
        }else {
            this.pagesize = pagesize;
        }
    }

    public List getDatas() {
        return datas;
    }

    public void setDatas(List datas) {
        this.datas = datas;
    }

    public Integer getPageno() {
        return pageno;
    }

    public void setPageno(Integer pageno) {
        this.pageno = pageno;
    }

    public Integer getPagesize() {
        return pagesize;
    }

    public void setPagesize(Integer pagesize) {
        this.pagesize = pagesize;
    }

    public Integer getStartIndex(){
        return (this.pageno - 1) * pagesize;
    }

    public Integer getTotalsize() {
        return totalsize;
    }

    public void setTotalsize(Integer totalsize) {
        this.totalsize = totalsize;
        this.totalno = (totalsize % pagesize) == 0?(totalsize / pagesize):(totalsize / pagesize + 1);
    }

    public Integer getTotalno() {
        return totalno;
    }

    public void setTotalno(Integer totalno) {
        this.totalno = totalno;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
