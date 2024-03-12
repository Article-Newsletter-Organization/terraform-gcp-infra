
resource "google_service_account" "db_svc_account" {
  account_id   = "db-root-sa"
  display_name = "DB Root Service Account"
}

resource "google_sql_user" "iam_service_account_user" {
  depends_on = [google_service_account.db_svc_account, google_sql_database_instance.anp_db_instance]

  name     = trimsuffix(google_service_account.db_svc_account.email, ".gserviceaccount.com")
  instance = google_sql_database_instance.anp_db_instance.name
  type     = "CLOUD_IAM_SERVICE_ACCOUNT"
}

