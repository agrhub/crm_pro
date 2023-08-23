package com.kakarote.work.common;

import com.kakarote.core.common.ResultCode;

public enum WorkCodeEnum implements ResultCode {
    WORK_CREATE_USER_EXIT_ERROR(3001,"The project creator cannot exit"),
    WORK_EXIST_ERROR(3002,"Item does not exist"),
    WORK_USER_EXIST_ERROR(3003,"Participant does not exist"),
    WORK_TASK_LABEL_EXIST_ERROR(3004,"Task does not use this tag"),
    WORK_TASK_DELETE_ERROR(3005,"Task has been deleted"),
    WORK_TASK_EXIST_ERROR(3006,"Task does not exist"),
    WORK_AUTH_ERROR(3007,"No access"),
    WORK_LABEL_DELETE_ERROR(3008,"The label in use cannot be deleted"),
    WORK_TASK_IN_TRASH_ERROR(3009,"Task is not in the recycle bin")
    ;

    WorkCodeEnum(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    private int code;
    private String msg;

    @Override
    public int getCode() {
        return code;
    }

    @Override
    public String getMsg() {
        return msg;
    }
}
