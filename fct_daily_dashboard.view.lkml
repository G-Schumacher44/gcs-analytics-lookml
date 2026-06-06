view: fct_daily_dashboard {
  sql_table_name: `gcs-automation-project.gold_marts.fct_daily_dashboard` ;;

  dimension_group: metric {
    type: time
    timeframes: [date, week, month]
    datatype: date
    sql: ${TABLE}.metric_date ;;
  }

  dimension: revenue_anomaly_flag {
    type: yesno
    sql: ${TABLE}.revenue_anomaly_flag ;;
  }

  measure: total_orders {
    type: sum
    sql: ${TABLE}.orders_count ;;
  }

  measure: total_gross_revenue {
    type: sum
    sql: ${TABLE}.gross_revenue ;;
    value_format: "$#,##0.00"
  }

  measure: total_net_revenue {
    type: sum
    sql: ${TABLE}.net_revenue ;;
    value_format: "$#,##0.00"
  }

  measure: avg_order_value {
    type: average
    sql: ${TABLE}.avg_order_value ;;
    value_format: "$#,##0.00"
  }

  measure: avg_cart_conversion_rate {
    type: average
    sql: ${TABLE}.cart_conversion_rate ;;
    value_format: "0.0%"
  }

  measure: total_returns {
    type: sum
    sql: ${TABLE}.returns_count ;;
  }

  measure: avg_return_rate {
    type: average
    sql: ${TABLE}.return_rate ;;
    value_format: "0.0%"
  }

  measure: total_refunds {
    type: sum
    sql: ${TABLE}.refund_total ;;
    value_format: "$#,##0.00"
  }
}
