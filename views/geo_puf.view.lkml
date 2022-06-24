# The name of this view in Looker is "Geo Puf"
view: geo_puf {
  derived_table: {
    sql: select year, state, county, value, attribute as variable ,
(case when attribute ='BENES_FFS_CNT' then  "Count of Medicare Fee-for-Service beneficiaries"
when  attribute ='BENES_MA_CNT' then "Count of beneficiaries who are ever enrolled in a Medicare Advantage (MA) program"
when attribute = 'BENES_IP_CVRD_STAY_CNT' then "Number of beneficiaries using Hospital Inpatient (IP)services with at least one covered stay"
when attribute= 'IP_CVRD_DAYS_PER_1000_BENES' then "Hospital Inpatient (IP) covered days per 1,000 Medicare Beneficiaries"
when attribute = 'IP_CVRD_STAYS_PER_1000_BENES' then "Hospital Inpatient (IP) covered admissions per 1,000 Medicare Beneficiaries"
when attribute = 'ACUTE_HOSP_READMSN_CNT' then "Count of inpatient readmissions within 30 days of an acute hospital stay"
when attribute ='BENES_ER_VISITS_CNT' then "Count of inpatient or hospital outpatient Emergency Department Visits"
when attribute = 'TOT_MDCR_STDZD_PYMT_AMT' then "Total amount that Medicare paid adjusted for geographic differences in payment rates"
when attribute = 'IP_MDCR_STDZD_PYMT_AMT' then "Hospital Inpatient (IP) Medicare payment,adjusted for geographic differences in payment rates"
when attribute ='OP_MDCR_STDZD_PYMT_AMT' then "Hospital Outpatient (OP) Medicare payment,adjusted for geographic differences in payment rates"
end
) as variable_label,
(case when attribute ='BENES_FFS_CNT' then  1
when  attribute ='BENES_MA_CNT' then 2
when attribute = 'BENES_IP_CVRD_STAY_CNT' then 6
when attribute= 'IP_CVRD_DAYS_PER_1000_BENES' then 8
when attribute = 'IP_CVRD_STAYS_PER_1000_BENES' then 7
when attribute = 'ACUTE_HOSP_READMSN_CNT' then 9
when attribute ='BENES_ER_VISITS_CNT' then 10
when attribute = 'TOT_MDCR_STDZD_PYMT_AMT' then 3
when attribute = 'IP_MDCR_STDZD_PYMT_AMT' then 4
when attribute ='OP_MDCR_STDZD_PYMT_AMT' then 5
end
) as variable_order
from (
SELECT year, state, county, value, attribute FROM `dil-demo-352614.hcc_prevalence.geo_puf`
UNPIVOT(value FOR attribute IN (BENES_FFS_CNT ,BENES_MA_CNT,
BENES_IP_CVRD_STAY_CNT,IP_CVRD_DAYS_PER_1000_BENES, IP_CVRD_STAYS_PER_1000_BENES,
ACUTE_HOSP_READMSN_CNT, BENES_ER_VISITS_CNT))
union all
SELECT year, state, county, value, attribute FROM `dil-demo-352614.hcc_prevalence.geo_puf`
UNPIVOT(value FOR attribute IN (TOT_MDCR_STDZD_PYMT_AMT ,IP_MDCR_STDZD_PYMT_AMT,OP_MDCR_STDZD_PYMT_AMT))
)
 ;;
  }



  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
  }



  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }


  dimension: year {
    type: number
    sql: ${TABLE}.YEAR ;;
  }

  dimension: variable {
    type: string
    sql: ${TABLE}.variable ;;
  }

  dimension: variable_label {
    type: string
    label: "Variables"
    sql: ${TABLE}.variable_label ;;
  }

  dimension: variable_order {
    type: number
    sql: ${TABLE}.variable_order ;;
  }

 dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }

  measure: value_total {
    type: sum
    sql: ${value} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
