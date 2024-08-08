new_dynamic_dashboards = {
  "dashboard_11" = {
    name        = "new dynamic dash"
    description = "new dynamic dash"
    pages = {
      "page_1" = {
        name = "first page"
        widgets = {
          billboard = {
            "widget_1" = {
              # type   = "billboard"
              title  = "total transaction"
              row    = 1
              column = 1
              width  = 7
              height = 6
              settings = {
                query      = "FROM Transaction SELECT count(*) AS 'total transactions'"
                account_id = 4438268
              }
            },
            "widget_2" = {
              # type   = "billboard"
              title  = "application availability"
              row    = 10
              column = 8
              width  = 5
              height = 2
              settings = {
                query      = "SELECT percentage(count(*), WHERE `duration` > 0) AS Availability FROM Transaction "
                account_id = 4438268
              }
            },


            "widget_3" = {
              type   = "billboard"
              title  = "transaction success rate"
              row    = 7
              column = 1
              width  = 7
              height = 3
              settings = {
                query      = "SELECT percentage(count(*), WHERE `error` IS false) AS TransactionSuccessRate FROM Transaction"
                account_id = 4438268
              }
            }

            ###############################################################################################################################           
          }
          bar = {
            "widget_1" = {
              # type   = "billboard"
              title  = "Memory utilization"
              row    = 6
              column = 1
              width  = 5
              height = 2
              settings = {
                query      = "SELECT average(memoryUsedBytes/memoryTotalBytes * 100) AS AvgMemoryUtilization FROM SystemSample"
                account_id = 4438268
              }
            },


            "widget_2" = {
              # type   = "billboard"
              title  = "CPU utilization"
              row    = 4
              column = 1
              width  = 4
              height = 2
              settings = {
                query      = "SELECT average(cpuPercentage) AS AvgCpuUtilization FROM SystemSample"
                account_id = 4438268
              }
            },




            "widget_3" = {
              # type   = "billboard"
              title  = "Network Traffic"
              row    = 4
              column = 5
              width  = 8
              height = 2
              settings = {
                query      = "SELECT average(recieveBytesPerSecond) AS AvgIncomingtraffic, average(transmitBytesPerSecond) AS AvgoutgoingTraffic FROM SystemSample"
                account_id = 4438268
              }
            }
          }
        }
      }


  


      "page_2" = {
        name = "second page"

        widgets = {
          pie = {
            "widget_1" = {
              # type   = "billboard"
              title  = "process count"
              row    = 12
              column = 1
              width  = 12
              height = 3
              settings = {
                query      = "SELECT count(*) FROM ProcessSample WHERE entityName = 'DESKTOP-DBGEEJK' FACET processDisplayName"
                account_id = 4438268
              }
            },
            "widget_2" = {
              # type   = "billboard"
              title  = "application performance trends"
              row    = 4
              column = 1
              width  = 12
              height = 3
              settings = {
                query      = "SELECT average(`duration`) AS AvgResponseTime FROM Transaction SINCE 7 days ago COMPARE WITH 7 days ago"
                account_id = 4438268
              }
            },



            ###############################################################################################################################           
          }

          line = {
            "widget_1" = {
              # type   = "billboard"
              title  = "Overall CPU % Statistics"
              row    = 1
              column = 1
              width  = 8
              height = 3
              settings = {
                query      = "SELECT average(cpuSystemPercent), average(cpuUserPercent), average(cpuIdlePercent), average(cpuIOWaitPercent) FROM SystemSample WHERE hostname = 'DESKTOP-DBGEEJK' SINCE 2 hour ago TIMESERIES"
                account_id = 4438268
              }
            },


            "widget_2" = {
              # type   = "billboard"
              title  = "Average transaction duration and the request per minute, by application"
              row    = 1
              column = 7
              width  = 6
              height = 3
              settings = {
                query      = "SELECT average(cpuPercentage) AS AvgCpuUtilization FROM SystemSample"
                account_id = 4438268
              }
            },
          }
        }
      }
    }
  }
}
