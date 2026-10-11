resource "google_privateca_ca_pool_iam_binding" "privateca_ca_pool_iam_bindings" {
  for_each = var.privateca_ca_pool_iam_bindings

  ca_pool  = each.value.ca_pool
  members  = each.value.members
  role     = each.value.role
  location = each.value.location
  project  = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

