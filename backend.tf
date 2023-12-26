terraform {
  backend "s3" {
    bucket         = "jenkins-prototype-infrastructure-state"
    key            = "jenkins-prototype-infrastructure-state.tfstate"
    region         = "us-east-1"
    dynamodb_table = "jenkins-prototype-infrastructure-state-lock-table"
    encrypt        = true
  }
}
