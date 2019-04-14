package cn.ganiner.pojo;

public class Point2 {
    private Long bid;
    //知识点名
    private String pname;
    private Long aid;
    public Long getAid() {
        return aid;
    }

    public void setAid(Long aid) {
        this.aid = aid;
    }

    public Long getBid() {
        return bid;
    }

    public void setBid(Long bid) {
        this.bid = bid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }
    @Override
    public String toString() {
        return "Point2 [id=" + bid + ", name=" + pname + "]";
    }

}
