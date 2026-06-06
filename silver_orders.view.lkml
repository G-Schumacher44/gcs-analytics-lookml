view: silver_orders {
  sql_table_name: `gcs-automation-project.silver.int_attributed_purchases` ;;

  # Legacy view — pre-dates gold_marts. Used by gcs_legacy.legacy_orders explore
  # which has had zero queries since gcs_analytics.finance launched in Q2 2025.

  dimension: order_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: order {
    type: time
    timeframes: [date, week, month]
    datatype: date
    sql: ${TABLE}.order_dt ;;
  }

  dimension: order_channel {
    type: string
    sql: ${TABLE}.order_channel ;;
  }

  dimension: customer_tier {
    type: string
    sql: ${TABLE}.customer_tier ;;
  }

  dimension: payment_method {
    type: string
    sql: ${TABLE}.payment_method ;;
  }

  dimension: is_expedited {
    type: yesno
    sql: ${TABLE}.is_expedited ;;
  }

  measure: total_orders {
    type: count_distinct
    sql: ${order_id} ;;
  }

  measure: total_gross_revenue {
    type: sum
    sql: ${TABLE}.gross_total ;;
    value_format: "$#,##0.00"
  }

  measure: total_net_revenue {
    type: sum
    sql: ${TABLE}.net_total ;;
    value_format: "$#,##0.00"
  }
}
