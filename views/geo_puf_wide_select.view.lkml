# The name of this view in Looker is "Geo Puf"
view: geo_puf_wide_select {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `dil-demo-352614.hcc_prevalence.geo_puf`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Acute Hosp Readmsn Cnt" in Explore.

  dimension: acute_hosp_readmsn_cnt {
    type: number
    sql: ${TABLE}.ACUTE_HOSP_READMSN_CNT ;;
  }

  dimension: acute_hosp_readmsn_pct {
    type: number
    value_format: "0.0%"
    sql: ${TABLE}.ACUTE_HOSP_READMSN_PCT ;;
  }

  dimension: acute_hosp_readmsn_pct_bucket  {

    sql: round((ROUND(${acute_hosp_readmsn_pct}/0.01, 0) * 0.01    ) ,2)  ||'-'||  round((  ROUND(${acute_hosp_readmsn_pct}/ 0.01, 0) * 0.01+ 0.01  )  ,2)            ;;
    order_by_field:acute_hosp_readmsn_pct_bucket_sort

  }
  dimension: acute_hosp_readmsn_pct_bucket_sort {
    sql:   ROUND(${acute_hosp_readmsn_pct}/0.01, 0) * 0.01;;
    type: number
    hidden: no

  }

  dimension: amblnc_evnts_per_1000_benes {
    type: number
    sql: ${TABLE}.AMBLNC_EVNTS_PER_1000_BENES ;;
  }

  dimension: amblnc_mdcr_pymt_amt {
    type: number
    sql: ${TABLE}.AMBLNC_MDCR_PYMT_AMT ;;
  }

  dimension: amblnc_mdcr_pymt_pc {
    type: number
    sql: ${TABLE}.AMBLNC_MDCR_PYMT_PC ;;
  }

  dimension: amblnc_mdcr_pymt_pct {
    type: number
    sql: ${TABLE}.AMBLNC_MDCR_PYMT_PCT ;;
  }

  dimension: amblnc_mdcr_pymt_per_user {
    type: number
    sql: ${TABLE}.AMBLNC_MDCR_PYMT_PER_USER ;;
  }

  dimension: amblnc_mdcr_stdzd_pymt_amt {
    type: number
    sql: ${TABLE}.AMBLNC_MDCR_STDZD_PYMT_AMT ;;
  }

  dimension: amblnc_mdcr_stdzd_pymt_pc {
    type: number
    sql: ${TABLE}.AMBLNC_MDCR_STDZD_PYMT_PC ;;
  }

  dimension: amblnc_mdcr_stdzd_pymt_pct {
    type: number
    sql: ${TABLE}.AMBLNC_MDCR_STDZD_PYMT_PCT ;;
  }

  dimension: amblnc_mdcr_stdzd_pymt_per_user {
    type: number
    sql: ${TABLE}.AMBLNC_MDCR_STDZD_PYMT_PER_USER ;;
  }

  dimension: asc_events_per_1000_benes {
    type: number
    sql: ${TABLE}.ASC_EVENTS_PER_1000_BENES ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_asc_events_per_1000_benes {
    type: sum
    sql: ${asc_events_per_1000_benes} ;;
  }

  measure: average_asc_events_per_1000_benes {
    type: average
    sql: ${asc_events_per_1000_benes} ;;
  }

  dimension: asc_mdcr_pymt_amt {
    type: number
    sql: ${TABLE}.ASC_MDCR_PYMT_AMT ;;
  }

  dimension: asc_mdcr_pymt_pc {
    type: number
    sql: ${TABLE}.ASC_MDCR_PYMT_PC ;;
  }

  dimension: asc_mdcr_pymt_pct {
    type: number
    sql: ${TABLE}.ASC_MDCR_PYMT_PCT ;;
  }

  dimension: asc_mdcr_pymt_per_user {
    type: number
    sql: ${TABLE}.ASC_MDCR_PYMT_PER_USER ;;
  }

  dimension: asc_mdcr_stdzd_pymt_amt {
    type: number
    sql: ${TABLE}.ASC_MDCR_STDZD_PYMT_AMT ;;
  }

  dimension: asc_mdcr_stdzd_pymt_pc {
    type: number
    sql: ${TABLE}.ASC_MDCR_STDZD_PYMT_PC ;;
  }

  dimension: asc_mdcr_stdzd_pymt_pct {
    type: number
    sql: ${TABLE}.ASC_MDCR_STDZD_PYMT_PCT ;;
  }

  dimension: asc_mdcr_stdzd_pymt_per_user {
    type: number
    sql: ${TABLE}.ASC_MDCR_STDZD_PYMT_PER_USER ;;
  }

  dimension: bene_age_lvl {
    type: string
    sql: ${TABLE}.BENE_AGE_LVL ;;
  }

  dimension: bene_avg_age {
    type: number
    sql: ${TABLE}.BENE_AVG_AGE ;;
  }

  dimension: bene_avg_risk_scre {
    type: number
    sql: ${TABLE}.BENE_AVG_RISK_SCRE ;;
  }

  dimension: bene_dual_pct {
    type: number
    value_format: "0.0%"
    sql: ${TABLE}.BENE_DUAL_PCT ;;
  }

  dimension: bene_feml_pct {
    type: number
    sql: ${TABLE}.BENE_FEML_PCT ;;
  }

  dimension: bene_geo_cd {
    type: number
    sql: ${TABLE}.BENE_GEO_CD ;;
  }

  dimension: bene_geo_desc {
    type: string
    sql: ${TABLE}.BENE_GEO_DESC ;;
  }

  dimension: bene_geo_lvl {
    type: string
    sql: ${TABLE}.BENE_GEO_LVL ;;
  }

  dimension: bene_male_pct {
    type: number
    sql: ${TABLE}.BENE_MALE_PCT ;;
  }

  dimension: bene_race_black_pct {
    type: number
    sql: ${TABLE}.BENE_RACE_BLACK_PCT ;;
  }

  dimension: bene_race_hspnc_pct {
    type: number
    sql: ${TABLE}.BENE_RACE_HSPNC_PCT ;;
  }

  dimension: bene_race_othr_pct {
    type: number
    sql: ${TABLE}.BENE_RACE_OTHR_PCT ;;
  }

  dimension: bene_race_wht_pct {
    type: number
    sql: ${TABLE}.BENE_RACE_WHT_PCT ;;
  }

  dimension: benes_amblnc_cnt {
    type: number
    sql: ${TABLE}.BENES_AMBLNC_CNT ;;
  }

  dimension: benes_amblnc_pct {
    type: number
    sql: ${TABLE}.BENES_AMBLNC_PCT ;;
  }

  dimension: benes_asc_cnt {
    type: number
    sql: ${TABLE}.BENES_ASC_CNT ;;
  }

  dimension: benes_asc_pct {
    type: number
    sql: ${TABLE}.BENES_ASC_PCT ;;
  }

  dimension: benes_dme_cnt {
    type: number
    sql: ${TABLE}.BENES_DME_CNT ;;
  }

  dimension: benes_dme_pct {
    type: number
    sql: ${TABLE}.BENES_DME_PCT ;;
  }

  dimension: benes_em_cnt {
    type: number
    sql: ${TABLE}.BENES_EM_CNT ;;
  }

  dimension: benes_em_pct {
    type: number
    sql: ${TABLE}.BENES_EM_PCT ;;
  }

  dimension: benes_er_visits_cnt {
    type: number
    sql: ${TABLE}.BENES_ER_VISITS_CNT ;;
  }

  dimension: benes_er_visits_pct {
    type: number
    sql: ${TABLE}.BENES_ER_VISITS_PCT ;;
  }

  dimension: benes_ffs_cnt {
    type: number
    sql: ${TABLE}.BENES_FFS_CNT ;;
  }

  dimension: benes_fqhc_rhc_cnt {
    type: number
    sql: ${TABLE}.BENES_FQHC_RHC_CNT ;;
  }

  dimension: benes_fqhc_rhc_pct {
    type: number
    sql: ${TABLE}.BENES_FQHC_RHC_PCT ;;
  }

  dimension: benes_hh_cnt {
    type: number
    sql: ${TABLE}.BENES_HH_CNT ;;
  }

  dimension: benes_hh_pct {
    type: number
    sql: ${TABLE}.BENES_HH_PCT ;;
  }

  dimension: benes_hospc_cnt {
    type: number
    sql: ${TABLE}.BENES_HOSPC_CNT ;;
  }

  dimension: benes_hospc_pct {
    type: number
    sql: ${TABLE}.BENES_HOSPC_PCT ;;
  }

  dimension: benes_imgng_cnt {
    type: number
    sql: ${TABLE}.BENES_IMGNG_CNT ;;
  }

  dimension: benes_imgng_pct {
    type: number
    sql: ${TABLE}.BENES_IMGNG_PCT ;;
  }

  dimension: benes_ip_cvrd_stay_cnt {
    type: number
    sql: ${TABLE}.BENES_IP_CVRD_STAY_CNT ;;
  }

  dimension: benes_ip_pct {
    type: number
    sql: ${TABLE}.BENES_IP_PCT ;;
  }

  dimension: benes_irf_cnt {
    type: number
    sql: ${TABLE}.BENES_IRF_CNT ;;
  }

  dimension: benes_irf_pct {
    type: number
    sql: ${TABLE}.BENES_IRF_PCT ;;
  }

  dimension: benes_ltch_cnt {
    type: number
    sql: ${TABLE}.BENES_LTCH_CNT ;;
  }

  dimension: benes_ltch_pct {
    type: number
    sql: ${TABLE}.BENES_LTCH_PCT ;;
  }

  dimension: benes_ma_cnt {
    type: number
    sql: ${TABLE}.BENES_MA_CNT ;;
  }

  dimension: benes_op_cnt {
    type: number
    sql: ${TABLE}.BENES_OP_CNT ;;
  }

  dimension: benes_op_dlys_cnt {
    type: number
    sql: ${TABLE}.BENES_OP_DLYS_CNT ;;
  }

  dimension: benes_op_dlys_pct {
    type: number
    sql: ${TABLE}.BENES_OP_DLYS_PCT ;;
  }

  dimension: benes_op_pct {
    type: number
    sql: ${TABLE}.BENES_OP_PCT ;;
  }

  dimension: benes_prcdrs_cnt {
    type: number
    sql: ${TABLE}.BENES_PRCDRS_CNT ;;
  }

  dimension: benes_prcdrs_pct {
    type: number
    sql: ${TABLE}.BENES_PRCDRS_PCT ;;
  }

  dimension: benes_ptb_drugs_cnt {
    type: number
    sql: ${TABLE}.BENES_PTB_DRUGS_CNT ;;
  }

  dimension: benes_ptb_drugs_pct {
    type: number
    sql: ${TABLE}.BENES_PTB_DRUGS_PCT ;;
  }

  dimension: benes_snf_cnt {
    type: number
    sql: ${TABLE}.BENES_SNF_CNT ;;
  }

  dimension: benes_snf_pct {
    type: number
    sql: ${TABLE}.BENES_SNF_PCT ;;
  }

  dimension: benes_test_pct {
    type: number
    sql: ${TABLE}.BENES_TEST_PCT ;;
  }

  dimension: benes_tests_cnt {
    type: number
    sql: ${TABLE}.BENES_TESTS_CNT ;;
  }

  dimension: benes_wth_ptaptb_cnt {
    type: number
    sql: ${TABLE}.BENES_WTH_PTAPTB_CNT ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.County ;;
  }

  dimension: dme_evnts_per_1000_benes {
    type: number
    sql: ${TABLE}.DME_EVNTS_PER_1000_BENES ;;
  }

  dimension: dme_mdcr_pymt_amt {
    type: number
    sql: ${TABLE}.DME_MDCR_PYMT_AMT ;;
  }

  dimension: dme_mdcr_pymt_pc {
    type: number
    sql: ${TABLE}.DME_MDCR_PYMT_PC ;;
  }

  dimension: dme_mdcr_pymt_pct {
    type: number
    sql: ${TABLE}.DME_MDCR_PYMT_PCT ;;
  }

  dimension: dme_mdcr_pymt_per_user {
    type: number
    sql: ${TABLE}.DME_MDCR_PYMT_PER_USER ;;
  }

  dimension: dme_mdcr_stdzd_pymt_amt {
    type: number
    sql: ${TABLE}.DME_MDCR_STDZD_PYMT_AMT ;;
  }

  dimension: dme_mdcr_stdzd_pymt_pc {
    type: number
    sql: ${TABLE}.DME_MDCR_STDZD_PYMT_PC ;;
  }

  dimension: dme_mdcr_stdzd_pymt_pct {
    type: number
    sql: ${TABLE}.DME_MDCR_STDZD_PYMT_PCT ;;
  }

  dimension: dme_mdcr_stdzd_pymt_per_user {
    type: number
    sql: ${TABLE}.DME_MDCR_STDZD_PYMT_PER_USER ;;
  }

  dimension: em_evnts_per_1000_benes {
    type: number
    sql: ${TABLE}.EM_EVNTS_PER_1000_BENES ;;
  }

  dimension: em_mdcr_pymt_amt {
    type: number
    sql: ${TABLE}.EM_MDCR_PYMT_AMT ;;
  }

  dimension: em_mdcr_pymt_pc {
    type: number
    sql: ${TABLE}.EM_MDCR_PYMT_PC ;;
  }

  dimension: em_mdcr_pymt_pct {
    type: number
    sql: ${TABLE}.EM_MDCR_PYMT_PCT ;;
  }

  dimension: em_mdcr_pymt_per_user {
    type: number
    sql: ${TABLE}.EM_MDCR_PYMT_PER_USER ;;
  }

  dimension: em_mdcr_stdzd_pymt_amt {
    type: number
    sql: ${TABLE}.EM_MDCR_STDZD_PYMT_AMT ;;
  }

  dimension: em_mdcr_stdzd_pymt_pc {
    type: number
    sql: ${TABLE}.EM_MDCR_STDZD_PYMT_PC ;;
  }

  dimension: em_mdcr_stdzd_pymt_pct {
    type: number
    sql: ${TABLE}.EM_MDCR_STDZD_PYMT_PCT ;;
  }

  dimension: em_mdcr_stdzd_pymt_per_user {
    type: number
    sql: ${TABLE}.EM_MDCR_STDZD_PYMT_PER_USER ;;
  }

  dimension: er_visits_per_1000_benes {
    type: number
    sql: ${TABLE}.ER_VISITS_PER_1000_BENES ;;
  }

    dimension: er_visits_per_1000_benes_bucket  {

      sql: (ROUND(${er_visits_per_1000_benes}/10, 0) * 10    )   ||'-'||(  ROUND(${er_visits_per_1000_benes}/ 10, 0) * 10 + 10  )              ;;
      order_by_field:er_visits_per_1000_benes_bucket_sort

    }
    dimension: er_visits_per_1000_benes_bucket_sort {
      sql:   ROUND(${er_visits_per_1000_benes}/10, 0) * 10;;
      type: number
      hidden: no

    }

  measure: total_er_visits_per_1000_benes {
    type: sum
    sql: ${er_visits_per_1000_benes} ;;
  }

  dimension: fqhc_rhc_mdcr_pymt_amt {
    type: number
    sql: ${TABLE}.FQHC_RHC_MDCR_PYMT_AMT ;;
  }

  dimension: fqhc_rhc_mdcr_pymt_pc {
    type: number
    sql: ${TABLE}.FQHC_RHC_MDCR_PYMT_PC ;;
  }

  dimension: fqhc_rhc_mdcr_pymt_pct {
    type: number
    sql: ${TABLE}.FQHC_RHC_MDCR_PYMT_PCT ;;
  }

  dimension: fqhc_rhc_mdcr_pymt_per_user {
    type: number
    sql: ${TABLE}.FQHC_RHC_MDCR_PYMT_PER_USER ;;
  }

  dimension: fqhc_rhc_mdcr_stdzd_pymt_amt {
    type: number
    sql: ${TABLE}.FQHC_RHC_MDCR_STDZD_PYMT_AMT ;;
  }

  dimension: fqhc_rhc_mdcr_stdzd_pymt_pc {
    type: number
    sql: ${TABLE}.FQHC_RHC_MDCR_STDZD_PYMT_PC ;;
  }

  dimension: fqhc_rhc_mdcr_stdzd_pymt_pct {
    type: number
    sql: ${TABLE}.FQHC_RHC_MDCR_STDZD_PYMT_PCT ;;
  }

  dimension: fqhc_rhc_mdcr_stdzd_pymt_pu {
    type: number
    sql: ${TABLE}.FQHC_RHC_MDCR_STDZD_PYMT_PU ;;
  }

  dimension: fqhc_rhc_visits_per_1000_benes {
    type: number
    sql: ${TABLE}.FQHC_RHC_VISITS_PER_1000_BENES ;;
  }

  dimension: hh_cvrd_stays_per_1000_benes {
    type: number
    sql: ${TABLE}.HH_CVRD_STAYS_PER_1000_BENES ;;
  }

  dimension: hh_mdcr_pymt_amt {
    type: number
    sql: ${TABLE}.HH_MDCR_PYMT_AMT ;;
  }

  dimension: hh_mdcr_pymt_pc {
    type: number
    sql: ${TABLE}.HH_MDCR_PYMT_PC ;;
  }

  dimension: hh_mdcr_pymt_pct {
    type: number
    sql: ${TABLE}.HH_MDCR_PYMT_PCT ;;
  }

  dimension: hh_mdcr_pymt_per_user {
    type: number
    sql: ${TABLE}.HH_MDCR_PYMT_PER_USER ;;
  }

  dimension: hh_mdcr_stdzd_pymt_amt {
    type: number
    sql: ${TABLE}.HH_MDCR_STDZD_PYMT_AMT ;;
  }

  dimension: hh_mdcr_stdzd_pymt_pc {
    type: number
    sql: ${TABLE}.HH_MDCR_STDZD_PYMT_PC ;;
  }

  dimension: hh_mdcr_stdzd_pymt_pct {
    type: number
    sql: ${TABLE}.HH_MDCR_STDZD_PYMT_PCT ;;
  }

  dimension: hh_mdcr_stdzd_pymt_per_user {
    type: number
    sql: ${TABLE}.HH_MDCR_STDZD_PYMT_PER_USER ;;
  }

  dimension: hh_visits_per_1000_benes {
    type: number
    sql: ${TABLE}.HH_VISITS_PER_1000_BENES ;;
  }

  dimension: hospc_cvrd_days_per_1000_benes {
    type: number
    sql: ${TABLE}.HOSPC_CVRD_DAYS_PER_1000_BENES ;;
  }

  dimension: hospc_cvrd_stays_per_1000_benes {
    type: number
    sql: ${TABLE}.HOSPC_CVRD_STAYS_PER_1000_BENES ;;
  }

  dimension: hospc_mdcr_pymt_amt {
    type: number
    sql: ${TABLE}.HOSPC_MDCR_PYMT_AMT ;;
  }

  dimension: hospc_mdcr_pymt_pc {
    type: number
    sql: ${TABLE}.HOSPC_MDCR_PYMT_PC ;;
  }

  dimension: hospc_mdcr_pymt_pct {
    type: number
    sql: ${TABLE}.HOSPC_MDCR_PYMT_PCT ;;
  }

  dimension: hospc_mdcr_pymt_per_user {
    type: number
    sql: ${TABLE}.HOSPC_MDCR_PYMT_PER_USER ;;
  }

  dimension: hospc_mdcr_stdzd_pymt_amt {
    type: number
    sql: ${TABLE}.HOSPC_MDCR_STDZD_PYMT_AMT ;;
  }

  dimension: hospc_mdcr_stdzd_pymt_pc {
    type: number
    sql: ${TABLE}.HOSPC_MDCR_STDZD_PYMT_PC ;;
  }

  dimension: hospc_mdcr_stdzd_pymt_pct {
    type: number
    sql: ${TABLE}.HOSPC_MDCR_STDZD_PYMT_PCT ;;
  }

  dimension: hospc_mdcr_stdzd_pymt_per_user {
    type: number
    sql: ${TABLE}.HOSPC_MDCR_STDZD_PYMT_PER_USER ;;
  }

  dimension: imgng_evnts_per_1000_benes {
    type: number
    sql: ${TABLE}.IMGNG_EVNTS_PER_1000_BENES ;;
  }

  dimension: imgng_evnts_per_1000_benes_bucket  {

    sql: (ROUND(${imgng_evnts_per_1000_benes}/100, 0) * 100    )   ||'-'||(  ROUND(${imgng_evnts_per_1000_benes}/ 100, 0) * 100 + 100  )              ;;
    order_by_field:imgng_evnts_per_1000_benes_bucket_sort

  }
  dimension: imgng_evnts_per_1000_benes_bucket_sort {
    sql:   ROUND(${imgng_evnts_per_1000_benes}/100, 0) * 100;;
    type: number
    hidden: no

  }


  measure: total_imgng_evnts_per_1000_benes {
    type: sum
    sql: ${imgng_evnts_per_1000_benes} ;;
  }

  dimension: imgng_mdcr_pymt_amt {
    type: number
    sql: ${TABLE}.IMGNG_MDCR_PYMT_AMT ;;
  }

  dimension: imgng_mdcr_pymt_pc {
    type: number
    sql: ${TABLE}.IMGNG_MDCR_PYMT_PC ;;
  }

  dimension: imgng_mdcr_pymt_pct {
    type: number
    sql: ${TABLE}.IMGNG_MDCR_PYMT_PCT ;;
  }

  dimension: imgng_mdcr_pymt_per_user {
    type: number
    sql: ${TABLE}.IMGNG_MDCR_PYMT_PER_USER ;;
  }

  dimension: imgng_mdcr_stdzd_pymt_amt {
    type: number
    sql: ${TABLE}.IMGNG_MDCR_STDZD_PYMT_AMT ;;
  }

  dimension: imgng_mdcr_stdzd_pymt_pc {
    type: number
    sql: ${TABLE}.IMGNG_MDCR_STDZD_PYMT_PC ;;
  }

  dimension: imgng_mdcr_stdzd_pymt_pct {
    type: number
    sql: ${TABLE}.IMGNG_MDCR_STDZD_PYMT_PCT ;;
  }

  dimension: imgng_mdcr_stdzd_pymt_per_user {
    type: number
    sql: ${TABLE}.IMGNG_MDCR_STDZD_PYMT_PER_USER ;;
  }

  dimension: int64_field_0 {
    type: number
    sql: ${TABLE}.int64_field_0 ;;
  }

  dimension: ip_cvrd_days_per_1000_benes {
    type: number
    sql: ${TABLE}.IP_CVRD_DAYS_PER_1000_BENES ;;
  }

  dimension: ip_cvrd_stays_per_1000_benes {
    type: number
    sql: ${TABLE}.IP_CVRD_STAYS_PER_1000_BENES ;;
  }

  dimension: ip_mdcr_pymt_amt {
    type: number
    sql: ${TABLE}.IP_MDCR_PYMT_AMT ;;
  }

  dimension: ip_mdcr_pymt_pc {
    type: number
    sql: ${TABLE}.IP_MDCR_PYMT_PC ;;
  }

  dimension: ip_mdcr_pymt_pct {
    type: number
    sql: ${TABLE}.IP_MDCR_PYMT_PCT ;;
  }

  dimension: ip_mdcr_pymt_per_user {
    type: number
    sql: ${TABLE}.IP_MDCR_PYMT_PER_USER ;;
  }

  dimension: ip_mdcr_stdzd_pymt_amt {
    type: number
    sql: ${TABLE}.IP_MDCR_STDZD_PYMT_AMT ;;
  }

  dimension: ip_mdcr_stdzd_pymt_pc {
    type: number
    sql: ${TABLE}.IP_MDCR_STDZD_PYMT_PC ;;
  }

  dimension: ip_mdcr_stdzd_pymt_pct {
    type: number
    sql: ${TABLE}.IP_MDCR_STDZD_PYMT_PCT ;;
  }

  dimension: ip_mdcr_stdzd_pymt_per_user {
    type: number
    sql: ${TABLE}.IP_MDCR_STDZD_PYMT_PER_USER ;;
  }

  dimension: irf_cvrd_days_per_1000_benes {
    type: number
    sql: ${TABLE}.IRF_CVRD_DAYS_PER_1000_BENES ;;
  }

  dimension: irf_cvrd_stays_per_1000_benes {
    type: number
    sql: ${TABLE}.IRF_CVRD_STAYS_PER_1000_BENES ;;
  }

  dimension: irf_mdcr_pymt_amt {
    type: number
    sql: ${TABLE}.IRF_MDCR_PYMT_AMT ;;
  }

  dimension: irf_mdcr_pymt_pc {
    type: number
    sql: ${TABLE}.IRF_MDCR_PYMT_PC ;;
  }

  dimension: irf_mdcr_pymt_pct {
    type: number
    sql: ${TABLE}.IRF_MDCR_PYMT_PCT ;;
  }

  dimension: irf_mdcr_pymt_per_user {
    type: number
    sql: ${TABLE}.IRF_MDCR_PYMT_PER_USER ;;
  }

  dimension: irf_mdcr_stdzd_pymt_amt {
    type: number
    sql: ${TABLE}.IRF_MDCR_STDZD_PYMT_AMT ;;
  }

  dimension: irf_mdcr_stdzd_pymt_pc {
    type: number
    sql: ${TABLE}.IRF_MDCR_STDZD_PYMT_PC ;;
  }

  dimension: irf_mdcr_stdzd_pymt_pct {
    type: number
    sql: ${TABLE}.IRF_MDCR_STDZD_PYMT_PCT ;;
  }

  dimension: irf_mdcr_stdzd_pymt_per_user {
    type: number
    sql: ${TABLE}.IRF_MDCR_STDZD_PYMT_PER_USER ;;
  }

  dimension: ltch_cvrd_days_per_1000_benes {
    type: number
    sql: ${TABLE}.LTCH_CVRD_DAYS_PER_1000_BENES ;;
  }

  dimension: ltch_cvrd_stays_per_1000_benes {
    type: number
    sql: ${TABLE}.LTCH_CVRD_STAYS_PER_1000_BENES ;;
  }

  dimension: ltch_mdcr_pymt_amt {
    type: number
    sql: ${TABLE}.LTCH_MDCR_PYMT_AMT ;;
  }

  dimension: ltch_mdcr_pymt_pc {
    type: number
    sql: ${TABLE}.LTCH_MDCR_PYMT_PC ;;
  }

  dimension: ltch_mdcr_pymt_pct {
    type: number
    sql: ${TABLE}.LTCH_MDCR_PYMT_PCT ;;
  }

  dimension: ltch_mdcr_pymt_per_user {
    type: number
    sql: ${TABLE}.LTCH_MDCR_PYMT_PER_USER ;;
  }

  dimension: ltch_mdcr_stdzd_pymt_amt {
    type: number
    sql: ${TABLE}.LTCH_MDCR_STDZD_PYMT_AMT ;;
  }

  dimension: ltch_mdcr_stdzd_pymt_pc {
    type: number
    sql: ${TABLE}.LTCH_MDCR_STDZD_PYMT_PC ;;
  }

  dimension: ltch_mdcr_stdzd_pymt_pct {
    type: number
    sql: ${TABLE}.LTCH_MDCR_STDZD_PYMT_PCT ;;
  }

  dimension: ltch_mdcr_stdzd_pymt_per_user {
    type: number
    sql: ${TABLE}.LTCH_MDCR_STDZD_PYMT_PER_USER ;;
  }

  dimension: ma_prtcptn_rate {
    type: number
    sql: ${TABLE}.MA_PRTCPTN_RATE ;;
  }

  dimension: op_dlys_evnts_per_1000_benes {
    type: number
    sql: ${TABLE}.OP_DLYS_EVNTS_PER_1000_BENES ;;
  }

  dimension: op_dlys_mdcr_pymt_amt {
    type: number
    sql: ${TABLE}.OP_DLYS_MDCR_PYMT_AMT ;;
  }

  dimension: op_dlys_mdcr_pymt_pc {
    type: number
    sql: ${TABLE}.OP_DLYS_MDCR_PYMT_PC ;;
  }

  dimension: op_dlys_mdcr_pymt_pct {
    type: number
    sql: ${TABLE}.OP_DLYS_MDCR_PYMT_PCT ;;
  }

  dimension: op_dlys_mdcr_pymt_per_user {
    type: number
    sql: ${TABLE}.OP_DLYS_MDCR_PYMT_PER_USER ;;
  }

  dimension: op_dlys_mdcr_stdzd_pymt_amt {
    type: number
    sql: ${TABLE}.OP_DLYS_MDCR_STDZD_PYMT_AMT ;;
  }

  dimension: op_dlys_mdcr_stdzd_pymt_pc {
    type: number
    sql: ${TABLE}.OP_DLYS_MDCR_STDZD_PYMT_PC ;;
  }

  dimension: op_dlys_mdcr_stdzd_pymt_pct {
    type: number
    sql: ${TABLE}.OP_DLYS_MDCR_STDZD_PYMT_PCT ;;
  }

  dimension: op_dlys_mdcr_stdzd_pymt_per_user {
    type: number
    sql: ${TABLE}.OP_DLYS_MDCR_STDZD_PYMT_PER_USER ;;
  }

  dimension: op_mdcr_pymt_amt {
    type: number
    sql: ${TABLE}.OP_MDCR_PYMT_AMT ;;
  }

  dimension: op_mdcr_pymt_pc {
    type: number
    sql: ${TABLE}.OP_MDCR_PYMT_PC ;;
  }

  dimension: op_mdcr_pymt_pct {
    type: number
    sql: ${TABLE}.OP_MDCR_PYMT_PCT ;;
  }

  dimension: op_mdcr_pymt_per_user {
    type: number
    sql: ${TABLE}.OP_MDCR_PYMT_PER_USER ;;
  }

  dimension: op_mdcr_stdzd_pymt_amt {
    type: number
    sql: ${TABLE}.OP_MDCR_STDZD_PYMT_AMT ;;
  }

  dimension: op_mdcr_stdzd_pymt_pc {
    type: number
    sql: ${TABLE}.OP_MDCR_STDZD_PYMT_PC ;;
  }

  dimension: op_mdcr_stdzd_pymt_pct {
    type: number
    sql: ${TABLE}.OP_MDCR_STDZD_PYMT_PCT ;;
  }

  dimension: op_mdcr_stdzd_pymt_per_user {
    type: number
    sql: ${TABLE}.OP_MDCR_STDZD_PYMT_PER_USER ;;
  }

  dimension: op_visits_per_1000_benes {
    type: number
    sql: ${TABLE}.OP_VISITS_PER_1000_BENES ;;
  }

  dimension: pqi03_dbts_age_65_74 {
    type: string
    sql: ${TABLE}.PQI03_DBTS_AGE_65_74 ;;
  }

  dimension: pqi03_dbts_age_ge_75 {
    type: string
    sql: ${TABLE}.PQI03_DBTS_AGE_GE_75 ;;
  }

  dimension: pqi03_dbts_age_lt_65 {
    type: string
    sql: ${TABLE}.PQI03_DBTS_AGE_LT_65 ;;
  }

  dimension: pqi05_copd_asthma_age_40_64 {
    type: string
    sql: ${TABLE}.PQI05_COPD_ASTHMA_AGE_40_64 ;;
  }

  dimension: pqi05_copd_asthma_age_65_74 {
    type: string
    sql: ${TABLE}.PQI05_COPD_ASTHMA_AGE_65_74 ;;
  }

  dimension: pqi05_copd_asthma_age_ge_75 {
    type: string
    sql: ${TABLE}.PQI05_COPD_ASTHMA_AGE_GE_75 ;;
  }

  dimension: pqi07_hyprtnsn_age_65_74 {
    type: string
    sql: ${TABLE}.PQI07_HYPRTNSN_AGE_65_74 ;;
  }

  dimension: pqi07_hyprtnsn_age_ge_75 {
    type: string
    sql: ${TABLE}.PQI07_HYPRTNSN_AGE_GE_75 ;;
  }

  dimension: pqi07_hyprtnsn_age_lt_65 {
    type: string
    sql: ${TABLE}.PQI07_HYPRTNSN_AGE_LT_65 ;;
  }

  dimension: pqi08_chf_age_65_74 {
    type: string
    sql: ${TABLE}.PQI08_CHF_AGE_65_74 ;;
  }

  dimension: pqi08_chf_age_ge_75 {
    type: string
    sql: ${TABLE}.PQI08_CHF_AGE_GE_75 ;;
  }

  dimension: pqi08_chf_age_lt_65 {
    type: string
    sql: ${TABLE}.PQI08_CHF_AGE_LT_65 ;;
  }

  dimension: pqi10_dhydrtn_age_65_74 {
    type: string
    sql: ${TABLE}.PQI10_DHYDRTN_AGE_65_74 ;;
  }

  dimension: pqi10_dhydrtn_age_ge_75 {
    type: string
    sql: ${TABLE}.PQI10_DHYDRTN_AGE_GE_75 ;;
  }

  dimension: pqi10_dhydrtn_age_lt_65 {
    type: string
    sql: ${TABLE}.PQI10_DHYDRTN_AGE_LT_65 ;;
  }

  dimension: pqi11_bctrl_pna_age_65_74 {
    type: string
    sql: ${TABLE}.PQI11_BCTRL_PNA_AGE_65_74 ;;
  }

  dimension: pqi11_bctrl_pna_age_ge_75 {
    type: string
    sql: ${TABLE}.PQI11_BCTRL_PNA_AGE_GE_75 ;;
  }

  dimension: pqi11_bctrl_pna_age_lt_65 {
    type: string
    sql: ${TABLE}.PQI11_BCTRL_PNA_AGE_LT_65 ;;
  }

  dimension: pqi12_uti_age_65_74 {
    type: string
    sql: ${TABLE}.PQI12_UTI_AGE_65_74 ;;
  }

  dimension: pqi12_uti_age_ge_75 {
    type: string
    sql: ${TABLE}.PQI12_UTI_AGE_GE_75 ;;
  }

  dimension: pqi12_uti_age_lt_65 {
    type: string
    sql: ${TABLE}.PQI12_UTI_AGE_LT_65 ;;
  }

  dimension: pqi15_asthma_age_lt_40 {
    type: string
    sql: ${TABLE}.PQI15_ASTHMA_AGE_LT_40 ;;
  }

  dimension: pqi16_lwrxtrmty_amputn_age_65_74 {
    type: string
    sql: ${TABLE}.PQI16_LWRXTRMTY_AMPUTN_AGE_65_74 ;;
  }

  dimension: pqi16_lwrxtrmty_amputn_age_ge_75 {
    type: string
    sql: ${TABLE}.PQI16_LWRXTRMTY_AMPUTN_AGE_GE_75 ;;
  }

  dimension: pqi16_lwrxtrmty_amputn_age_lt_65 {
    type: string
    sql: ${TABLE}.PQI16_LWRXTRMTY_AMPUTN_AGE_LT_65 ;;
  }

  dimension: prcdr_evnts_per_1000_benes {
    type: number
    sql: ${TABLE}.PRCDR_EVNTS_PER_1000_BENES ;;
  }

  dimension: prcdrs_mdcr_pymt_amt {
    type: number
    sql: ${TABLE}.PRCDRS_MDCR_PYMT_AMT ;;
  }

  dimension: prcdrs_mdcr_pymt_pc {
    type: number
    sql: ${TABLE}.PRCDRS_MDCR_PYMT_PC ;;
  }

  dimension: prcdrs_mdcr_pymt_pct {
    type: number
    sql: ${TABLE}.PRCDRS_MDCR_PYMT_PCT ;;
  }

  dimension: prcdrs_mdcr_pymt_per_user {
    type: number
    sql: ${TABLE}.PRCDRS_MDCR_PYMT_PER_USER ;;
  }

  dimension: prcdrs_mdcr_stdzd_pymt_amt {
    type: number
    sql: ${TABLE}.PRCDRS_MDCR_STDZD_PYMT_AMT ;;
  }

  dimension: prcdrs_mdcr_stdzd_pymt_pc {
    type: number
    sql: ${TABLE}.PRCDRS_MDCR_STDZD_PYMT_PC ;;
  }

  dimension: prcdrs_mdcr_stdzd_pymt_pct {
    type: number
    sql: ${TABLE}.PRCDRS_MDCR_STDZD_PYMT_PCT ;;
  }

  dimension: prcdrs_mdcr_stdzd_pymt_per_user {
    type: number
    sql: ${TABLE}.PRCDRS_MDCR_STDZD_PYMT_PER_USER ;;
  }

  dimension: ptb_drugs_mdcr_pymt_amt {
    type: number
    sql: ${TABLE}.PTB_DRUGS_MDCR_PYMT_AMT ;;
  }

  dimension: ptb_drugs_mdcr_pymt_pc {
    type: number
    value_format: "$0.0"
    sql: ${TABLE}.PTB_DRUGS_MDCR_PYMT_PC ;;
  }

  dimension: ptb_drugs_mdcr_pymt_pct {
    type: number
    sql: ${TABLE}.PTB_DRUGS_MDCR_PYMT_PCT ;;
  }

  dimension: ptb_drugs_mdcr_pymt_pu {
    type: number
    sql: ${TABLE}.PTB_DRUGS_MDCR_PYMT_PU ;;
  }

  dimension: ptb_drugs_mdcr_stdzd_pymt_amt {
    type: number
    sql: ${TABLE}.PTB_DRUGS_MDCR_STDZD_PYMT_AMT ;;
  }

  dimension: ptb_drugs_mdcr_stdzd_pymt_pc {
    type: number
    value_format: "$0.0"
    sql: ${TABLE}.PTB_DRUGS_MDCR_STDZD_PYMT_PC ;;
  }

  dimension: ptb_drugs_mdcr_stdzd_pymt_pc_bucket  {

    sql: (ROUND(${ptb_drugs_mdcr_stdzd_pymt_pc}/50, 0) * 50    )   ||'-'||(  ROUND(${ptb_drugs_mdcr_stdzd_pymt_pc}/ 50, 0) * 50 + 50  )              ;;
    order_by_field:ptb_drugs_mdcr_stdzd_pymt_pc_bucket_sort

  }
  dimension: ptb_drugs_mdcr_stdzd_pymt_pc_bucket_sort {
    sql:   ROUND(${ptb_drugs_mdcr_stdzd_pymt_pc}/50, 0) *50;;
    type: number
    hidden: no

  }



  dimension: ptb_drugs_mdcr_stdzd_pymt_pct {
    type: number
    sql: ${TABLE}.PTB_DRUGS_MDCR_STDZD_PYMT_PCT ;;
  }

  dimension: ptb_drugs_mdcr_stdzd_pymt_pu {
    type: number
    sql: ${TABLE}.PTB_DRUGS_MDCR_STDZD_PYMT_PU ;;
  }

  dimension: ptb_othr_srvcs_mdcr_pymt_amt {
    type: number
    sql: ${TABLE}.PTB_OTHR_SRVCS_MDCR_PYMT_AMT ;;
  }

  dimension: ptb_othr_srvcs_mdcr_stdzd_pymt {
    type: number
    sql: ${TABLE}.PTB_OTHR_SRVCS_MDCR_STDZD_PYMT ;;
  }

  dimension: snf_cvrd_days_per_1000_benes {
    type: number
    sql: ${TABLE}.SNF_CVRD_DAYS_PER_1000_BENES ;;
  }

  dimension: snf_cvrd_stays_per_1000_benes {
    type: number
    sql: ${TABLE}.SNF_CVRD_STAYS_PER_1000_BENES ;;
  }

  dimension: snf_mdcr_pymt_amt {
    type: number
    sql: ${TABLE}.SNF_MDCR_PYMT_AMT ;;
  }

  dimension: snf_mdcr_pymt_pc {
    type: number
    sql: ${TABLE}.SNF_MDCR_PYMT_PC ;;
  }

  dimension: snf_mdcr_pymt_pct {
    type: number
    sql: ${TABLE}.SNF_MDCR_PYMT_PCT ;;
  }

  dimension: snf_mdcr_pymt_per_user {
    type: number
    sql: ${TABLE}.SNF_MDCR_PYMT_PER_USER ;;
  }

  dimension: snf_mdcr_stdzd_pymt_amt {
    type: number
    sql: ${TABLE}.SNF_MDCR_STDZD_PYMT_AMT ;;
  }

  dimension: snf_mdcr_stdzd_pymt_pc {
    type: number
    sql: ${TABLE}.SNF_MDCR_STDZD_PYMT_PC ;;
  }

  dimension: snf_mdcr_stdzd_pymt_pct {
    type: number
    sql: ${TABLE}.SNF_MDCR_STDZD_PYMT_PCT ;;
  }

  dimension: snf_mdcr_stdzd_pymt_per_user {
    type: number
    sql: ${TABLE}.SNF_MDCR_STDZD_PYMT_PER_USER ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }

  dimension: test_evnts_per_1000_benes {
    type: number
    sql: ${TABLE}.TEST_EVNTS_PER_1000_BENES ;;
  }

  dimension: tests_mdcr_pymt_amt {
    type: number
    sql: ${TABLE}.TESTS_MDCR_PYMT_AMT ;;
  }

  dimension: tests_mdcr_pymt_pc {
    type: number
    sql: ${TABLE}.TESTS_MDCR_PYMT_PC ;;
  }

  dimension: tests_mdcr_pymt_pct {
    type: number
    sql: ${TABLE}.TESTS_MDCR_PYMT_PCT ;;
  }

  dimension: tests_mdcr_pymt_per_user {
    type: number
    sql: ${TABLE}.TESTS_MDCR_PYMT_PER_USER ;;
  }

  dimension: tests_mdcr_stdzd_pymt_amt {
    type: number
    sql: ${TABLE}.TESTS_MDCR_STDZD_PYMT_AMT ;;
  }

  dimension: tests_mdcr_stdzd_pymt_pc {
    type: number
    sql: ${TABLE}.TESTS_MDCR_STDZD_PYMT_PC ;;
  }

  dimension: tests_mdcr_stdzd_pymt_pct {
    type: number
    sql: ${TABLE}.TESTS_MDCR_STDZD_PYMT_PCT ;;
  }

  dimension: tests_mdcr_stdzd_pymt_per_user {
    type: number
    sql: ${TABLE}.TESTS_MDCR_STDZD_PYMT_PER_USER ;;
  }

  dimension: tot_mdcr_pymt_amt {
    type: number
    sql: ${TABLE}.TOT_MDCR_PYMT_AMT ;;
  }

  dimension: tot_mdcr_pymt_pc {
    type: number
    sql: ${TABLE}.TOT_MDCR_PYMT_PC ;;
  }

  dimension: tot_mdcr_stdzd_pymt_amt {
    type: number
    sql: ${TABLE}.TOT_MDCR_STDZD_PYMT_AMT ;;
  }

  dimension: tot_mdcr_stdzd_pymt_pc {
    type: number
    value_format: "$0.0,\" K\""
    sql: ${TABLE}.TOT_MDCR_STDZD_PYMT_PC ;;
  }

  dimension: tot_mdcr_stdzd_pymt_pc_bucket  {

    sql: (ROUND(${tot_mdcr_stdzd_pymt_pc}/500, 0) * 500    )   ||'-'||(  ROUND(${tot_mdcr_stdzd_pymt_pc}/ 500, 0) * 500 + 500   )

            ;;
    order_by_field: tot_mdcr_stdzd_pymt_pc_bucket_sort

  }
  dimension: tot_mdcr_stdzd_pymt_pc_bucket_sort {

    sql:

      ROUND(${tot_mdcr_stdzd_pymt_pc}/500, 0) * 500;;

    type: number

    hidden: no

  }

  measure: tot_mdcr_stdzd_pymt_pc_sum {
    type: sum
    value_format: "$0.0,\" K\""
    sql: ${tot_mdcr_stdzd_pymt_pc} ;;

  }

  dimension: tot_mdcr_stdzd_ra_pymt_amt {
    type: number
    sql: ${TABLE}.TOT_MDCR_STDZD_RA_PYMT_AMT ;;
  }

  dimension: tot_mdcr_stdzd_ra_pymt_pc {
    type: number
    sql: ${TABLE}.TOT_MDCR_STDZD_RA_PYMT_PC ;;
  }

  dimension: tot_pbpmt_rdctn_amt {
    type: number
    sql: ${TABLE}.TOT_PBPMT_RDCTN_AMT ;;
  }

  dimension: tot_pbpmt_rdctn_pcc {
    type: number
    sql: ${TABLE}.TOT_PBPMT_RDCTN_PCC ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.YEAR ;;
    value_format: "0"
  }

  measure: count {
    type: count
    drill_fields: []
  }

dimension: samebuck {
  type: string
  sql: case when ${geo_puf_wide.tot_mdcr_stdzd_pymt_pc_bucket}= ${geo_puf_wide_select.tot_mdcr_stdzd_pymt_pc_bucket}  then ${geo_puf_wide_select.county} else " Overall" end ;;
}


  dimension: samebuck_visit {
    type: string
    sql: case when ${geo_puf_wide.er_visits_per_1000_benes_bucket}= ${geo_puf_wide_select.er_visits_per_1000_benes_bucket}  then ${geo_puf_wide_select.county} else " Overall" end ;;
  }

  dimension: samebuck_img {
    type: string
    sql: case when ${geo_puf_wide.imgng_evnts_per_1000_benes_bucket}= ${geo_puf_wide_select.imgng_evnts_per_1000_benes_bucket}  then ${geo_puf_wide_select.county} else " Overall" end ;;
  }

  dimension: samebuck_readmsn {
    type: string
    sql: case when ${geo_puf_wide.acute_hosp_readmsn_pct_bucket}= ${geo_puf_wide_select.acute_hosp_readmsn_pct_bucket}  then ${geo_puf_wide_select.county} else " Overall" end ;;
  }

  dimension: samebuck_ptb {
    type: string
    sql: case when ${geo_puf_wide.ptb_drugs_mdcr_stdzd_pymt_pc_bucket}= ${geo_puf_wide_select.ptb_drugs_mdcr_stdzd_pymt_pc_bucket}  then ${geo_puf_wide_select.county} else " Overall" end ;;
  }

  dimension: primary_key {
    type: string
    primary_key: yes
    sql: ${state} || ${county} || ${year} ;;
  }
}
