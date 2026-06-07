view: fct_product_profitability {
  sql_table_name: `acme-analytics.gold_marts.fct_product_profitability` ;;

  dimension: product_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.product_id ;;
  }

  dimension_group: product {
    type: time
    timeframes: [date, week, month, quarter, year]
    datatype: date
    sql: ${TABLE}.product_date ;;
  }

  measure: total_units_sold {
    type: sum
    sql: ${TABLE}.units_sold ;;
  }

  measure: total_units_returned {
    type: sum
    sql: ${TABLE}.units_returned ;;
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

  measure: total_gross_profit {
    type: sum
    sql: ${TABLE}.gross_profit ;;
    value_format: "$#,##0.00"
  }

  measure: avg_net_margin {
    type: average
    sql: ${TABLE}.net_margin ;;
    value_format: "0.0%"
  }

  measure: avg_return_rate {
    type: average
    sql: ${TABLE}.return_rate ;;
    value_format: "0.0%"
  }

  measure: avg_margin_pct {
    type: average
    sql: ${TABLE}.margin_pct ;;
    value_format: "0.0%"
  }
}
