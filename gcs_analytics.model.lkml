connection: "gcs_automation"

include: "*.view"

# Primary BI model — all explores point at gold_marts (clean aggregates, no partitions).

explore: sales_performance {
  label: "Sales Performance"
  join: fct_product_profitability {
    type: left_outer
    sql_on: ${fct_sales_operations.product_id} = ${fct_product_profitability.product_id}
            AND ${fct_sales_operations.order_date} = ${fct_product_profitability.product_date} ;;
    relationship: many_to_one
  }
  from: fct_sales_operations
}

explore: marketing {
  label: "Marketing & Attribution"
  join: fct_cart_abandonment {
    type: left_outer
    sql_on: ${fct_marketing_attribution.metric_date} = ${fct_cart_abandonment.cart_date}
            AND ${fct_marketing_attribution.channel} = ${fct_cart_abandonment.channel} ;;
    relationship: many_to_one
  }
  join: fct_customer_segments {
    type: left_outer
    sql_on: 1=1 ;;
    relationship: many_to_many
  }
  from: fct_marketing_attribution
}

explore: customers {
  label: "Customer Lifetime Value"
  join: fct_customer_segments {
    type: left_outer
    sql_on: ${pdt_customer_ltv.customer_segment} = ${fct_customer_segments.customer_segment} ;;
    relationship: many_to_one
  }
  from: pdt_customer_ltv
}

explore: finance {
  label: "Finance & Revenue"
  join: fct_daily_dashboard {
    type: left_outer
    sql_on: ${fct_finance_revenue.order_date} = ${fct_daily_dashboard.metric_date} ;;
    relationship: many_to_one
  }
  from: fct_finance_revenue
}

explore: shipping {
  label: "Shipping & Logistics"
  from: fct_shipping_analysis
}
