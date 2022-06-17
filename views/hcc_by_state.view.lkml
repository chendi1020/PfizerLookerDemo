# The name of this view in Looker is "Hcc By State"
view: hcc_by_state {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `hcc_prevalence.hcc_by_state`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Benes with Hcc" in Explore.

  dimension: benes_with_hcc {
    type: number
    sql: ${TABLE}.benes_with_hcc ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_benes_with_hcc {
    type: sum
    sql: ${benes_with_hcc} ;;
  }

  measure: average_benes_with_hcc {
    type: average
    sql: ${benes_with_hcc} ;;
  }

  dimension: hcc {
    type: string
    sql: ${TABLE}.hcc ;;
  }

  dimension: hcc_prev_per_1k {
    type: number
    sql: ${TABLE}.hcc_prev_per_1k ;;
  }

  dimension: mean_hcc_score {
    type: number
    sql: ${TABLE}.mean_hcc_score ;;
  }

  dimension: num_benes {
    type: number
    sql: ${TABLE}.num_benes ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
