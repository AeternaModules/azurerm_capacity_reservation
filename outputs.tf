output "capacity_reservations_id" {
  description = "Map of id values across all capacity_reservations, keyed the same as var.capacity_reservations"
  value       = { for k, v in azurerm_capacity_reservation.capacity_reservations : k => v.id }
}
output "capacity_reservations_capacity_reservation_group_id" {
  description = "Map of capacity_reservation_group_id values across all capacity_reservations, keyed the same as var.capacity_reservations"
  value       = { for k, v in azurerm_capacity_reservation.capacity_reservations : k => v.capacity_reservation_group_id }
}
output "capacity_reservations_name" {
  description = "Map of name values across all capacity_reservations, keyed the same as var.capacity_reservations"
  value       = { for k, v in azurerm_capacity_reservation.capacity_reservations : k => v.name }
}
output "capacity_reservations_sku" {
  description = "Map of sku values across all capacity_reservations, keyed the same as var.capacity_reservations"
  value       = { for k, v in azurerm_capacity_reservation.capacity_reservations : k => v.sku }
}
output "capacity_reservations_tags" {
  description = "Map of tags values across all capacity_reservations, keyed the same as var.capacity_reservations"
  value       = { for k, v in azurerm_capacity_reservation.capacity_reservations : k => v.tags }
}
output "capacity_reservations_zone" {
  description = "Map of zone values across all capacity_reservations, keyed the same as var.capacity_reservations"
  value       = { for k, v in azurerm_capacity_reservation.capacity_reservations : k => v.zone }
}

