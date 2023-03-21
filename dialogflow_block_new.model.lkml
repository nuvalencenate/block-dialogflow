#need to update
connection: "@{CONNECTION_NAME}"

# include all the views
include: "/explores/*"
include: "/dashboards/*.dashboard"
include: "data_tests.lkml"

persist_with: default_datagroup

datagroup: default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}
