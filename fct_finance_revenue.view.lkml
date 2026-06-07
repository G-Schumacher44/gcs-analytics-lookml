view: fct_finance_revenue {
  sql_table_name: `acme-analytics.gold_marts.fct_finance_revenue` ;;

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
}
