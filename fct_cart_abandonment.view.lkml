view: fct_cart_abandonment {
  sql_table_name: `acme-analytics.gold_marts.fct_cart_abandonment` ;;

  dimension_group: cart {
    type: time
    timeframes: [date, week, month, quarter, year]
    datatype: date
    sql: ${TABLE}.cart_date ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  measure: total_carts {
    type: sum
    sql: ${TABLE}.total_carts ;;
  }

  measure: total_abandoned_carts {
    type: sum
    sql: ${TABLE}.abandoned_carts ;;
  }

  measure: total_converted_carts {
    type: sum
    sql: ${TABLE}.converted_carts ;;
  }

  measure: avg_conversion_rate {
    type: average
    sql: ${TABLE}.conversion_rate ;;
    value_format: "0.0%"
  }

  measure: total_abandoned_value {
    type: sum
    sql: ${TABLE}.abandoned_value ;;
    value_format: "$#,##0.00"
  }

  measure: avg_time_to_purchase_hours {
    type: average
    sql: ${TABLE}.avg_time_to_purchase_hours ;;
  }
}
