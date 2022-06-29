# The name of this view in Looker is "Betos"
view: betos {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
#   derived_table: {
#     sql: select state_code, County,State, FIPS, Year, Payer, proc, proc_category, proc_description, BENE_CNT,
# sum(lines_with_proc) as lines_with_proc, sum(num_lines) as num_lines, sum(benes_with_proc) as benes_with_proc, sum(benes_with_any_proc) as benes_with_any_proc
# from `dil-demo-352614.hcc_prevalence.betos`
# group by state_code, County,State, FIPS, Year, Payer, proc, proc_category, proc_description, BENE_CNT ;;
#   }
sql_table_name:  `dil-demo-352614.hcc_prevalence.betos`;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Bene Cnt" in Explore.

  dimension: bene_cnt {
    type: number
    sql: ${TABLE}.BENE_CNT ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_bene_cnt {
    type: sum
    sql: ${bene_cnt} ;;
  }

  measure: average_bene_cnt {
    type: average
    sql: ${bene_cnt} ;;
  }

  dimension: benes_with_any_proc {
    type: number
    sql: ${TABLE}.benes_with_any_proc ;;
  }

  dimension: benes_with_proc {
    type: number
    sql: ${TABLE}.benes_with_proc ;;
  }

  measure: benes_with_proc_sum {
    type: sum
    sql: ${benes_with_proc} ;;
  }

  measure: benes_with_any_proc_sum {
    type: sum
    sql: ${benes_with_any_proc} ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.County ;;
  }


  dimension: fips {
    type: number
    sql: ${TABLE}.FIPS ;;
  }

  dimension: lines_with_proc {
    type: number
    sql: ${TABLE}.lines_with_proc ;;
  }

  measure: lines_with_proc_sum {
    type: sum
    sql: ${lines_with_proc} ;;
  }

  dimension: num_lines {
    type: number
    sql: ${TABLE}.num_lines ;;
  }

  measure: prevalence_line {
    type: sum
    sql: ${lines_with_proc}/${num_lines} *1000;;
    value_format: "0.0"
    drill_fields: [payer,  prevalence_line]

  }

  measure: prevalence_bene {
    type: sum
    value_format: "0.0"
    sql: ${benes_with_proc}/${benes_with_any_proc} *1000;;
    drill_fields: [payer,  prevalence_bene]
  }

  measure: num_lines_sum {
    type: sum
    sql: ${num_lines} ;;
  }

  dimension: payer {
    type: string
    sql: ${TABLE}.PAYER ;;
  }

  dimension: proc {
    type: string
    sql: ${TABLE}.proc ;;
  }

  dimension: proc_category {
    type: string
    sql: ${TABLE}.proc_category ;;
    drill_fields: [proc_description]
  }

  dimension: proc_description {
    type: string
    sql: ${TABLE}.proc_description ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }


  dimension: year {
    type: number
    sql: ${TABLE}.YEAR ;;
  }

  dimension: pk_betos {
    type: string
    sql: ${year} || ${state} || ${county} || ${payer} || ${proc} ;;
    primary_key: yes
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
