output "storage_cluster_instance_ids" {
  value       = (local.cluster_type == "storage" || local.cluster_type == "combined") ? [for instance in module.storage_cluster_instances : instance.instance_selflink] : null
  description = "Storage cluster instance ids."
}

output "storage_cluster_instance_private_ips" {
  value       = (local.cluster_type == "storage" || local.cluster_type == "combined") ? [for instance in module.storage_cluster_instances : instance.instance_ip] : null
  description = "Storage cluster private ips."
}

output "storage_cluster_with_data_volume_mapping" {
  value       = (local.cluster_type == "storage" || local.cluster_type == "combined") ? local.storage_instance_ips_with_disk_mapping : null
  description = "Storage cluster data volume mapping."
}

output "storage_cluster_with_dns_hostname" {
  value       = (local.cluster_type == "storage" || local.cluster_type == "combined") ? [for instance in module.storage_cluster_instances : instance.instance_dns_name] : null
  description = "Storage cluster dns hostname mapping."
}

output "compute_cluster_with_dns_hostname" {
  value       = (local.cluster_type == "compute" || local.cluster_type == "combined") ? [for instance in module.compute_cluster_instances : instance.instance_dns_name] : null
  description = "Compute cluster dns hostname mapping."
}

output "compute_cluster_instance_ids" {
  value       = (local.cluster_type == "compute" || local.cluster_type == "combined") ? [for instance in module.compute_cluster_instances : instance.instance_selflink] : null
  description = "Compute cluster instance ids."
}

output "compute_cluster_instance_private_ips" {
  value       = (local.cluster_type == "compute" || local.cluster_type == "combined") ? [for instance in module.compute_cluster_instances : instance.instance_ip] : null
  description = "Compute cluster private ips."
}

output "storage_cluster_desc_instance_ids" {
  value       = length(var.vpc_availability_zones) > 2 && local.cluster_type != "compute" ? [for instance in module.storage_cluster_tie_breaker_instance : instance.instance_selflink] : null
  description = "Storage cluster desc instance id."
}

output "storage_cluster_desc_instance_private_ips" {
  value       = length(var.vpc_availability_zones) > 2 && local.cluster_type != "compute" ? [for instance in module.storage_cluster_tie_breaker_instance : instance.instance_ip] : null
  description = "Private IP address of storage cluster desc instance."
}

output "storage_cluster_desc_data_volume_mapping" {
  value       = length(var.vpc_availability_zones) > 2 && local.cluster_type != "compute" ? local.storage_instance_desc_ip_with_disk_mapping : null
  description = "Mapping of storage cluster desc instance ip vs. device path."
}

output "storage_cluster_desc_with_dns_hostname" {
  value       = length(var.vpc_availability_zones) > 2 && local.cluster_type != "compute" ? [for instance in module.storage_cluster_tie_breaker_instance : instance.instance_dns_name] : null
  description = "Storage cluster desc dns hostname mapping."
}

output "storage_cluster_security_group_id" {
  value       = (local.cluster_type == "storage" || local.cluster_type == "combined") ? local.scale_cluster_network_tag : null
  description = "Storage cluster security ids."
}

output "compute_cluster_security_group_id" {
  value       = (local.cluster_type == "compute" || local.cluster_type == "combined") ? local.scale_cluster_network_tag : null
  description = "Compute cluster security ids."
}

output "vpc_compute_cloud_dns" {
  value       = (var.use_clouddns && local.cluster_type == "compute") ? module.compute_dns_zone.dns_managed_zone_id : null
  description = "List of IDs of compute cluster cloud DNS."
}

output "vpc_storage_cloud_dns" {
  value       = (var.use_clouddns && (local.cluster_type == "storage" || local.cluster_type == "combined")) ? module.storage_dns_zone.dns_managed_zone_id : null
  description = "List of IDs of storage cluster cloud DNS."
}
