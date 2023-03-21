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
