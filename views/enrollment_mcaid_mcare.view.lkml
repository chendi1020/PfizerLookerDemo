view: enrollment_mcaid_mcare {
  derived_table: {
    sql: SELECT year, state, value, attribute FROM (
select a.*,b.tot_chip,b.tot_mcaid
from (
  select year,  state, sum(BENES_FFS_CNT) as BENES_FFS_CNT ,sum( BENES_MA_CNT) as BENES_MA_CNT
  from `hcc_prevalence.geo_puf`
  group by year, state
) a
inner join `hcc_prevalence.mcaid_chip_annual_enroll` b
on a.year=b.year
and a.state=b.state_abbrev
)
UNPIVOT(value FOR attribute IN ( BENES_FFS_CNT,BENES_MA_CNT, tot_chip, tot_mcaid)
) ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }


  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }


  dimension: attribute {
    type: string
    sql: ${TABLE}.attribute ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }

  dimension: attribute_label {
    type: string
    sql: case when ${attribute}="BENES_FFS_CNT" then "Medicare Fee-for-Service beneficiaries"
    when ${attribute}="BENES_MA_CNT" then "Beneficiaries who are ever enrolled in a Medicare Advantage (MA) program"
    when ${attribute}="tot_chip" then "Medicaid CHIP"
    when ${attribute}="tot_mcaid" then "Medicaid"
    end
    ;;
  }

  measure: value_sum {
    type: sum
    sql: ${value} ;;
    drill_fields: [state, value_sum]
  }

  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
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

# view: enrollment_mcaid_mcare {
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
