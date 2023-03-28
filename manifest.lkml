project_name: "ccai-prototype"

################ Constants ################

constant: CONNECTION_NAME_LOGS {
  value: "prospect-ccai-logs"
  export: override_optional
}

constant: CONNECTION_NAME_DBT {
  value: "ccai-dbt"
  export: override_optional
}

constant: DBT_DATASOURCE_NAME {
  value: "dialogflow_cx_dbt"
  export: override_optional
}

constant: LOGS_DB {
  value: "ccai_prototype_logs"
  export: override_optional
}

constant: REQUESTS_TABLE {
  value: "dialogflow_runtime_googleapis_com_requests"
  export: override_optional
}

constant: CALLS_TABLE {
  value: "dialogflow_googleapis_com_incoming_call"
  export: override_optional
}
