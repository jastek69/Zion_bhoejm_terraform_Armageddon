# this  makes  vpc.id which is aws_vpc.tmmc_tok_vpc.id
resource "aws_vpc" "tmmc_tok_vpc" {
  cidr_block = "10.240.0.0/16"

  tags = {
    Name = "tmmc_tok_vpc"
    Service = "application1"
    Owner = "Balactus"
    Planet = "Taa"
  }
}
