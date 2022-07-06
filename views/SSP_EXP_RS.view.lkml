view: ssp_exp_rs {
  derived_table: {
    sql: select a.*,b.avg_risk_score,c.num_assignable,d.num_assigned,d.num_assigned/c.num_assignable as pct
from (
    select Year, State, County,FIPS, value as per_capita_exp, attribute ,ARRAY_REVERSE(SPLIT(attribute, '_'))[OFFSET(0)] as subtype
    from `dil-demo-352614.hcc_prevalence.ssp_ffs_benchmark`
    unpivot(value for attribute in (
    Per_Capita_Exp_ESRD,
    Per_Capita_Exp_DIS,
    Per_Capita_Exp_AGDU,
    Per_Capita_Exp_AGND
    ))
) a
inner join
(
select Year, State, County,FIPS, value as avg_risk_score, attribute ,ARRAY_REVERSE(SPLIT(attribute, '_'))[OFFSET(0)] as subtype
    from `dil-demo-352614.hcc_prevalence.ssp_ffs_benchmark`
    unpivot(value for attribute in (
    Avg_Risk_Score_ESRD,
    Avg_Risk_Score_DIS,
    Avg_Risk_Score_AGDU,
    Avg_Risk_Score_AGND
    ))
) b
on a.year=b.year and a.state=b.state and a.county=b.county and a.FIPS=b.FIPS
and a.subtype =b.subtype
inner join
(
select Year, State, County,FIPS, value as num_assignable, attribute ,ARRAY_REVERSE(SPLIT(attribute, '_'))[OFFSET(0)] as subtype
    from `dil-demo-352614.hcc_prevalence.ssp_ffs_benchmark`
    unpivot(value for attribute in (
    Person_Years_ESRD,
    Person_Years_DIS,
    Person_Years_AGDU,
    Person_Years_AGND
    ))
) c
 on a.year=c.year and a.state=c.state and a.county=c.county and a.FIPS=c.FIPS
and a.subtype =c.subtype

inner join (
select Year, State, County,FIPS, value as num_assigned, attribute,ARRAY_REVERSE(SPLIT(attribute, '_'))[OFFSET(0)] as subtype
from (
select Year,County, State, FIPS, sum(AB_Psn_Yrs_ESRD) as AB_Psn_Yrs_ESRD,
sum(AB_Psn_Yrs_DIS) as AB_Psn_Yrs_DIS,sum(AB_Psn_Yrs_AGDU) as AB_Psn_Yrs_AGDU,
sum(AB_Psn_Yrs_AGND) as AB_Psn_Yrs_AGND
from `hcc_prevalence.ssp_assigned`
group by Year, County, State, FIPS)
unpivot(value for attribute in (AB_Psn_Yrs_ESRD,AB_Psn_Yrs_DIS, AB_Psn_Yrs_AGDU, AB_Psn_Yrs_AGND))
) d
 on a.year=d.year and a.state=d.state and a.county=d.county and a.FIPS=d.FIPS
and a.subtype =d.subtype
  ;;
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

  # dimension: attribute {
  #   type: string
  #   sql: ${TABLE}.attribute ;;
  # }

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

  # dimension: type {
  #   type: string
  #   sql: ${TABLE}.type ;;
  # }

  dimension: per_capita_exp {
    type: number
    sql: ${TABLE}.per_capita_exp ;;
  }

  dimension: avg_risk_score {
    type: number
    sql: ${TABLE}.avg_risk_score ;;
  }

  dimension: num_assignable {
    type: number
    sql: ${TABLE}.num_assignable ;;
  }

dimension: num_assigned {
  type: number
  sql: ${TABLE}.num_assigned  ;;
}

dimension: pct {
  type: number
  sql: ${TABLE}.pct ;;
}

  measure: per_capita_exp_sum {
    type: sum
    sql: ${per_capita_exp} ;;
  }

  measure: avg_risk_score_sum {
    type: sum
    sql: ${avg_risk_score} ;;
  }

  measure: num_assignable_sum {
    type: sum
    sql: ${num_assignable} ;;
  }

measure: num_assigned_sum {
  type: sum
  sql: ${num_assigned} ;;
}

measure: assigned_pct {
  type: sum
  value_format: "0.0%"
  sql: ${pct} ;;
}

# measure: assigned_pct {
#   value_format: "0.0%"
#   sql: ${num_assigned_sum}/${num_assignable_sum} ;;
# }

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
