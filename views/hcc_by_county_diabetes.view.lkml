# The name of this view in Looker is "Hcc By County Diabetes"
view: hcc_by_county_diabetes {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  #sql_table_name: `hcc_prevalence.hcc_by_county_diabetes`
   # ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Benes with Hcc" in Explore.
  derived_table: {
    sql: select *  FROM `dil-demo-352614.hcc_prevalence.hcc_by_county_diabetes`
where HCC  <> 'HCC18' ;;
  }

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

  dimension: county {
    type: string
    sql: ${TABLE}.County ;;
  }

  dimension: county_cd {
    type: number
    sql: ${TABLE}.COUNTY_CD ;;
  }

  dimension: hcc {
    type: string
    sql: ${TABLE}.HCC ;;
  }

  dimension: hcc_description {
    type: string
    sql: ${TABLE}.HCC_Description ;;
    link: {
      label: "Trend View"
      icon_url: "https://www.zilliondesigns.com/images/portfolio/healthcare-hospital/iStock-471629610-Converted.png"
      url: "https://mathematica.cloud.looker.com/dashboards/32?Hcc+Description={{ filterable_value | url_encode}}&State={{ _filters['hcc_by_county_diabetes.state'] | url_encode }}&County={{ _filters['hcc_by_county_diabetes.county'] | url_encode }}"

    }
  }

  dimension: num_benes {
    type: number
    sql: ${TABLE}.num_benes ;;
  }

  dimension: prev_per_1k {
    type: number
    sql: ${TABLE}.prev_per_1k ;;
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
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
