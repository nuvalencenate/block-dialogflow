connection: "@{CONNECTION_NAME_DBT}"

#include: "dbt/explores/*.explore"

persist_with: default_datagroup

datagroup: default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}
