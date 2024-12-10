terraform {
    backend "s3" {
        bucket = "jastektokterraform"
        key = "MyLinuxBox-tok"
        region = "ap-northeast-1"      
}
}
