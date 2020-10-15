resource "aws_instance" "example" {
  ami           = "ami-03657b56516ab7912"
  instance_type = "t2.micro"
}

resource "aws_iam_user" "user" {
  name = "icarus"
  path = "/"
}

resource "aws_iam_user_ssh_key" "user" {
  username   = aws_iam_user.user.name
  encoding   = "SSH"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCkWGQa9HPnmtddf2Df8XuHbD4DHu+22OjwePXUf531Y0MPqBC7hp/rabKgDXa+qPu/UZ5w4L23CokMDxcJjDCGljujbhjxPyHcnqcB93kkFiWooXZETCKNzW9HB/Rcfw98oaBUMj3aIPU2Rprhd3iuFMxP7OpS8x1T/m00XN2OYSvG/6Y9cIo3+IUCXO2Y0AujX2Ik0ec3S6zvlqlQK/53zmfsZzIuO5QclgOV5ixF02W7CEf9Dbx3AukR/DdSIU+YuCVE+nm2nvXNMzhPa6uPV/9BtX7FifJCCCbcZXohHMtI6Fu234jX2+BClrjVvecY+5W375Gt1s+zMQwMaaK/+yFN6H8O7iaPqInPjmkV2KtNpS8n7B6WfUq83PDPzK6LEkQGLutnyCNun6MLDWmlTh6EEuvjE1yc4bfMe3oXKP8F2eEFXTxkvETwXTqpZVB9YBATCRcYVIpUVODkP8xrRmirrs6WjOsz3FmRkBmT0wMAxn8uVCMUK4QHAzon2X8= icarus@RAWHIDE"
}

resource "aws_eip" "ip" {
  vpc      = true
  instance = aws_instance.example.id
}


resource "aws_vpc" "mainvpc" {
  cidr_block = "10.1.0.0/16"
}

