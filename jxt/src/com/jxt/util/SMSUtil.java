package com.jxt.util;

public class SMSUtil {
    
    //联通号段
    private static String[] lthd = { "130", "131", "132", "155", "156", "185", "186","198" };
    //移动号段
    private static String[] ydhd = { "134", "135", "136", "137", "138", "139", "150", "151", "158", "157", "159", "187", "188","152","182","147" };
    //电信号段
    private static String[] dxhd = { "133", "153", "180", "189" , "181"};
    public static String lthdStr = "'130', '131', '132', '155', '156','185', '186' ,'198'";
    public static String kfsStr="'133','134', '135', '136', '137', '138', '139', '147','150', '151', '152', '153', '154', '158', '157', '159','180', '181','182', '183', '187', '188',  '189'";

    // 获得号码段,1 联通（内） 2 移动 3 电信 4 联通（外） 0 其他
    public static int getMobileOperator(String hm)
    {
        String phoneNum = hm.trim();
        if (isExistStr(lthd, phoneNum) > 0)
        {
            return 1;
        }
        else if (isExistStr(ydhd, phoneNum) > 0)
        {
            return 2;
        }
        else if (isExistStr(dxhd, phoneNum) > 0)
        {
            return 3;
        }
        return 0;//号码段不存在
    }
    
    private static int isExistStr(String[] arr, String str)
    {
        for (int i = 0; i < arr.length; i++)
        {
            if (arr[i].equals(str.substring(0, 3)))
                return 1;
        }
        return 0;
    }
    
    public static void main(String args[]) {
        String s = new String(" 13056072197 ");
        
        System.out.print("运营商为：" + SMSUtil.getMobileOperator(s));
    }
}
