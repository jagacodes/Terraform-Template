resource "aws_instance" "Jaga-jenkins" {
  ami = "ami-0e49551fc78560451"
  instance_type = "t2.micro"
  key_name = "JagaEc2KeyPair"
  subnet_id = "${aws_subnet.main-public-1.id}"
  vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]

  user_data = "${data.template_file.jenkins_data.rendered}"
  tags = {
      Name = "Jaga-jenkins"
  }
}

data "template_file" "jenkins_data" {
  template = "${file("jenkins.tpl")}"
}


