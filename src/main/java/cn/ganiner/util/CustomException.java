package cn.ganiner.util;

public class CustomException extends Exception{

    public String message;

    public CustomException(String message){
        this.message = message;
    }

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}