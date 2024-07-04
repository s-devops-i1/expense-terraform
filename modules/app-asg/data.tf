data "aws_ami" "ami" {
  most_recent     = true
  name_regex      = "golden-ami-*"
#   owners        = ["973714476881"]
  owners          = ["self"]
}
#
data "vault_generic_secret" "ssh" {
  path = "common/common"
}
