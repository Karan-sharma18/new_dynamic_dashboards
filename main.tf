module "dashboard" {
  source = "./modules/dashboards"
  dashboards = var.new_dynamic_dashboards
  
}