package cn.ganiner.pojo.Exam;

public class PaperChoice {
    private Long id;
    private String content;
    private String aoption;
    private String boption;
    private String coption;
    private String doption;
    private String answer;
   private int difficulty;
    private int examid;
  private  String myanswer;

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String getDoption() {
        return doption;
    }

    public void setDoption(String doption) {
        this.doption = doption;
    }

    public String getCoption() {
        return coption;
    }

    public void setCoption(String coption) {
        this.coption = coption;
    }

    public String getBoption() {
        return boption;
    }

    public void setBoption(String boption) {
        this.boption = boption;
    }

    public String getAoption() {
        return aoption;
    }

    public void setAoption(String aoption) {
        this.aoption = aoption;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getExamid() {
        return examid;
    }

    public void setExamid(int examid) {
        this.examid = examid;
    }

    public String getMyanswer() {
        return myanswer;
    }

    public void setMyanswer(String myanswer) {
        this.myanswer = myanswer;
    }

    public int getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(int difficulty) {
        this.difficulty = difficulty;
    }
}
