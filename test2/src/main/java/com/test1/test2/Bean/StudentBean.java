package com.test1.test2.Bean;

public class StudentBean {
    // 定义学生的学号、姓名和考试科目
    private String No;
    private String Name;
    private String Lesson;

    // 默认构造方法
    public StudentBean() {
    }
    // 带参构造方法
    public StudentBean(String no, String name, String lesson) {
        this.No = no;
        this.Name = name;
        this.Lesson = lesson;
    }

    public String getNo() {
        return No;
    }

    public void setNo(String no) {
        this.No = no;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        this.Name = name;
    }

    public String getLesson() {
        return Lesson;
    }

    public void setLesson(String lesson) {
        this.Lesson = lesson;
    }
}
