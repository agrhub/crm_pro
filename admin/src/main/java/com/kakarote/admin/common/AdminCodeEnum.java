package com.kakarote.admin.common;

import com.kakarote.core.common.ResultCode;

/**
 * @author zhangzhiwei
 * 管理后台响应错误代码枚举类
 */

public enum AdminCodeEnum implements ResultCode {
    //客户模块管理
    ADMIN_MODULE_CLOSE_ERROR(1101, "Customer management module cannot be closed"),
    ADMIN_DATA_EXIST_ERROR(1102, "Data does not exist"),
    ADMIN_PARENT_USER_NOTNULL_ERROR(1105, "Please set the user directly to the superior"),
    ADMIN_PASSWORD_INTENSITY_ERROR(1106, "The password must consist of 6-20 letters and numbers"),
    ADMIN_USER_EXIST_ERROR(1107, "User already exists!"),
    ADMIN_PARENT_USER_ERROR(1109, "Subordinates of this user cannot be set as direct superiors!"),
    ADMIN_PARENT_DEPT_ERROR(1110, "Subordinates of this department cannot be set as direct departments!"),
    ADMIN_DEPT_REMOVE_EXIST_USER_ERROR(1111, "There are employees in this department and cannot be deleted!"),
    ADMIN_DEPT_REMOVE_EXIST_DEPT_ERROR(1112, "There are subordinate departments under this department, which cannot be deleted!"),
    ADMIN_USER_NOT_ROLE_ERROR(1113, "Please set the role for the user first"),
    ADMIN_USER_NOT_DEPT_ERROR(1114, "Please set the department for the user first"),
    ADMIN_USER_NOT_PARENT_ERROR(1115, "Please set the user directly to the superior"),
    ADMIN_SUPER_USER_DISABLED_ERROR(1116, "Super administrator users cannot disable"),
    ADMIN_ROLE_NAME_EXIST_ERROR(1117, "Role name already exists"),
    ADMIN_PHONE_CODE_ERROR(1118, "Phone verification code error!"),
    ADMIN_PHONE_REGISTER_ERROR(1119, "The phone number has been registered!"),
    ADMIN_PHONE_VERIFY_ERROR(1120, "Mobile phone number verification error!"),
    ADMIN_PHONE_EXIST_ERROR(1121, "The phone number does not exist!"),
    ADMIN_SMS_SEND_FREQUENCY_ERROR(1122, "SMS sending frequency is too high, please try again later!"),
    ADMIN_SMS_SEND_ERROR(1123, "Failed to send verification code, please try again later!"),
    ADMIN_MANAGE_UPDATE_ERROR(1124, "The super administrator account needs to go to Personal Center to modify the phone number information!"),
    ADMIN_USER_NOT_EXIST_ERROR(1125, "User does not exist!"),
    ADMIN_ACCOUNT_ERROR(1126, "The account cannot be the same as the original account!"),
    ADMIN_PASSWORD_ERROR(1127, "Incorrect password!"),
    ADMIN_USERNAME_EDIT_ERROR(1128, "User name cannot be modified!"),
    ADMIN_USER_HIS_TABLE_ERROR(1129, "The number of users has reached the upper limit!"),
    ADMIN_PARENT_USER_ERROR1(1130, "Direct superiors cannot do it for themselves!"),
    ADMIN_PRODUCT_DATA_ERROR(1131, "The product does not exist!"),
    ADMIN_MARKETING_DATA_ERROR(1132, "Not enough points!"),
    ADMIN_USER_NEEDS_AT_LEAST_ONE_ROLE(1133, "The user needs at least one role!"),
    ADMIN_PASSWORD_EXPIRE_ERROR(1134, "Password verification has expired, please re-verify!"),
    ADMIN_PASSWORD_INVALID_ERROR(1135, "Invalid password!"),
    ADMIN_ROLE_NOT_EXIST_ERROR(1136, "Please associate roles first!"),
    ADMIN_LANGUAGE_PACK_NAME_ERROR(1137, "The language pack name is wrong!"),
    ADMIN_LANGUAGE_PACK_EXIST_USER_ERROR(1138, "This language pack is currently being used by users and cannot be deleted!"),
    ADMIN_LANGUAGE_PACK_CHOINESE_ERROR(1139, "Language pack is missing!"),
    ;

    AdminCodeEnum(int code, String msg) {
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
