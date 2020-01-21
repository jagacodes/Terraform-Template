resource "aws_instance" "JagaEc2" {
  ami = "ami-0e49551fc78560451"
  instance_type = "t2.micro"
  # VPC Subnet
  subnet_id = "${aws_subnet.main-public-1.id}"
  # Security group
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]
  # public SSH key (This is perculiar to keypair pre-provisioned)
  key_name = "JagaEc2KeyPair"

  user_data = "${data.template_file.user_data.rendered}"

  tags = {
      Name = "JagaEc2"
  }
}

data "template_file" "user_data" {
    template = "${file("user_data.tpl")}"
}
