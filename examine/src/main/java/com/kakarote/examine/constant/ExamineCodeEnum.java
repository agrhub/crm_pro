package com.kakarote.examine.constant;

import com.kakarote.core.common.ResultCode;

/**
 * 审批错误枚举
 * 4200-4300
 */
public enum ExamineCodeEnum implements ResultCode {

    /**
     * 列表
     * */
    EXAMINE_START_ERROR(4200,"Only one approval process is enabled"),
    EXAMINE_RECHECK_PASS_ERROR(4201, "The review has passed and cannot be withdrawn"),
    EXAMINE_AUTH_ERROR(4202, "The review has passed and cannot be withdrawn"),
    EXAMINE_ROLE_NO_USER_ERROR(4203, "No person is detected under the selected role, please verify!"),
    EXAMINE_NAME_NO_USER_ERROR(4204, "Duplicate approval flow name, please verify!"),
    ;

    ExamineCodeEnum(int code, String msg) {
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
