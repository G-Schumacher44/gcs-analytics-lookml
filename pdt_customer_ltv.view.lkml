view: pdt_customer_ltv {
  derived_table: {
    sql: SELECT
           customer_id,
           total_spent,
           total_refunded,
           net_clv,
           order_count,
           return_count,
           avg_order_value,
           first_order_date,
           last_order_date,
           days_since_last_order,
           customer_segment,
           predicted_clv_bucket,
           actual_clv_bucket
         FROM `acme-analytics.silver.int_customer_lifetime_value`
         WHERE ingest_dt = (SELECT MAX(ingest_dt) FROM `acme-analytics.silver.int_customer_lifetime_value`) ;;
    sql_trigger_value: SELECT DATE(MAX(ingest_dt)) FROM `acme-analytics.silver.int_customer_lifetime_value` ;;
  }

  dimension: customer_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: customer_segment {
    type: string
    sql: ${TABLE}.customer_segment ;;
  }

  dimension: predicted_clv_bucket {
    type: string
    sql: ${TABLE}.predicted_clv_bucket ;;
  }

  dimension: actual_clv_bucket {
    type: string
    sql: ${TABLE}.actual_clv_bucket ;;
  }

  dimension: days_since_last_order {
    type: number
    sql: ${TABLE}.days_since_last_order ;;
  }

  dimension_group: first_order {
    type: time
    timeframes: [date, month, year]
    datatype: date
    sql: ${TABLE}.first_order_date ;;
  }

  dimension_group: last_order {
    type: time
    timeframes: [date, month, year]
    datatype: date
    sql: ${TABLE}.last_order_date ;;
  }

  measure: total_customers {
    type: count_distinct
    sql: ${customer_id} ;;
  }

  measure: avg_net_clv {
    type: average
    sql: ${TABLE}.net_clv ;;
    value_format: "$#,##0.00"
  }

  measure: avg_order_value {
    type: average
    sql: ${TABLE}.avg_order_value ;;
    value_format: "$#,##0.00"
  }

  measure: total_net_clv {
    type: sum
    sql: ${TABLE}.net_clv ;;
    value_format: "$#,##0.00"
  }
}
