variable "privateca_ca_pool_iam_bindings" {
  description = <<EOT
Map of privateca_ca_pool_iam_bindings, attributes below
Required:
    - ca_pool
    - members
    - role
Optional:
    - location
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    ca_pool  = string
    members  = set(string)
    role     = string
    location = optional(string)
    project  = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

