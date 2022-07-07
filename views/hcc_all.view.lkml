# The name of this view in Looker is "Hcc All"
view: hcc_all {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  derived_table: {
    sql:
select * ,'Overall' as type
from `dil-demo-352614.hcc_prevalence.hcc_all`
union all
select *,'Oncology'
from `hcc_prevalence.hcc_onco`
where HCC not in ('HCC8','HCC9','HCC10','HCC11','HCC12')
union all
select *,'Cardiovascular & Metabolic Disorders'
from `hcc_prevalence.hcc_card`
where HCC not in ('HCC17','HCC18','HCC19','HCC21','HCC22','HCC23',
'HCC84', 'HCC85', 'HCC86', 'HCC87', 'HCC88', 'HCC96', 'HCC100', 'HCC106', 'HCC107', 'HCC108', 'HCC122')
union all
select  * , 'Neurological Disorders'
from `hcc_prevalence.hcc_neur`
where HCC not in ('HCC51', 'HCC52', 'HCC73', 'HCC74',
'HCC75', 'HCC76', 'HCC78', 'HCC79', 'HCC80', 'HCC99', 'HCC100')
union all
select *, 'Immune and Inflammatory Disorders'
from `hcc_prevalence.hcc_immu`
where HCC not in (
  'HCC35', 'HCC39', 'HCC40', 'HCC46', 'HCC47', 'HCC48', 'HCC77', 'HCC110'
)
union all
select *, 'COPD' as type
from `dil-demo-352614.hcc_prevalence.hcc_111`
where hcc <> 'HCC111'
union all
select *, 'Diabetes' as type
from `dil-demo-352614.hcc_prevalence.hcc_18`
where hcc <> 'HCC18'
union all
select *, 'Congestive Heart Failure' as type
from `dil-demo-352614.hcc_prevalence.hcc_85`
where hcc <> 'HCC85';;
  }
#sql_table_name:`dil-demo-352614.hcc_prevalence.hcc_all` ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Bene Cnt" in Explore.

  dimension: bene_cnt {
    type: number
    sql: ${TABLE}.BENE_CNT ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
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
    value_format: "0.00"
    type: number
    sql: ${benes_with_hcc_sum}/${benes_w_dx_sum} *1000;;
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
    # link: {
    #   label: "Top 50 Counties with higest HCC prevalence rate"
    #   icon_url: "https://www.zilliondesigns.com/images/portfolio/healthcare-hospital/iStock-471629610-Converted.png"
    #   url: "https://mathematica.cloud.looker.com/dashboards/32?Hcc+Description={{ filterable_value | url_encode}}&Year={{ _filters['hcc_all.year'] | url_encode }}&Type={{ _filters['hcc_all.type'] | url_encode }}"

    # }
  }

  dimension: hcc_description_with_link {
    type: string
    sql: ${TABLE}.HCC_Description ;;
    link: {
      label: "Top 50 Counties with higest HCC cormorbidity prevalence rate"
      icon_url: "https://www.zilliondesigns.com/images/portfolio/healthcare-hospital/iStock-471629610-Converted.png"
      url: "https://mathematica.cloud.looker.com/dashboards/32?Hcc+Description={{ filterable_value | url_encode}}&Year={{ _filters['hcc_all.year'] | url_encode }}&Clinical+Cohorts={{ _filters['hcc_all.type'] | url_encode }}"

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
    sql: ${year} || ${state} || ${county} || ${hcc} || ${payer} || ${type};;
    primary_key: yes
  }

  dimension: title {
    type: string
    sql: "Top 30 " || ${type} || " comorbidity by payer type" ;;
    html:<font size="5">{{ value }}</font>;;
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
