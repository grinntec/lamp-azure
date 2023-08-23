output "storage_account_name" {
  description = "The name of the storage account"
  value       = module.storage_account.storage_account_name
}

output "primary_blob_endpoint" {
  description = "The URI endpoint for the primaryu blob"
  value       = module.storage_account.primary_blob_endpoint
}