# The name of this view in Looker is "Hcc 18"
view: hcc_18 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `dil-demo-352614.hcc_prevalence.hcc_18`
    ;;
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

  dimension: benes_w_dx {
    type: number
    sql: ${TABLE}.benes_w_dx ;;
  }

  dimension: benes_with_hcc {
    type: string
    sql: ${TABLE}.benes_with_hcc ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.County ;;
  }

  dimension: county_cd {
    type: number
    sql: ${TABLE}.COUNTY_CD ;;
  }

  dimension: fips {
    type: number
    sql: ${TABLE}.FIPS ;;
  }

  dimension: hcc {
    type: string
    sql: ${TABLE}.HCC ;;
  }

  dimension: hcc_description {
    type: string
    sql: ${TABLE}.HCC_Description ;;
  }

  dimension: payer {
    type: string
    sql: ${TABLE}.PAYER ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }

  dimension: state_code {
    type: number
    sql: ${TABLE}.STATE_CODE ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.YEAR ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
