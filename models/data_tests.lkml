test: score_range_correct {
    explore_source: dialogflow_runtime_googleapis_com_requests {
      column: score {
        field: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__alternative_matched_intents.score
      }
      filters: {
        field: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__alternative_matched_intents.score
        value: "-NULL"
      }
    }
  assert: score_is_within_range {
    expression: -1.0 <= ${score} <= 1.0 ;;
  }
}
