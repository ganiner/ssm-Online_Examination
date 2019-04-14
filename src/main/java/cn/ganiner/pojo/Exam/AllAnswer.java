package cn.ganiner.pojo.Exam;

public class AllAnswer {
    private long id;
   private long studentid;
   private long examid;
   private String stuanswer;
 private  String examname;
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getStudentid() {
        return studentid;
    }

    public void setStudentid(long studentid) {
        this.studentid = studentid;
    }

    public long getExamid() {
        return examid;
    }

    public void setExamid(long examid) {
        this.examid = examid;
    }

    public String getStuanswer() {
        return stuanswer;
    }

    public void setStuanswer(String stuanswer) {
        this.stuanswer = stuanswer;
    }


    public String getExamname() {
        return examname;
    }

    public void setExamname(String examname) {
        this.examname = examname;
    }
}
