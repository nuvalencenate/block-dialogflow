include: "/views/*"

explore: parsed_transcripts {
  join: parameters {
    view_label: "Custom Parameters"
    sql: LEFT JOIN UNNEST(${parsed_transcripts.parameters}) as parameters ;;
    relationship: one_to_one
  }
  join: session_facts {
    relationship: many_to_one
    sql_on: ${session_facts.session_id} = ${parsed_transcripts.session_id} ;;
  }
  join: response_messages {
    relationship: many_to_one
    sql: LEFT JOIN UNNEST(jsonPayload.queryresult.responsemessages) as response ;;
  }
}
