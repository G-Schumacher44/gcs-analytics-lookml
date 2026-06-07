view: silver_inventory {
  sql_table_name: `acme-analytics.silver.int_inventory_risk` ;;

  # Legacy view — pre-dates gold_marts. Used by gcs_legacy.legacy_inventory explore
  # which has had zero queries since gcs_analytics.sales_performance launched.

  dimension: product_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: risk_tier {
    type: string
    sql: ${TABLE}.risk_tier ;;
  }

  measure: total_inventory {
    type: sum
    sql: ${TABLE}.inventory_quantity ;;
  }

  measure: total_locked_capital {
    type: sum
    sql: ${TABLE}.locked_capital ;;
    value_format: "$#,##0.00"
  }

  measure: avg_attention_score {
    type: average
    sql: ${TABLE}.attention_score ;;
    value_format: "0.00"
  }
}
