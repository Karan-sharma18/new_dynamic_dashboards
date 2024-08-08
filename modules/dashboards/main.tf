resource "newrelic_one_dashboard" "dashboard" {
  for_each = var.dashboards

  name        = each.value.name
  description = each.value.description

  dynamic "page" {
    for_each = each.value.pages
    content {
      name = page.value.name

      # Explicitly define each widget type
      dynamic "widget_bar" {
        for_each = lookup(page.value.widgets,"bar",{})
        # for_each = page.value.widgets.widget_bar
        content {
          title  = widget_bar.value.title
          row    = widget_bar.value.row
          column = widget_bar.value.column
          width  = widget_bar.value.width
          height = widget_bar.value.height

          nrql_query {
            query      = widget_bar.value.settings.query
            account_id = widget_bar.value.settings.account_id
          }
        }
      }
 

      
      dynamic "widget_line" {
        for_each = lookup(page.value.widgets,"line",{})
        # for_each = page.value.widgets.widget_line
        content {
          title = widget_line.value.title
          row   = widget_line.value.row
          column = widget_line.value.column
          width  = widget_line.value.width
          height = widget_line.value.height

          nrql_query {
            query      = widget_line.value.settings.query
            account_id = widget_line.value.settings.account_id
          }
        }
      }




        dynamic "widget_pie" {
          for_each = lookup(page.value.widgets,"pie",{})
        # for_each = page.value.widgets.widget_pie
        content {
          title = widget_pie.value.title
          row   = widget_pie.value.row
          column = widget_pie.value.column
          width  = widget_pie.value.width
          height = widget_pie.value.height

          nrql_query {
            query      = widget_pie.value.settings.query
            account_id = widget_pie.value.settings.account_id
          }
        }
      }
    }
  }
}
