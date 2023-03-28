connection: "@{CONNECTION_NAME_LOGS}"

# include all the views
include: "dialogflow-block/explores/*.explore"
include: "auto-generated-metrics/explores/*.explore"
include: "dialogflow-block/dashboards/*.dashboard"
include: "auto-generated-metrics/data_tests.lkml"

persist_with: default_datagroup

datagroup: default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}
