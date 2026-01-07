variable "group_name" {
  description = "IAM Group name"
  type        = string
  default     = "RRR"
}

variable "user_names" {
  description = "List of IAM users"
  type        = list(string)
  default     = ["ritik", "ritik2"]
}
