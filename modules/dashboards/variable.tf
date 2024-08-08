variable "dashboards" {
  description = "Map of dashboards with their pages and widgets"
  type = map(object({
    name        = string
    description = string
    pages       = map(object({
      name    = string
      widgets = map(map(object({
        # type     = string
        title    = string
        row      = number
        column   = number
        width    = number
        height   = number
        # limit    = number
        settings = map(any)
      })))
    }))
  }))
}