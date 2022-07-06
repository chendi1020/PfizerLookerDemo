view: state_county_list {
  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  derived_table: {
#   sql: SELECT distinct state, county FROM `dil-demo-352614.hcc_prevalence.proc_by_county_18`
# union distinct
# select distinct
# state, county FROM `dil-demo-352614.hcc_prevalence.hcc_by_county_diabetes` ;;
sql: select state, County
from `dil-demo-352614.hcc_prevalence.hcc_all`
group by state, county ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
  }

 dimension: population_health {
   type: string
   sql:  "Population Health" ;;
   link: {
    label: "go to population health page"
    url: "/dashboards/31?County=LOS+ANGELES&State=CA&Year=2018&Comorbidity+=Overall"
  }
 }

  dimension: value_based_care {
    type: string
    sql:  "Value-based Care" ;;
    link: {
      label: "go to value-based care page"
      url: "/dashboards/33?County=LOS%20ANGELES&State=CA"
    }
  }

  dimension: SDOH {
    type: string
    sql:  "SDOH Equity (forthcoming)" ;;

  }

  dimension: real_word {
    type: string
    sql:  "Real World Evidence (forthcoming)" ;;

  }

  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: state_county_list {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
