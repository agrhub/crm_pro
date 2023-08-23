package com.kakarote.core.common;

/**
 * @author zhangzhiwei
 * 系统响应错误代码枚举类
 */

public enum SystemCodeEnum implements ResultCode {
    //系统响应成功
    SYSTEM_OK(0, "success"),
    //未捕获的错误
    SYSTEM_ERROR(500, "Network error, please try again later"),

    SYSTEM_NOT_LOGIN(302, "Please log in first！"),
    //拒绝访问
    SYSTEM_BAD_REQUEST(403, "Request frequency is too fast, please try again later"),
    //无权访问
    SYSTEM_NO_AUTH(401, "Permission denied"),
    //资源未找到
    SYSTEM_NO_FOUND(404, "Resource not found"),
    //资源未找到
    SYSTEM_NO_VALID(400, "Parameter validation error"),
    //请求方式错误
    SYSTEM_METHOD_ERROR(405, "Wrong request"),
    //请求超时
    SYSTEM_REQUEST_TIMEOUT(408, "Request timed out"),
    //服务调用异常
    SYSTEM_SERVER_ERROR(1001, "Service call exception"),
    //企业信息已到期
    SYSTEM_NO_SUCH_PARAMENT_ERROR(1003, "Parameter does not exist!"),
    //上传文件失败
    SYSTEM_UPLOAD_FILE_ERROR(1004, "File upload failed!"),
    ;

    SystemCodeEnum(int code, String msg) {
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

    public static SystemCodeEnum parse(Integer status) {
        for (SystemCodeEnum value : values()) {
            if (value.getCode() == status) {
                return value;
            }
        }
        return SystemCodeEnum.SYSTEM_ERROR;
    }
}
