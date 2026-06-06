view: fct_marketing_attribution {
  sql_table_name: `gcs-automation-project.gold_marts.fct_marketing_attribution` ;;

  dimension_group: metric {
    type: time
    timeframes: [date, week, month, quarter, year]
    datatype: date
    sql: ${TABLE}.metric_date ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  measure: total_recovered_orders {
    type: sum
    sql: ${TABLE}.recovered_orders ;;
  }

  measure: total_orders {
    type: sum
    sql: ${TABLE}.total_orders ;;
  }

  measure: total_abandoned_carts {
    type: sum
    sql: ${TABLE}.abandoned_carts ;;
  }

  measure: total_converted_carts {
    type: sum
    sql: ${TABLE}.converted_carts ;;
  }

  measure: total_abandoned_value {
    type: sum
    sql: ${TABLE}.abandoned_value ;;
    value_format: "$#,##0.00"
  }

  measure: avg_time_to_purchase_hours {
    type: average
    sql: ${TABLE}.avg_time_to_purchase_hours ;;
    value_format: "0.0"
  }

  measure: total_at_risk_customers {
    type: sum
    sql: ${TABLE}.at_risk_customers ;;
  }
}
