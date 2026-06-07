view: orphaned_demand_forecast {
  sql_table_name: `acme-analytics.gold_marts.fct_demand_forecast` ;;

  # Built in anticipation of a demand-forecasting model (Q1 2025 initiative).
  # The BQ table was never created — the forecasting project was descoped.
  # This view is structurally orphaned (no explore references it) and the
  # underlying table does not exist in the warehouse.

  dimension: product_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.product_id ;;
  }

  dimension_group: forecast {
    type: time
    timeframes: [date, week, month]
    datatype: date
    sql: ${TABLE}.forecast_date ;;
  }

  dimension: forecast_horizon_days {
    type: number
    sql: ${TABLE}.forecast_horizon_days ;;
  }

  measure: total_forecasted_units {
    type: sum
    sql: ${TABLE}.forecasted_units ;;
  }

  measure: avg_forecast_confidence {
    type: average
    sql: ${TABLE}.confidence_score ;;
    value_format: "0.0%"
  }
}
