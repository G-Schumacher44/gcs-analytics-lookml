view: fct_sales_operations {
  sql_table_name: `gcs-automation-project.gold_marts.fct_sales_operations` ;;

  dimension: product_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.product_id ;;
  }

  dimension_group: order {
    type: time
    timeframes: [date, week, month, quarter, year]
    datatype: date
    sql: ${TABLE}.order_date ;;
  }

  dimension: trend_signal {
    type: string
    sql: ${TABLE}.trend_signal ;;
  }

  dimension: inventory_risk_tier {
    type: string
    sql: ${TABLE}.inventory_risk_tier ;;
  }

  dimension: inventory_quantity {
    type: number
    sql: ${TABLE}.inventory_quantity ;;
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

  measure: avg_sales_velocity_7d {
    type: average
    sql: ${TABLE}.sales_velocity_7d ;;
  }
}
