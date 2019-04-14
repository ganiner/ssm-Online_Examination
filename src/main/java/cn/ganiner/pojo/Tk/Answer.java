package cn.ganiner.pojo.Tk;

public class Answer {
    private  long answer_id;
    private  String answer;
    private long blank_id;

    public long getBlank_id() {
        return blank_id;
    }

    public void setBlank_id(long blank_id) {
        this.blank_id = blank_id;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public long getAnswer_id() {
        return answer_id;
    }

    public void setAnswer_id(long answer_id) {
        this.answer_id = answer_id;
    }
}
