# Pfizer Looker Demo — Healthcare Analytics

A LookML project for analyzing Medicare and Medicaid healthcare utilization, disease prevalence (HCC), expenditures, and enrollment trends across US states and counties.

## Tech Stack

- **LookML** — Looker data modeling language
- **Google BigQuery** — data warehouse (`dil-demo-352614.hcc_prevalence`)
- **Looker** — BI/visualization platform

## Project Structure

```
models/
  pfizer_demo.model.lkml        # Main model — defines explores and joins
views/
  hcc_all.view.lkml             # All HCC conditions (union of 8 clinical cohorts)
  hcc_85.view.lkml              # HCC 85 — Congestive Heart Failure
  hcc_18.view.lkml              # HCC 18 — Diabetes
  hcc_111.view.lkml             # HCC 111 — COPD
  hcc_by_county.view.lkml       # County-level HCC prevalence
  hcc_by_state.view.lkml        # State-level HCC prevalence
  hcc_by_county_diabetes.view.lkml
  hcc_by_state_diabetes.view.lkml
  geo_puf.view.lkml             # Medicare Geographic PUF (unpivoted)
  geo_puf_wide.view.lkml        # Geographic PUF (wide format, 25+ metrics)
  geo_puf_wide_select.view.lkml # Curated subset of geographic metrics
  betos.view.lkml               # BETOS procedure classification
  state_by_payer_19.view.lkml   # Payer analysis by state
  enrollment_mcaid_mcare.view.lkml  # Medicare & Medicaid enrollment
  SSP_EXP_RS.view.lkml          # Shared Savings Program expenditure & risk scores
  proc_by_county_18.view.lkml   # Procedures by county
  State_County_List.view.lkml   # State/county master list with dashboard nav links
```

## Explores

| Explore | Description |
|---------|-------------|
| **diabetes** | Diabetes-focused analysis joined with county/state prevalence, procedures, and geographic metrics |
| **geo_puf_wide** | Geographic healthcare utilization and cost metrics |
| **hcc_all** | Comprehensive HCC analysis across multiple condition categories |
| **betos** | Procedure categories (Berenson-Eggers Type of Service) |
| **ssp_exp_rs** | Shared Savings Program — expenditure benchmarks and risk scores |
| **enrollment_mcaid_mcare** | Medicare and Medicaid/CHIP enrollment trends |

## Key Metrics

- **HCC Prevalence** — disease cases per 1,000 beneficiaries
- **HCC Risk Scores** — average risk score by condition
- **Service Utilization** — hospital, ER, imaging, SNF, and other service rates per 1,000 beneficiaries
- **Standardized Payments** — geographically adjusted payment amounts
- **SSP Assignment & Expenditure** — ACO assignment rates and per-capita expenditure
- **Procedure Prevalence** — beneficiary and line-level procedure rates

## Clinical Cohorts (HCC)

The `hcc_all` view unions data across these cohorts:

- Overall conditions
- Oncology
- Cardiovascular & Metabolic Disorders
- Neurological Disorders
- Immune and Inflammatory Disorders
- COPD (HCC 111)
- Diabetes (HCC 18)
- Congestive Heart Failure (HCC 85)

## Dashboards

The project links to three dashboard pages via `State_County_List`:

1. **Population Health**
2. **Value-based Care**
3. **SDOH Equity**

## Data Notes

- Geographic mapping uses US FIPS codes for state and county-level maps
- Puerto Rico is excluded from BETOS and SSP explores
- Cache policy: 1-hour datagroup (`pfizer_demo_default_datagroup`)
