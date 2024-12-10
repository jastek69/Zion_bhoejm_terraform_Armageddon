resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.tmmc_tok_vpc.id

  tags = {
    Name    = "tmmc_tok_vpc_IG"
    Service = "application1"
    Owner   = "Balactus"
    Planet  = "Taa"
  }
}
