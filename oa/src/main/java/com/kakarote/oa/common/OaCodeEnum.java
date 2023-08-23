package com.kakarote.oa.common;

import com.kakarote.core.common.ResultCode;

public enum OaCodeEnum implements ResultCode {

    /**
     * 列表
     * */
    OA_CODE_ENUM(500,""),
    EVENT_ALREADY_DELETE(501,"Agenda deleted"),
    EXAMINE_END_TIME_IS_EARLIER_THAN_START_TIME(502,"Approval end time is earlier than start time"),
    TRAVEL_END_TIME_IS_EARLIER_THAN_START_TIME(503,"The travel end time is earlier than the start time"),
    THE_APPROVAL_FLOW_HAS_BEEN_DISABLED_OR_DELETED(504,"The approval flow has been deactivated or deleted"),
    DURATION_MUST_BE_THREE_DIGITS(505,"Duration must be three digits"),
    CURRENT_USER_DOES_NOT_HAVE_APPROVAL_AUTHORITY(506,"The current user does not have approval authority"),
    THE_NAME_OF_THE_CUSTOM_FORM_CANNOT_BE_REPEATED(507,"Custom form name cannot be repeated"),
    SYSTEM_EXAMINE_CAN_NOT_MODIFY(508,"System approval type currently does not support editing"),
    LOG_ALREADY_DELETE(509,"Log deleted"),
    ANNOUNCEMENT_ALREADY_DELETE(510,"Announcement deleted"),
    EXAMINE_ALREADY_DELETE(511,"Approval deleted"),
    TOTAL_REIMBURSEMENT_ERROR(512,"Please complete the details!"),
    TOTAL_AMOUNT_OF_EXPENSE_DETAILS_ERROR(513,"The total reimbursement expense details (%s) should be greater than zero")
    ;

    OaCodeEnum(int code, String msg) {
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
