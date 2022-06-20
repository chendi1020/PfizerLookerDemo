# The name of this view in Looker is "Proc By County 18"
view: proc_by_county_18 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `dil-demo-352614.hcc_prevalence.proc_by_county_18`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Benes with Proc" in Explore.

  dimension: benes_with_proc {
    type: number
    sql: ${TABLE}.benes_with_proc ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_benes_with_proc {
    type: sum
    sql: ${benes_with_proc} ;;

  }

  measure: average_benes_with_proc {
    type: average
    sql: ${benes_with_proc} ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.County ;;
  }

  dimension: int64_field_0 {
    type: number
    sql: ${TABLE}.int64_field_0 ;;
  }

  dimension: num_benes {
    type: number
    sql: ${TABLE}.num_benes ;;
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

  dimension: proc_prev_per_1k {
    type: number
    sql: ${TABLE}.proc_prev_per_1k ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
