# The name of this view in Looker is "Geo Puf"
view: geo_puf {
  derived_table: {
    sql:
select year, state, county, value, attribute as variable ,
(case
 when attribute='BENES_WTH_PTAPTB_CNT' then 'Total Medicare beneficiaries'
when attribute ='BENES_FFS_CNT' then  "Medicare Fee-for-Service beneficiaries"
when  attribute ='BENES_MA_CNT' then "Beneficiaries who are ever enrolled in a Medicare Advantage (MA) program"
when attribute ='BENE_DUAL_PCT' then "Percent eligible for Medicaid (DUALS)"
when attribute = 'BENE_MALE_PCT' then "Percent of Medicare Fee-for-Service beneficiaries who are male"
when attribute= 'BENE_FEML_PCT' then "Percent of Medicare Fee-for-Service beneficiaries who are female"
when attribute= 'BENE_RACE_WHT_PCT' then "Percent of Medicare Fee-for-Service beneficiaries who are Non-Hispanic White"
when attribute= 'BENE_RACE_BLACK_PCT' then "Percent of Medicare Fee-for-Service beneficiaries who are African American"
when attribute= 'BENE_RACE_HSPNC_PCT' then "Percent of Medicare Fee-for-Service beneficiaries who are Hispanic"
when attribute= 'BENE_RACE_OTHR_PCT' then "Percent of Medicare Fee-for-Service beneficiaries who are other race/ethnicity or whose race/ethnicity is unknown"
when attribute = 'BENES_IP_CVRD_STAY_CNT' then "Number of beneficiaries using Hospital Inpatient (IP)services with at least one covered stay"
when attribute= 'IP_CVRD_DAYS_PER_1000_BENES' then "Hospital Inpatient (IP) covered days per 1,000 Medicare Beneficiaries"
when attribute = 'IP_CVRD_STAYS_PER_1000_BENES' then "Hospital Inpatient (IP) covered admissions per 1,000 Medicare Beneficiaries"
when attribute = 'ACUTE_HOSP_READMSN_CNT' then "Count of inpatient readmissions within 30 days of an acute hospital stay"
when attribute = 'ACUTE_HOSP_READMSN_PCT' then "Percent of inpatient readmissions within 30 days of an acute hospital stay"
when attribute ='BENES_ER_VISITS_CNT' then "Count of inpatient or hospital outpatient Emergency Department Visits"
when attribute = 'ER_VISITS_PER_1000_BENES' then "Inpatient or hospital outpatient Emergency Department Visits per 1,000 Medicare Beneficiaries"
when attribute = 'IMGNG_EVNTS_PER_1000_BENES' then "Imaging events per 1,000 Medicare Beneficiaries"
when attribute ='TOT_MDCR_STDZD_PYMT_PC' then "Per capita Medicare payment, adjusted for geographic differences in payment rates"
when attribute = 'PTB_DRUGS_MDCR_STDZD_PYMT_PC' then "Part B Drug per capita Medicare payments,adjusted for geographic differences in payment rates"
when attribute = 'TOT_MDCR_STDZD_PYMT_AMT' then "Total amount that Medicare paid adjusted for geographic differences in payment rates"
when attribute = 'IP_MDCR_STDZD_PYMT_AMT' then "Hospital Inpatient (IP) Medicare payment,adjusted for geographic differences in payment rates"
when attribute ='OP_MDCR_STDZD_PYMT_AMT' then "Hospital Outpatient (OP) Medicare payment,adjusted for geographic differences in payment rates"
when attribute ='PQI03_DBTS_AGE_LT_65'then "Prevention Quality Indicator (PQI) 3: Hospital admissions for Diabetes Long-Term complications for Medicare beneficiaries ages less than 65 per 100,000 beneficiaries"
when attribute= 'PQI03_DBTS_AGE_65_74' then "Prevention Quality Indicator (PQI) 3: Hospital admissions for Diabetes Long-Term complications for Medicare beneficiaries ages 65-74 per 100,000 beneficiaries"
when attribute ='PQI03_DBTS_AGE_GE_75' then "Prevention Quality Indicator (PQI) 3: Hospital admissions for Diabetes Long-Term complications for Medicare beneficiaries ages 75 and older per 100,000 beneficiaries"
end
) as variable_label,
(case
 when attribute='BENES_WTH_PTAPTB_CNT' then 0
when attribute ='BENES_FFS_CNT' then  1
when  attribute ='BENES_MA_CNT' then 2
when attribute ='BENE_DUAL_PCT' then 3
when attribute = 'BENE_MALE_PCT' then 4
when attribute= 'BENE_FEML_PCT' then 5
when attribute= 'BENE_RACE_WHT_PCT' then 6
when attribute= 'BENE_RACE_BLACK_PCT' then 7
when attribute= 'BENE_RACE_HSPNC_PCT' then 8
when attribute= 'BENE_RACE_OTHR_PCT' then 9
when attribute = 'BENES_IP_CVRD_STAY_CNT' then 10
when attribute= 'IP_CVRD_DAYS_PER_1000_BENES' then 11
when attribute = 'IP_CVRD_STAYS_PER_1000_BENES' then 12
when attribute = 'ACUTE_HOSP_READMSN_CNT' then 13
when attribute = 'ACUTE_HOSP_READMSN_PCT' then 14
when attribute ='BENES_ER_VISITS_CNT' then 15
when attribute = 'ER_VISITS_PER_1000_BENES' then 16
when attribute = 'IMGNG_EVNTS_PER_1000_BENES' then 17
when attribute ='TOT_MDCR_STDZD_PYMT_PC' then 18
when attribute = 'PTB_DRUGS_MDCR_STDZD_PYMT_PC' then 19
when attribute = 'TOT_MDCR_STDZD_PYMT_AMT' then 20
when attribute = 'IP_MDCR_STDZD_PYMT_AMT' then 21
when attribute ='OP_MDCR_STDZD_PYMT_AMT' then 22
when attribute ='PQI03_DBTS_AGE_LT_65'then 23
when attribute= 'PQI03_DBTS_AGE_65_74' then 24
when attribute ='PQI03_DBTS_AGE_GE_75' then 25
end
) as variable_order

from (
SELECT year, state, county, value, attribute FROM `dil-demo-352614.hcc_prevalence.geo_puf`
UNPIVOT(value FOR attribute IN (BENES_FFS_CNT ,BENES_MA_CNT,
BENES_IP_CVRD_STAY_CNT,IP_CVRD_DAYS_PER_1000_BENES, IP_CVRD_STAYS_PER_1000_BENES,
ACUTE_HOSP_READMSN_CNT, BENES_ER_VISITS_CNT,BENES_WTH_PTAPTB_CNT,ER_VISITS_PER_1000_BENES,
IMGNG_EVNTS_PER_1000_BENES))
union all
SELECT year, state, county, value, attribute FROM `dil-demo-352614.hcc_prevalence.geo_puf`
UNPIVOT(value FOR attribute IN (TOT_MDCR_STDZD_PYMT_AMT ,IP_MDCR_STDZD_PYMT_AMT,OP_MDCR_STDZD_PYMT_AMT,
BENE_DUAL_PCT,BENE_MALE_PCT,BENE_FEML_PCT,BENE_RACE_WHT_PCT,BENE_RACE_BLACK_PCT,BENE_RACE_HSPNC_PCT,
BENE_RACE_OTHR_PCT,ACUTE_HOSP_READMSN_PCT,TOT_MDCR_STDZD_PYMT_PC,PTB_DRUGS_MDCR_STDZD_PYMT_PC))
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

  dimension: primary_key {
    type: string
    primary_key: yes
    sql: ${state} || ${county} || ${year} ;;
  }

  measure: value_total {
    type: sum
    label: "value"
    sql: ${value} ;;
  }

  measure: total_value {
    type: sum
    sql: ${value} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
