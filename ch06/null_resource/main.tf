provider null {}

resource "null_resource" "example" {

    triggers = {
        uuid = uuid()
    }
    provisioner "local-exec" {
        command = "echo \"Hello, World from $(uname -smp)\""
    }
}