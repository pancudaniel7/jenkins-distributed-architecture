terraform {
  backend "s3" {
    bucket         = "jenkins-prototype-infrastructure-state-998878"
    key            = "jenkins-prototype-infrastructure-state.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "jenkins-prototype-infrastructure-state-lock-table"
    encrypt        = true
  }
}
