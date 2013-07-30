package com.jxt.hql;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * hql工具类 约定:1.所有的hql关键字约定为小写; 2.所有的比较操作写法均为字段名在前而绑定变量在后;
 * 3.in和括号不要连在一起写,中间要留有空格;
 * 
 * @author $Author: userName $
 * @version $Revision: 415 $
 * @since $Date: 2010-08-01 16:22:14 +0800 (Sat, 01 Aug 2009) $
 */
public class HqlUtil {
	private static final String reg_join = "J:\\w++\\{[^}]++\\}";
	private static final String reg_order = "O:\\w++\\{[^}]++\\}";
	//private static final String reg_param = ":\\w++";
    /**
     * 处理hql进行空值参数处理并返回hql以及绑定变量列表的句柄
     * 
     * @param hql hibernate's sql
     * @param Params 参数集合
     * @param properties 传入一个new HashMap<String,Object>()的引用即可,用于获取hql绑定变量列表
     * @return 对空值参数处理后的hql
     * @author cyc
     */
    public static String doHql( String hql, HqlParams properties ) {
    	if(hql==null || hql.trim().isEmpty())
    		return hql;
    	hql = hql.replaceAll("\\s{2,}", " ");
        for ( Param param : properties.getParams() ) {
            if( null == param.getValue() ) {
                if( hql.indexOf( " between " ) != -1 )
                    hql = doHqlBetween( hql, param );
                if( hql.indexOf( " like " ) != -1 )
                    hql = doHqlLike( hql, param );
                if( hql.indexOf( " in " ) != -1 )
                    hql = doHqlIn( hql, param );
                hql = doHqlNormal( hql, param );
            }else{
            	hql = doHqlJoin(hql,param);
            	hql = doHqlOrder(hql,param);
            }
        }
        hql = trimTags( hql );
        return hql;
    }
    
    private static String doHqlJoin( String hql, Param param ){
    	String regex = "J:(\\w++)\\{([^}]++)\\}";
        Matcher m = Pattern.compile( regex ).matcher( hql );
        Boolean b = Boolean.valueOf(param.getValue().toString());
        while ( m.find() ) {
            if( m.group( 1 ).equals( param.getName() ) ){
            	if(b){
            		hql = hql.replace( m.group( 0 ), m.group( 2 ) );
            	}else{
            		hql = hql.replace( m.group( 0 ), "" );
            	}
            }
                
        }
        return hql;
    }
    
    private static String doHqlOrder( String hql, Param param ){
    	String regex = "O:(\\w++)\\{([^}]++)\\}";
        Matcher m = Pattern.compile( regex ).matcher( hql );
        while ( m.find() ) {
            if( m.group( 1 ).equals( param.getName() ) ){
            	String orderDirection = param.getValue().toString().toLowerCase().equals(HqlParams.DESC)?HqlParams.DESC:HqlParams.ASC;
            	
            	hql = hql.replace( m.group( 0 ), m.group( 2 )+ " " +orderDirection + ",");
            }
        }
        return hql;
    }
    
    private static String trimTags(String hql){
    	hql = hql.replaceAll(reg_join, "");
    	hql = hql.replaceAll(reg_order, "");
    	hql = hql.trim();
    	hql = hql.replaceFirst(",$", "");
    	Matcher m = Pattern.compile( "order by\\s*$" ).matcher( hql );
        if ( m.find() ) {
    		hql = hql.substring(0,hql.indexOf("order by"));
    	}
    	return hql.trim().replaceAll("\\s{2,}", " ");
    }

    /**
     * 对hql中的between进行空值处理
     * 
     * @param hql hibernate's sql
     * @param param 参数
     * @return 一般空值处理后的hql
     * @author cyc
     */
    private static String doHqlBetween( String hql, Param param ) {
        String regex = "\\s+between\\s+((:|\\w)+)\\s+and\\s+((:|\\w)+)\\b";
        Matcher m = Pattern.compile( regex ).matcher( hql );
        while ( m.find() ) {
            if( m.group( 1 ).equals( ":" + param.getName() ) )
                hql = hql.replace( m.group( 0 ), "<=" + m.group( 3 ) );
            else if( m.group( 3 ).equals( ":" + param.getName() ) )
                hql = hql.replace( m.group( 0 ), ">=" + m.group( 1 ) );
        }
        return hql;
    }

    /**
     * 对hql进行一般空值处理
     * 
     * @param hql hibernate's sql
     * @param param 参数
     * @return 一般空值处理后的hql
     * @author cyc
     */
    private static String doHqlNormal( String hql, Param param ) {
        String regex = "(\\w|\\.)+\\s*[<>=!]{1,2}\\s*:" + param.getName() + "\\b";
        return hql = hql.replaceAll( regex, param.getIsOR() ? "1<>1" : "1=1" );
    }

    /**
     * 对hql进行like空值处理
     * 
     * @param hql hibernate's sql
     * @param param 参数
     * @return 对like空值处理后的hql
     * @author cyc
     */
    private static String doHqlLike( String hql, Param param ) {
        String regex = "(\\w|\\.)+\\s+(not\\s+)?like\\s+:" + param.getName() + "\\b";
        return hql = hql.replaceAll( regex, param.getIsOR() ? "1<>1" : "1=1" );
    }

    /**
     * 对hql进行in空值处理
     * 
     * @param hql hibernate's sql
     * @param param 参数
     * @return 对in空值处理后的hql
     * @author cyc
     */
    private static String doHqlIn( String hql, Param param ) {
        String regex = "(\\w|\\.)+\\s+(not\\s+)?in\\s*\\(\\s*:" + param.getName() + "\\s*\\)";
        return hql = hql.replaceAll( regex, param.getIsOR() ? "1<>1" : "1=1" );
    }

    /**
     * 根据hql生成countHql
     * 
     * @param hql
     * @return countHql
     * @author cyc
     */
    public static String generateCountHql( String hql ) {
        String header = "select count(*) ";
        String where = hql.substring( hql.indexOf( "from" ) ).replaceAll( "\\s+order\\s+by.+$", "" );
        return header + where;
    }

        public static void main( String[] args )
        {
            String hql = "select a from Admin as a J:joinRole{left join fetch a.role} where a.id=:id and a.email=:email order by O:orderName{a.name} O:orderCreate{a.create}";
            HqlParams params = new HqlParams();
            params.add( new Param( "end", null ) );
            params.add( new Param( "aa", null ) );
            params.add( new Param( true, "name", null ) );
            params.add( new Param( true, "id", null ) );
            //params.add( new Param( "joinRole", HqlParams.FALSE ) );
            //params.add( new Param( "orderName", HqlParams.ASC ) );
            //params.add( new Param( "orderCreate", HqlParams.DESC ) );
            hql = HqlUtil.doHql( hql, params );
            System.out.println( hql );
            System.out.println( generateCountHql( hql ) );
        }
}
