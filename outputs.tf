output "capacity_reservations_id" {
  description = "Map of id values across all capacity_reservations, keyed the same as var.capacity_reservations"
  value       = { for k, v in azurerm_capacity_reservation.capacity_reservations : k => v.id if v.id != null && length(v.id) > 0 }
}
output "capacity_reservations_capacity_reservation_group_id" {
  description = "Map of capacity_reservation_group_id values across all capacity_reservations, keyed the same as var.capacity_reservations"
  value       = { for k, v in azurerm_capacity_reservation.capacity_reservations : k => v.capacity_reservation_group_id if v.capacity_reservation_group_id != null && length(v.capacity_reservation_group_id) > 0 }
}
output "capacity_reservations_name" {
  description = "Map of name values across all capacity_reservations, keyed the same as var.capacity_reservations"
  value       = { for k, v in azurerm_capacity_reservation.capacity_reservations : k => v.name if v.name != null && length(v.name) > 0 }
}
output "capacity_reservations_sku" {
  description = "Map of sku values across all capacity_reservations, keyed the same as var.capacity_reservations"
  value       = { for k, v in azurerm_capacity_reservation.capacity_reservations : k => one(v.sku) if v.sku != null && length(v.sku) > 0 }
}
output "capacity_reservations_tags" {
  description = "Map of tags values across all capacity_reservations, keyed the same as var.capacity_reservations"
  value       = { for k, v in azurerm_capacity_reservation.capacity_reservations : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "capacity_reservations_zone" {
  description = "Map of zone values across all capacity_reservations, keyed the same as var.capacity_reservations"
  value       = { for k, v in azurerm_capacity_reservation.capacity_reservations : k => v.zone if v.zone != null && length(v.zone) > 0 }
}

