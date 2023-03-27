test: score_range_correct {
    explore_source: dialogflow_runtime_googleapis_com_requests {
      column: score {
        field: dialogflow_runtime_googleapis_com_requests.json_payload__sentimentanalysisresult__score
      }
      filters: [dialogflow_runtime_googleapis_com_requests.json_payload__sentimentanalysisresult__score: "NOT NULL"]
    }
  assert: score_is_within_range {
    expression: (${dialogflow_runtime_googleapis_com_requests.json_payload__sentimentanalysisresult__score} >= -1.0) AND (${dialogflow_runtime_googleapis_com_requests.json_payload__sentimentanalysisresult__score} <= 1.0) ;;
  }
}

test: data_is_fresh {
  explore_source: dialogflow_runtime_googleapis_com_requests {
    column: timestamp {
      field: dialogflow_runtime_googleapis_com_requests.timestamp_raw
    }
  }
  assert: data_is_current {
    expression: ${dialogflow_runtime_googleapis_com_requests.timestamp_raw} > add_days(-1, now()) ;;
  }
}
