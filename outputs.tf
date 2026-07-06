output "capacity_reservations" {
  description = "All capacity_reservation resources"
  value       = azurerm_capacity_reservation.capacity_reservations
}
output "capacity_reservations_capacity_reservation_group_id" {
  description = "List of capacity_reservation_group_id values across all capacity_reservations"
  value       = [for k, v in azurerm_capacity_reservation.capacity_reservations : v.capacity_reservation_group_id]
}
output "capacity_reservations_name" {
  description = "List of name values across all capacity_reservations"
  value       = [for k, v in azurerm_capacity_reservation.capacity_reservations : v.name]
}
output "capacity_reservations_sku" {
  description = "List of sku values across all capacity_reservations"
  value       = [for k, v in azurerm_capacity_reservation.capacity_reservations : v.sku]
}
output "capacity_reservations_tags" {
  description = "List of tags values across all capacity_reservations"
  value       = [for k, v in azurerm_capacity_reservation.capacity_reservations : v.tags]
}
output "capacity_reservations_zone" {
  description = "List of zone values across all capacity_reservations"
  value       = [for k, v in azurerm_capacity_reservation.capacity_reservations : v.zone]
}

