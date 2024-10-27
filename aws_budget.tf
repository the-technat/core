resource "aws_budgets_budget" "default" {
  name         = "default"
  budget_type  = "COST"
  limit_amount = "5"
  limit_unit   = "USD"
  time_unit    = "MONTHLY"

  tags = {
    managed-by = "terraform"
  }
}
