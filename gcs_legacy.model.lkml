connection: "gcs_automation"

include: "*.view"

# LEGACY — superseded by gcs_analytics.model. These explores pointed directly at
# silver intermediates before the gold_marts layer existed. Zero queries since
# gold_marts launched in Q2 2025. Candidate for deletion.

explore: legacy_orders {
  label: "Orders (Legacy Silver)"
  from: silver_orders
}

explore: legacy_inventory {
  label: "Inventory Risk (Legacy Silver)"
  from: silver_inventory
}
