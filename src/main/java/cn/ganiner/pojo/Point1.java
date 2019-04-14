package cn.ganiner.pojo;


import java.util.List;

public class Point1 {



    private long id;
    //知识点名
    private String pointname;
   private List<Point2> point2;//使用一个List来表示二级目录

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getPointname() {
        return pointname;
    }
    public void setPointname(String pointname) {
        this.pointname = pointname;
    }

    public List<Point2> getPoint2() {
        return point2;
    }

    public void setPoint2(List<Point2> point2) {
        this.point2 = point2;
    }
   @Override
    public String toString() {
        return "Point1 [id=" + id + ", name=" + pointname + "]";
    }

}


