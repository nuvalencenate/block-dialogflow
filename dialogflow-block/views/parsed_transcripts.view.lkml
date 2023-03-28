view: parsed_transcripts {
  derived_table: {
    sql:
    SELECT *
      FROM `@{LOGS_DB}.@{REQUESTS_TABLE}`
       ;;
  }

  dimension: id {
    type: string
    sql: CONCAT(labels.agent_id, "__", labels.location_id, "__",labels.session_id) ;;
    label: "Conversation ID primary key"
    group_label: "IDs"
  }
  dimension: lang {
    type: string
    sql: jsonPayload.languagecode ;;
    label: "Language"
    description: "Language in which conversation took place"
    view_label: "Conversation Characteristics"
  }
  dimension_group: timestamp {
    type: time
    sql: CAST(timestamp as timestamp);;
    group_label: "Conversation Time"
    label: "Conversation Time"
    description: "Time when conversation occurred"
  }
  dimension: session_id {
    type: string
    sql: labels.session_id ;;
    group_label: "IDs"
  }

  #### Result Payload ####

  dimension: source {
    type: string
    sql: (SELECT source FROM UNNEST(jsonPayload.messages)) ;;
    view_label: "Conversation Characteristics"
    description: "Source of Conversation"
  }
  dimension: score_tier {
    type: tier
    sql: ${score} ;;
    style: interval
    tiers: [0.5,0.8,1]
  }
  dimension: resolved_query {
    description: "User Question / Message to bot"
    type: string
    sql: jsonPayload.queryresult.match.resolvedinput  ;;
    label: "User Query"
  }
  dimension: score {
    type: number
    sql: jsonPayload.queryresult.sentimentanalysisresult.score ;;
    view_label: "Conversation Characteristics"
    description: "Sentiment score given to Conversation"
  }
  dimension: intent_confidence {
    type: number
    sql: jsonPayload.intentinfo.confidence ;;
    description: "Confidence an intent was given for its match"
  }
  dimension: intent_confidence_tier {
    type: tier
    sql: ${intent_confidence} ;;
    style: interval
    tiers: [0.3,0.5,0.8,1]
  }

  #### Metadata Payload

  dimension: webhook {
    type: yesno
    sql: jsonpayload_v3alpha1_webhookresponse._type IS NOT NULL ;;
    view_label: "Conversation Characteristics"
  }
  dimension: is_fallback_intent {
    type: yesno
    sql: jsonPayload.queryresult.match.matchtype = "NO_MATCH" AND jsonPayload.queryresult.match.matchtype IS NOT NULL ;;
    description: "Whether the intent of the call was a fallback"
    view_label: "Conversation Characteristics"
  }
  dimension: intent_id {
    type: string
    sql: jsonPayload.detectintentresponseid ;;
    group_label: "Intent"
    hidden: yes
  }
  dimension: web_hook_response_time {
    type: number
    sql: ( SELECT CAST(seconds AS NUMERIC) FROM (SELECT TRIM(latencies, 's') AS seconds FROM UNNEST(jsonPayload.queryresult.webhooklatencies) AS latencies)) ;;
    view_label: "Conversation Characteristics"
  }

  dimension: intent_name {
    type: string
    sql: jsonPayload.intentinfo.displayname ;;
    group_label: "Intent"
    description: "A description of the caller's intent"
    view_label: "Conversation Characteristics"
  }
  dimension: intent_category {
    type: string
    sql: split(${intent_name}, '.')[OFFSET(0)];;
    group_label: "Intent"
    drill_fields: [intent_name]
    description: "The category associated with the caller's intent"
    view_label: "Conversation Characteristics"
  }
  dimension: webhook_used {
    type: yesno
    sql: jsonPayload.queryresult.webhookids IS NOT NULL ;;
    view_label: "Conversation Characteristics"
  }

### Fulfillment ####

  dimension: speech {
    description: "Bot Response"
    type: string
    sql: (SELECT ARRAY_TO_STRING(text.text,",") FROM UNNEST(jsonPayload.queryresult.responsemessages) LIMIT 1) ;;
    label: "Bot Answer"
  }

### Raw Data ###

  dimension: json_payload {
    view_label: "Raw Data"
    type: string
    sql: TO_JSON_STRING(${TABLE}.jsonPayload) ;;
  }
  dimension: payload_type {
    view_label: "Raw Data"
    ### SQL Always Where in Model File is filtering data down to only Dialogflow Requests ###
    type: string
    sql: jsonPayload.responsetype ;;
  }
  dimension: parameters {
    #Only used for unnesting join
    type: string
    hidden: yes
    sql:JSON_EXTRACT_ARRAY(${payload_as_json}, '$.result.parameters.fields')  ;;
  }
  dimension: parameters_as_string {
    view_label: "Raw Data"
    type: string
    sql:JSON_EXTRACT(${payload_as_json}, '$.result.parameters.fields')  ;;
  }
  dimension: payload_as_json {

    view_label: "Raw Data"
    sql: TO_JSON_STRING(jsonPayload.sessioninfo.parameters) ;;
  }

  ##Below are Calculations From "Metrics to Measure" Google Doc

  dimension: is_user_query {
    #Should be exclude any intents related to welcome messages
    type: yesno
    sql: ${intent_category} <> 'support' ;;
    view_label: "Conversation Characteristics"
    description: "Did the user submit a question?"
  }
  measure: count {
    description: "Raw Count of Total User Inputs - Includes Welcome Intent"
    type: count
    drill_fields: [detail*]
  }
  measure: total_sessions {
    type: count_distinct
    sql: ${session_id} ;;
    drill_fields: [session_id]
  }
  measure: queries_per_session {
    type: number
    sql: 1.0 * ${total_user_queries} / nullif(${total_sessions},0) ;;
    value_format_name: decimal_1
  }
  measure: distinct_intent_values {
    type: count_distinct
    sql: ${intent_name} ;;
  }
  measure: total_fallbacks {
    type: count
    filters:  {
      field: is_fallback_intent
      value: "yes"
    }
  }
  measure: total_successful_intents {
    type: count
    filters:  {
      field: is_fallback_intent
      value: "no"
    }
  }
  measure: total_user_queries {
    description: "Total number of user questions excluding introduction text."
    type: count
    ### Customize this filter to only include messages related to a customer question. ####
    filters: [intent_category: "-support"]
  }
  measure: successful_intent_rate {
    type: number
    value_format_name: percent_2
    sql: ${total_successful_intents}/NULLIF(${total_user_queries},0) ;;
  }
  measure: fallback_rate {
    type: number
    value_format_name: percent_2
    sql: ${total_fallbacks}/NULLIF(${count},0) ;;
  }
  measure: max_timestamp {
    hidden: yes
    type: date_time
    sql: MAX(${timestamp_raw}) ;;
  }
  measure: min_timestamp {
    hidden: yes
    type: date_time
    sql: MIN(${timestamp_raw}) ;;
  }

#### Additional Metrics for Telephony Bots

  dimension: trace {
    view_label: "Telephony Metrics"
    type: string
  }
  dimension: caller_id {
    view_label: "Telephony Metrics"
    type: string
    sql: jsonPayload.queryparams.payload.telephony.caller_id ;;
  }
  measure: count_distinct_trace {
    view_label: "Telephony Metrics"
    type: count_distinct
    sql: ${trace} ;;
  }
  measure: total_telephone_users {
    view_label: "Telephony Metrics"
    type: count_distinct
    sql: ${caller_id} ;;
  }
  dimension: area_code {
    view_label: "Telephony Metrics"
    type: string
    sql: SUBSTRING(jsonPayload.queryparams.payload.telephony.caller_id, 3, 3) ;;
  }
  set: detail {
    fields: [
      webhook_used,
      speech,
      source,
      session_id,
      score,
      resolved_query,
      intent_name,
      intent_id,
      is_fallback_intent,
      lang    ]
  }
}
