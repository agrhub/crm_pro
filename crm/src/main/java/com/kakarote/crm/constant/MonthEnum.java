package com.kakarote.crm.constant;

/**
 * @author hmb
 */

public enum MonthEnum {
    /** 一月 */
    JANUARY("january","January","01"),
    /** 二月 */
    FEBRUARY("february","February","02"),
    /** 三月 */
    MARCH("march","March","03"),
    /** 四月 */
    APRIL("april","April","04"),
    /** 五月 */
    MAY("may","May","05"),
    /** 六月 */
    JUNE("june","June","06"),
    /** 七月 */
    JULY("july","July","07"),
    /** 八月 */
    AUGUST("august","August","08"),
    /** 九月 */
    SEPTEMBER("september","September","09"),
    /** 十月 */
    OCTOBER("october","October","10"),
    /** 十一月 */
    NOVEMBER("november","November","11"),
    /** 十二月 */
    DECEMBER("december","December","12");

    MonthEnum(String name, String remark, String value){
        this.name = name;
        this.remark = remark;
        this.value = value;
    }

    public String getName(){
        return name;
    }

    public String getRemark(){
        return remark;
    }

    public String getValue(){
        return value;
    }

    private String name;
    private String remark;
    private String value;

    public static String valueOf(int mouth){
        String mouthe=mouth>=10?(mouth+""):("0"+mouth);
        for (MonthEnum monthEnum:MonthEnum.values()){
            if(monthEnum.getValue().equals(mouthe)){
                return monthEnum.getName();
            }
        }
        return null;
    }

}
