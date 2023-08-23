package com.kakarote.core.common.log;

public enum BehaviorEnum {

    /**
     * 操作记录行为
     */
    SAVE(1, "New"),
    UPDATE(2, "Update"),
    DELETE(3, "Delete"),
    CHANGE_OWNER(4, "Change owner"),
    TRANSFER(5, "Transfer"),
    EXCEL_IMPORT(6, "Import"),
    EXCEL_EXPORT(7, "Export"),
    PUT_IN_POOL(8, "Put in pool"),
    RECEIVE(9, "Receive"),
    DISTRIBUTE(10, "Distribute"),
    LOCK(11, "Lock"),
    UNLOCK(12, "Unlock"),
    CHANGE_DEAL_STATUS(13, "Change deal status"),
    ADD_MEMBER(14, "Add member"),
    UPDATE_MEMBER(15, "Update member"),
    REMOVE_MEMBER(16, "Remove member"),
    EXIT_MEMBER(17, "Exit the team"),
    UPLOAD(18, "Upload"),
    UPDATE_BUSINESS_STATUS(19, "Update business status"),
    SUBMIT_EXAMINE(20, "Submit examine"),
    CANCEL_EXAMINE(21, "Cancel examine"),
    PUT_ON_SALE(22, "On shelve"),
    PUT_OFF_SALE(23, "Off shelve"),
    START(24, "Enable"),
    STOP(25, "Disable"),
    FOLLOW_UP(26, "Pollow up"),
    PASS_EXAMINE(27, "Pass examine"),
    REJECT_EXAMINE(28, "Reject examine"),
    RECHECK_EXAMINE(29, "Withdraw examine"),
    ARCHIVE(30, "Archive"),
    RESTORE(31, "Restore"),
    EXIT(32, "Exit"),
    ACTIVE(33, "Activation"),
    CLEAN(34, "Remove completely"),
    FORBID(35, "Disable"),
    RESET(36, "Reset"),
    COPY(37, "Copy"),
    RELATE(38, "Related"),
    UNBINDING(39, "Unrelated"),
    NULL(0, "null");

    private int type;
    private String name;

    BehaviorEnum(int type, String name) {
        this.type = type;
        this.name = name;
    }

    public int getType() {
        return type;
    }

    public String getName() {
        return name;
    }

    public static BehaviorEnum parse(int type) {
        for (BehaviorEnum Enum : BehaviorEnum.values()) {
            if (Enum.getType() == type) {
                return Enum;
            }
        }
        return NULL;
    }
}
