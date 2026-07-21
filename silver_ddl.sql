-- Normalized silver-layer DDL for the bronze schema in cb.py
-- This design splits the nested bronze structure into separate silver objects
-- instead of one very wide table.

CREATE OR REPLACE TABLE silver_bordereaux_batch
USING DELTA
(
  batch_id STRING,
  source_file STRING,
  source_path STRING,
  username STRING,
  ingested_at TIMESTAMP
);

CREATE OR REPLACE TABLE silver_bordereaux_claim
USING DELTA
(
  claim_id STRING,
  batch_id STRING,
  claim_policy_number STRING,
  claim_reference STRING,
  loss_cause_code STRING,
  tpa_loss_cause_code STRING,
  claim_status STRING,
  expert_firm_company STRING,
  claim_note STRING,
  activity STRING,
  claims_date STRING,
  damages STRING,
  occurrence_date STRING,
  third_party STRING,
  rowid STRING,
  id STRING,
  tpa_name STRING,
  coverholder_name STRING,
  binder_contract_inception STRING,
  loss_country STRING,
  settlement_currency STRING,
  original_currency STRING,
  lob_description STRING,
  loss_date_from STRING,
  reporting_month STRING,
  reporting_year STRING,
  filename STRING,
  bdx_imp_id STRING,
  program_id STRING,
  facility_id STRING,
  cm_id STRING,
  ct_id STRING
);

CREATE OR REPLACE TABLE silver_bordereaux_transaction
USING DELTA
(
  transaction_id STRING,
  claim_id STRING,
  claim_policy_number STRING,
  claim_reference STRING,
  paid_date_adjusters_fees STRING,
  paid_date_attorney_coverage_fees STRING,
  paid_date_fees STRING,
  paid_date_indemnity STRING,
  closed_date STRING,
  claim_last_modification_date STRING,
  claim_litigation STRING,
  reporting_end_date STRING,
  insured_full_name_or_company_name STRING,
  insured_country STRING,
  insured_postcode_or_zip_code_or_similar STRING,
  insured_state_province_territory_canton STRING,
  insured_address STRING,
  issuing_company STRING,
  claimant_name STRING,
  policy_inc_date STRING,
  section STRING,
  tsp_uwy STRING,
  omega_treaty_section_no STRING,
  rollback_flag STRING,
  in_error STRING
);

CREATE OR REPLACE TABLE silver_bordereaux_financials
USING DELTA
(
  transaction_id STRING,
  claim_id STRING,
  paid_month_indemnity STRING,
  paid_month_fees STRING,
  paid_month_lae_fees STRING,
  paid_month_adj_fee STRING,
  paid_month_atty_fee STRING,
  paid_month_defence_fees STRING,
  paid_month_tpa_fee STRING,
  previous_paid_indemnity STRING,
  previous_paid_fees STRING,
  previous_paid_lae STRING,
  previous_paid_adj STRING,
  previous_paid_atty STRING,
  previous_paid_defence STRING,
  previous_paid_tpa STRING,
  reserve_indemnity STRING,
  reserve_fees STRING,
  reserve_lae_fee STRING,
  reserve_adj_fee STRING,
  reserve_atty_fee STRING,
  reserve_defence STRING,
  reserve_tpa_fee STRING,
  gross_total_ncurred STRING,
  sum_insured STRING,
  deductible_amount STRING,
  subrogation_salvage STRING,
  recoveries_reserve STRING,
  buyback_resale STRING,
  incurred_ndemnity STRING,
  incurred_expenses STRING,
  change_month_indemnity STRING,
  change_month_fees_expenses STRING
);

CREATE OR REPLACE TABLE silver_bordereaux_metrics_100
USING DELTA
(
  transaction_id STRING,
  claim_id STRING,
  paid_month_fees STRING,
  paid_month_adj_fee STRING,
  paid_month_atty_fee STRING,
  previous_paid_fees STRING,
  previous_paid_adj STRING,
  previous_paid_atty STRING,
  reserve_indemnity STRING,
  reserve_fees STRING,
  reserve_adj_fee STRING,
  reserve_atty_fee STRING,
  gross_total_ncurred STRING,
  deductible_amount STRING,
  subrogation_salvage STRING,
  incurred_ndemnity STRING,
  incurred_expenses STRING,
  paid_month_indemnity STRING,
  previous_paid_indemnity STRING,
  buyback_resale STRING,
  change_month_indemnity STRING,
  change_month_fees_expenses STRING,
  paid_month_defence_fees STRING,
  paid_month_tpa_fee STRING,
  previous_paid_defence STRING,
  previous_paid_tpa STRING,
  reserve_defence STRING,
  reserve_tpa_fee STRING,
  sum_insured STRING,
  reserve_lae_fee STRING,
  paid_month_lae_fees STRING,
  previous_paid_lae STRING
);

CREATE OR REPLACE TABLE silver_bordereaux_metrics_original
USING DELTA
(
  transaction_id STRING,
  claim_id STRING,
  paid_month_indemnity STRING,
  paid_month_fees STRING,
  paid_month_adj_fee STRING,
  paid_month_tpa_fee STRING,
  previous_paid_indemnity STRING,
  previous_paid_fees STRING,
  previous_paid_adj STRING,
  sum_insured STRING,
  previous_paid_tpa STRING,
  reserve_indemnity STRING,
  reserve_fees STRING,
  reserve_adj_fee STRING,
  reserve_tpa_fee STRING,
  gross_total_ncurred STRING,
  incurred_ndemnity STRING,
  incurred_expenses STRING,
  change_month_indemnity STRING,
  change_month_fees_expenses STRING,
  paid_month_lae_fees STRING,
  previous_paid_lae STRING,
  reserve_lae_fee STRING
);
