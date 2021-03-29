resource "azurerm_resource_group" "rg-taskcluster-worker-manager-staging" {
  name     = "rg-taskcluster-worker-manager-staging"
  location = "Central US"
  tags = merge(local.common_tags,
    map(
      "Name", "rg-taskcluster-worker-manager-staging"
    )
  )
}
