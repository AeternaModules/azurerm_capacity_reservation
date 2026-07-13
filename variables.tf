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
  # --- Unconfirmed validation candidates, derived from azurerm_capacity_reservation's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    validate.CapacityReservationName: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: capacity_reservation_group_id
  #   source:    [from capacityreservationgroups.ValidateCapacityReservationGroupID] !ok
  # path: capacity_reservation_group_id
  #   source:    [from capacityreservationgroups.ValidateCapacityReservationGroupID] err != nil
  # path: zone
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: sku.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: sku.capacity
  #   condition: value >= 0
  #   message:   must be at least 0
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

