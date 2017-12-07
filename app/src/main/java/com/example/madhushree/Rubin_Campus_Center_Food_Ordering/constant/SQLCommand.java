/**
 * SQL commands
 * Including select/delete/update/insert
 */
package com.example.madhushree.Rubin_Campus_Center_Food_Ordering.constant;

public abstract class SQLCommand
{
    //query all students
    public static String QUERY_1 = "select cust_pwd from customer where cust_id=?";

    public static String QUERY_2 = "select Event_ID as _id, Event_Name as event_name from Event";

    public static String QUERY_3 = "select F.f_id as _id, f_name as _name, F.f_price, OD.qtyord" +
            " from Food F, order_details OD " +
            "where F.f_id = OD.f_id " +
            "and F.f_id = ?";
}

