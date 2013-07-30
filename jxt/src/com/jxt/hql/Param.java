package com.jxt.hql;

/**
 * 封装单个参数,作为map中单个键值对的扩展
 * 
 * @author cyc
 * @version $Revision: 415 $
 * @since $Date: 2010-08-01 16:22:14 +0800 (Sat, 01 Aug 2009) $
 */
public class Param
{
    /**
     * 该参数在hql中是否为or关系
     */
    private boolean isOR = false;
    private String name;
    private Object value;

    public Param( String name, Object value )
    {
        this.name = name;
        this.value = value;
    }

    public Param( boolean isOR, String name, Object value )
    {
        this.isOR = isOR;
        this.name = name;
        this.value = value;
    }

    /**
     * @return the isOR
     */
    public boolean getIsOR()
    {
        return isOR;
    }

    /**
     * @return the name
     */
    public String getName()
    {
        return name;
    }

    /**
     * @return the value
     */
    public Object getValue()
    {
        return value;
    }
}
