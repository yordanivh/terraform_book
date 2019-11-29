##Using for in terraform
variable "names" {
  description = "A list of names"
  type        = list(string)
  default     = ["neo", "trinity", "morpheus"]
}

output "upper_names" {
  value = [for name in var.names : upper(name) if length(name) < 5]
}

###Looping over a map with for

variable "hero_thousand_faces" {
  description = "map"
  type        = map(string)
  default = {
    neo      = "hero"
    trinity  = "love interest"
    morpheus = "mentor"
  }
}

output "bios" {
  value = [for name, role in var.hero_thousand_faces : "${name} is the ${role}"]
}

output "upper_roles" {
  value = { for name, role in var.hero_thousand_faces : upper(name) => upper(role) }
}

###Loops with the for String Directive

output "for_directive" {
  value = <<EOF
    %{ for name in var.names }
    ${name}
    %{ endfor }
    EOF
}

output "for_directive_strip_marker" {
    value = <<EOF
    %{~ for name in var.names ~}    
${name}
    %{~ endfor ~}
    EOF
}
 
