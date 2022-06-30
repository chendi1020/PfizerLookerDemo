view: ssp_exp_rs {
  derived_table: {
    sql: select Year, State, County,FIPS, value, attribute ,ARRAY_REVERSE(SPLIT(attribute, '_'))[OFFSET(0)] as subtype,
(case when SPLIT(attribute, '_')[OFFSET(0)]='Per' then 'Per capita expenditure'
when SPLIT(attribute, '_')[OFFSET(0)]='Avg' then 'Avg risk score'
when SPLIT(attribute, '_')[OFFSET(0)]='Person' then 'Number of assignable beneficiaries'
 end) as type
from `dil-demo-352614.hcc_prevalence.ssp_ffs_benchmark`
unpivot(value for attribute in (
Per_Capita_Exp_ESRD,Avg_Risk_Score_ESRD,Person_Years_ESRD,
Per_Capita_Exp_DIS,Avg_Risk_Score_DIS,Person_Years_DIS,
Per_Capita_Exp_AGDU,Avg_Risk_Score_AGDU,Person_Years_AGDU,
Per_Capita_Exp_AGND,Avg_Risk_Score_AGND,Person_Years_AGND
)) ;;
  }

  dimension: Year {
    type: number
    sql: ${TABLE}.Year ;;
  }

  dimension: State {
    type: string
    sql: ${TABLE}.State ;;
  }

  dimension: County {
    type: string
    sql: ${TABLE}.County ;;
  }

  dimension: FIPS {
    type: number
    sql: ${TABLE}.FIPS ;;
  }

  dimension: attribute {
    type: string
    sql: ${TABLE}.attribute ;;
  }

  dimension: subtype {
    type: string
    sql: ${TABLE}.subtype ;;
  }

  dimension: subtype_descr {
    type: string
    sql: case when ${subtype}='ESRD' then 'End Stage Renal Disease (ESRD)'
    when ${subtype}='DIS' then 'DISABLED'
    when ${subtype}='AGDU' then 'AGED/DUAL'
    when ${subtype}='AGND' then 'AGED/NON-DUAL' end;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }

  measure: value_sum {
    type: sum
    sql: ${value} ;;
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

# view: ssp_expenditure_riskscore {
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
