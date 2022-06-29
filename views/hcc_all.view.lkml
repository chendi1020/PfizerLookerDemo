# The name of this view in Looker is "Hcc All"
view: hcc_all {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
#   derived_table: {
#     sql: select STATE_CODE, County,state, FIPS, Year, payer, hcc, HCC_Description, BENE_CNT, sum(benes_w_dx) as benes_w_dx, sum(case when benes_with_hcc =' ' then NULL else cast(benes_with_hcc as float64) end) as benes_with_hcc
# from `dil-demo-352614.hcc_prevalence.hcc_all`
# group by STATE_CODE, County,state, FIPS, Year, payer, hcc, HCC_Description, BENE_CNT ;;
#   }
sql_table_name:`dil-demo-352614.hcc_prevalence.hcc_all` ;;
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
    sql: ${TABLE}.benes_with_dx ;;
  }

  measure: benes_w_dx_sum {
    type: sum
    sql: ${benes_w_dx} ;;
  }

  dimension: benes_with_hcc {
    type: string
    sql: ${TABLE}.benes_with_hcc ;;
  }

  measure: benes_with_hcc_sum {
    type: sum
    sql: ${benes_with_hcc} ;;
  }

  measure: hcc_prevalence {
    type: sum
    sql: ${benes_with_hcc}/${benes_w_dx} *1000;;
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
    type: string
    map_layer_name: us_counties_fips
    sql: ${TABLE}.FIPS ;;
  }

  dimension: hcc {
    type: string
    sql: ${TABLE}.HCC ;;
  }

  dimension: hcc_description {
    type: string
    sql: ${TABLE}.HCC_Description ;;
    link: {
      label: "Top 50 Counties with higest HCC prevalence rate"
      icon_url: "https://www.zilliondesigns.com/images/portfolio/healthcare-hospital/iStock-471629610-Converted.png"
      url: "https://mathematica.cloud.looker.com/dashboards/32?Hcc+Description={{ filterable_value | url_encode}}&Year={{ _filters['hcc_all.year'] | url_encode }}"

    }
  }

  dimension: payer {
    type: string
    sql: ${TABLE}.PAYER ;;
  }

  dimension: state {
    type: string
    map_layer_name: us_states
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

  dimension: pk_hcc_all {
    type: string
    sql: ${year} || ${state} || ${county} || ${hcc} || ${payer};;
    primary_key: yes
  }

  # dimension: county_geo {
  #   type: location
  #   sql: ${county} ;;
  # }

  # dimension: state_geo {
  #   type: location
  #   sql: ${state} ;;
  # }

  measure: count {
    type: count
    drill_fields: []
  }
}
