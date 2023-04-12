# The name of this view in Looker is "Conversational Turns"
view: conversational_turns {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `prospect-dol-ccai.dialogflow_cx_dbt.conversational_turns`
    ;;
  drill_fields: [conversational_turn_id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: conversational_turn_id {
    primary_key: yes
    type: string
    description: "Unique ID primary key for this conversational turn"
    sql: ${TABLE}.conversational_turn_id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Agent ID" in Explore.

  dimension: agent_id {
    type: string
    description: "Agent ID"
    sql: ${TABLE}.agent_id ;;
  }

  dimension: agent_utterances {
    type: string
    description: "Utterances from the agent."
    sql: ${TABLE}.agent_utterances ;;
  }

  dimension: caller_id {
    type: string
    description: "If the conversation was over the phone, the callerID number of the user"
    sql: ${TABLE}.caller_id ;;
  }

  dimension: conversation_id {
    type: string
    description: "ID of conversation, FK to conversations"
    # hidden: yes
    sql: ${TABLE}.conversation_id ;;
  }

  dimension: conversation_name {
    type: string
    description: "The ID of the conversation/session."
    sql: ${TABLE}.conversation_name ;;
  }

  dimension: input_event {
    type: string
    description: "The input event triggered by the calling client."
    sql: ${TABLE}.input_event ;;
  }

  dimension: input_intent {
    type: string
    description: "The intent explicitly invoked by the calling client."
    sql: ${TABLE}.input_intent ;;
  }

  dimension: input_text {
    type: string
    description: "The text input by the user or caller."
    sql: ${TABLE}.input_text ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: input_timestamp {
    type: time
    description: "Timestamp of query_input, or time of user input"
    timeframes: [
      raw,
      hour_of_day,
      time,
      date,
      day_of_week,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.input_timestamp ;;
  }

  dimension: input_type {
    type: string
    description: "The type of input for this turn. One of EVENT, INTENT, AUDIO, TEXT"
    sql: ${TABLE}.input_type ;;
  }

  dimension: is_audio_input {
    type: yesno
    description: "Whether the user input was audio or text."
    sql: ${TABLE}.is_audio_input ;;
  }

  dimension: language_code {
    type: string
    description: "Code indicating language the conversation took place in"
    sql: ${TABLE}.language_code ;;
  }

  dimension: match_confidence {
    type: number
    description: "Confidence in the matched intent. Value between 0.0 and 1.0 inclusive."
    sql: ${TABLE}.match_confidence ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_match_confidence {
    type: sum
    sql: ${match_confidence} ;;
  }

  measure: average_match_confidence {
    type: average
    sql: ${match_confidence} ;;
  }

  dimension: match_intent_display_name {
    type: string
    description: "The matched intent's display name."
    sql: ${TABLE}.match_intent_display_name ;;
  }

  dimension: match_intent_name {
    type: string
    description: "The fully qualified name of the matched intent."
    sql: ${TABLE}.match_intent_name ;;
  }

  dimension: no_user_input {
    type: yesno
    description: "Whether or not there was user input. Typically false for events and initial intent."
    sql: ${TABLE}.no_user_input ;;
  }

  dimension: page_display_name {
    type: string
    description: "The current page's display name at the end of this turn."
    sql: ${TABLE}.page_display_name ;;
  }

  dimension: page_name {
    type: string
    description: "The page's fully qualified name at the end of this turn."
    sql: ${TABLE}.page_name ;;
  }

  dimension: project_id {
    type: string
    description: "Project ID"
    sql: ${TABLE}.project_id ;;
  }

  dimension: reached_end_page {
    type: yesno
    description: "Whether the user reached the end page of a flow."
    sql: ${TABLE}.reached_end_page ;;
  }

  dimension_group: response_timestamp {
    type: time
    description: "Timestamp of query_result, or time of agent response"
    timeframes: [
      raw,
      hour_of_day,
      time,
      date,
      day_of_week,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.response_timestamp ;;
  }

  dimension: sentiment_magnitude {
    type: number
    description: "The sentiment analysis magnitude for the input_text."
    sql: ${TABLE}.sentiment_magnitude ;;
  }

  dimension: sentiment_score {
    type: number
    description: "The sentiment analysis score for the input_text."
    sql: ${TABLE}.sentiment_score ;;
  }

  dimension: turn_position {
    type: number
    description: "Conversational turn number."
    sql: ${TABLE}.turn_position ;;
  }

  dimension: user_utterances {
    type: string
    description: "Utterances made by the user."
    sql: ${TABLE}.user_utterances ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      conversational_turn_id,
      page_name,
      page_display_name,
      conversation_name,
      match_intent_name,
      match_intent_display_name,
      conversations.conversation_name,
      conversations.conversation_id
    ]
  }
}
