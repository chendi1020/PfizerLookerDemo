# The name of this view in Looker is "State By Payer 19"
view: state_by_payer_19 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `hcc_prevalence.state_by_payer_19`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Benes with Hcc Enc" in Explore.

  dimension: benes_with_hcc_enc {
    type: number
    sql: ${TABLE}.benes_with_hcc_enc ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_benes_with_hcc_enc {
    type: sum
    sql: ${benes_with_hcc_enc} ;;
  }

  measure: average_benes_with_hcc_enc {
    type: average
    sql: ${benes_with_hcc_enc} ;;
  }

  dimension: benes_with_hcc_ffs {
    type: number
    sql: ${TABLE}.benes_with_hcc_ffs ;;
  }

  dimension: hcc {
    type: string
    sql: ${TABLE}.hcc ;;
  }

  dimension: hcc_prev_per_1k_enc {
    type: number
    sql: ${TABLE}.hcc_prev_per_1k_enc ;;
  }

  dimension: hcc_prev_per_1k_ffs {
    type: number
    sql: ${TABLE}.hcc_prev_per_1k_ffs ;;
  }

  dimension: mean_hcc_score_enc {
    type: number
    sql: ${TABLE}.mean_hcc_score_enc ;;
  }

  dimension: mean_hcc_score_ffs {
    type: number
    sql: ${TABLE}.mean_hcc_score_ffs ;;
  }

  dimension: num_benes_enc {
    type: number
    sql: ${TABLE}.num_benes_enc ;;
  }

  dimension: num_benes_ffs {
    type: number
    sql: ${TABLE}.num_benes_ffs ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
