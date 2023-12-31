/**
  * <!-- Module variables go here.
  *      Always include descriptions as they will populate
  *      autogenerated documentation. -->
*/

variable "name" {
  type        = string
  description = <<-EOT
      The name of the resources created by this module.
      This value is used as the basis for naming various resources.
    EOT
}

variable "availability_zones" {
  type        = list(string)
  description = <<-EOT
    Availability zones to create resources in.
  EOT
}

variable "domain_name" {
  type        = string
  description = <<-EOT
    Name of existing Route53 domain to use.
  EOT
}

variable "asg_instance_type" {
  type        = string
  description = <<-EOT
    EC2 instance type to use in the autoscaling group.
  EOT
  default     = "m6i.4xlarge"
}

variable "ecs_agent_config" {
  type        = map(string)
  description = <<-EOT
    Key / Value pairs of ECS Agent environment variables.
    See: https://github.com/aws/amazon-ecs-agent/blob/master/README.md#environment-variables
    For options.
    ECS_CLUSTER is set by default.
  EOT
  default     = {}
}

variable "boot_script" {
  type        = string
  description = <<-EOT
    Content of shell script to execute at EC2 boot.
    Do not include plain text secrets.
  EOT
  default     = null
}

variable "asg_max_instances" {
  type        = number
  description = <<-EOT
    Maximum number of instances in the autoscaling group.  If this is less than
    `asg_min_instances` then `asg_min_instances` will be used.
  EOT
  default     = 1
}

variable "asg_min_instances" {
  type        = number
  description = <<-EOT
    Minimum number of instances in the autoscaling group.
  EOT
  default     = 1
}

variable "asg_root_volume_size" {
  type        = number
  description = <<-EOT
    Size in GB of root volume.
  EOT
  default     = 1000
}
