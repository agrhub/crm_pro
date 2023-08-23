package com.kakarote.authorization.common;

import com.kakarote.core.common.ResultCode;

/**
 * @author zhangzhiwei
 * 权限后台响应错误代码枚举类
 */

public enum AuthorizationCodeEnum implements ResultCode {
    //系统响应成功
    AUTHORIZATION_LOGIN(1001, "Please log in first"),
    AUTHORIZATION_USERNAME_REQUIRED(1002, "Please enter user name"),
    AUTHORIZATION_PASSWORD_REQUIRED(1003, "Please enter the password or SMS verification code"),
    AUTHORIZATION_LOGIN_NO_USER(1004, "Incorrect username or password"),
    AUTHORIZATION_LOGIN_ERR(1005, "Login authentication failed"),
    AUTHORIZATION_COMPANY_NOT_EXIST(1006, "The enterprise was not found!"),
    AUTHORIZATION_USER_DISABLE_ERROR(1007, "Account is disabled!"),
    AUTHORIZATION_USER_SMS_CODE_ERROR(1008, "Verification code error!"),
    AUTHORIZATION_USER_DOES_NOT_EXIST(1009, "User does not exist, please register first！"),
    AUTHORIZATION_LOGIN_PASSWORD_TO_MANY_ERROR(1010, "Too many incorrect passwords, please try again after s%！");


    AuthorizationCodeEnum(int code, String msg) {
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
