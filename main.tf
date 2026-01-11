resource "azurerm_capacity_reservation" "capacity_reservations" {
  for_each = var.capacity_reservations

  capacity_reservation_group_id = each.value.capacity_reservation_group_id
  name                          = each.value.name
  tags                          = each.value.tags
  zone                          = each.value.zone

  sku {
    capacity = each.value.sku.capacity
    name     = each.value.sku.name
  }
}

