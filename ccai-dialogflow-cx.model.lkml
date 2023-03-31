connection: "@{CONNECTION_NAME_DBT}"

include: "dbt/explores/*.explore"
include: "dbt/dashboards/*.dashboard"

persist_with: default_datagroup

datagroup: default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}
