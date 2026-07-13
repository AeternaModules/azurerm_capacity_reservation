variable "capacity_reservations" {
  description = <<EOT
Map of capacity_reservations, attributes below
Required:
    - capacity_reservation_group_id
    - name
    - sku (block):
        - capacity (required)
        - name (required)
Optional:
    - tags
    - zone
EOT

  type = map(object({
    capacity_reservation_group_id = string
    name                          = string
    tags                          = optional(map(string))
    zone                          = optional(string)
    sku = object({
      capacity = number
      name     = string
    })
  }))
  validation {
    condition = alltrue([
      for k, v in var.capacity_reservations : (
        v.zone == null || (length(v.zone) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.capacity_reservations : (
        length(v.sku.name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.capacity_reservations : (
        v.sku.capacity >= 0
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.capacity_reservations : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 6 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

