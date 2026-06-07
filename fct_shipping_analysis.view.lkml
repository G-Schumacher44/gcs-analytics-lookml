view: fct_shipping_analysis {
  sql_table_name: `acme-analytics.gold_marts.fct_shipping_analysis` ;;

  dimension_group: order {
    type: time
    timeframes: [date, week, month, quarter, year]
    datatype: date
    sql: ${TABLE}.order_date ;;
  }

  dimension: order_channel {
    type: string
    sql: ${TABLE}.order_channel ;;
  }

  dimension: shipping_speed {
    type: string
    sql: ${TABLE}.shipping_speed ;;
  }

  measure: total_orders {
    type: sum
    sql: ${TABLE}.orders ;;
  }

  measure: total_shipping_revenue {
    type: sum
    sql: ${TABLE}.shipping_revenue ;;
    value_format: "$#,##0.00"
  }

  measure: total_shipping_cost {
    type: sum
    sql: ${TABLE}.shipping_cost ;;
    value_format: "$#,##0.00"
  }

  measure: total_shipping_margin {
    type: sum
    sql: ${TABLE}.shipping_margin ;;
    value_format: "$#,##0.00"
  }

  measure: avg_shipping_margin_pct {
    type: average
    sql: ${TABLE}.shipping_margin_pct ;;
    value_format: "0.0%"
  }
}
