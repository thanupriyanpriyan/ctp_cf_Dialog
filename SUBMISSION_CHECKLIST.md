# Submission Checklist

Use this checklist before packaging your submission.

---

## Code and Pipeline

- [ ] My pipeline runs end-to-end with `make run` or `python -m src.pipeline`
- [ ] My tests pass with `make test` or `pytest`
- [ ] I have not hard-coded any absolute paths
- [ ] I have not included any credentials, API keys, tokens, or secrets
- [ ] My code uses a fixed random seed (if applicable) for reproducibility
- [ ] Dependencies are listed in `requirements.txt` or `pyproject.toml`
- [ ] My pipeline runs locally without requiring cloud access

---

## Outputs

- [ ] `outputs/feature_table.csv` or `outputs/feature_table.parquet` exists
- [ ] Feature table has exactly one row per `application_id`
- [ ] Feature table includes `application_id` and `customer_token` as identifier columns
- [ ] `outputs/dq_report.json` exists and is valid JSON

---

## Point-in-Time Correctness (Critical)

- [ ] **`label_default_90d` is NOT in my feature table**
- [ ] **`label_observation_end_date` is NOT in my feature table**
- [ ] **`post_application_repayment_ratio` is NOT in my feature table**
- [ ] **`post_application_dpd_max` is NOT in my feature table**
- [ ] **`raw_msisdn_hash_unapproved` is NOT in my feature table or any output**
- [ ] All recharge features use only events with `event_ts <= application_ts`
- [ ] All usage features use only records with `usage_date <= application_date`
- [ ] All billing features use only bills with `bill_issue_date <= application_ts`
- [ ] All lifecycle features use only events with `event_ts <= application_ts`
- [ ] All CRM features use only events with `event_ts <= application_ts`
- [ ] Snapshot features use only rows with `snapshot_date <= application_date`

---

## Documentation

- [ ] `docs/technical_note.md` covers: approach, PIT handling, production notes (3–5 bullets), monitoring (3–4 metrics), known limitations
- [ ] `docs/feature_dictionary.md` covers every column in my feature table
- [ ] Each feature has specific transformation logic (not vague), null handling, and CF eligibility
- [ ] `docs/cf_handoff_contract.md` covers approved fields, excluded fields, access control, retention, audit, DQ thresholds

---

## Governance

- [ ] My handoff contract explicitly lists `raw_msisdn_hash_unapproved` as prohibited
- [ ] My handoff contract explicitly lists all label/post-application fields as prohibited
- [ ] My handoff contract references `approved_feature_policy.yaml`
- [ ] I have not included protected-class attributes (gender, ethnicity, religion, etc.)
- [ ] I have not included precise location data

---

## Tests

- [ ] I have written at least one test for point-in-time correctness
- [ ] I have written at least one test for schema validation of the feature table
- [ ] I have written at least one test for a DQ check
- [ ] Tests are runnable with `pytest` without any manual setup

---

## Submission Package

- [ ] My `README.md` explains how to set up, run, and test the solution
- [ ] I have removed any personal data from my submission
- [ ] I have removed any credentials or sensitive configuration from my submission
- [ ] My submission is a zip archive or git repository

---

*If any of the critical checks are not met, your submission will be assessed accordingly. The most critical items are marked in bold above.*
