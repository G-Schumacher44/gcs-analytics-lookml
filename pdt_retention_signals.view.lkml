view: pdt_retention_signals {
  derived_table: {
    sql: SELECT
           customer_id,
           email,
           first_name,
           last_name,
           customer_status,
           loyalty_tier,
           clv_bucket,
           last_purchase_date,
           total_orders,
           marketing_opt_in,
           days_since_last_order
         FROM `gcs-automation-project.silver.int_customer_retention_signals`
         WHERE snapshot_dt = (SELECT MAX(snapshot_dt) FROM `gcs-automation-project.silver.int_customer_retention_signals`) ;;
    sql_trigger_value: SELECT CURRENT_DATE() ;;
  }

  # Built for a Q4 2024 churn-prediction initiative that never shipped to BI.
  # Rebuilds daily off the full retention snapshot — ~520GB scanned per run.
  # No explore references this view. Zero queries in System Activity since creation.
  # Kill candidate: ~$156/mo at $5/TB, zero business value delivered.

  dimension: customer_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: customer_status {
    type: string
    sql: ${TABLE}.customer_status ;;
  }

  dimension: loyalty_tier {
    type: string
    sql: ${TABLE}.loyalty_tier ;;
  }

  dimension: clv_bucket {
    type: string
    sql: ${TABLE}.clv_bucket ;;
  }

  dimension: marketing_opt_in {
    type: yesno
    sql: ${TABLE}.marketing_opt_in ;;
  }

  measure: total_customers {
    type: count_distinct
    sql: ${customer_id} ;;
  }
}
