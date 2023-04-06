# The name of this view in Looker is "Conversations"
view: conversations {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `prospect-dol-ccai.dbt_testing_ntranel.conversations`
    ;;
  drill_fields: [conversation_id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: conversation_id {
    primary_key: yes
    type: string
    description: "Unique ID PK, MD5 hash of conversation_name"
    sql: ${TABLE}.conversation_id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Agent ID" in Explore.

  dimension: agent_id {
    type: string
    description: "Agent ID"
    sql: ${TABLE}.agent_id ;;
  }

  dimension: avg_sentiment_score {
    type: number
    description: "The average sentiment score."
    sql: ${TABLE}.avg_sentiment_score ;;
  }

  dimension: conversation_duration_seconds {
    type: number
    description: "The duration of the conversation in seconds."
    sql: ${TABLE}.conversation_duration_seconds ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_conversation_duration_seconds {
    type: sum
    sql: ${conversation_duration_seconds} ;;
  }

  measure: average_conversation_duration_seconds {
    type: average
    sql: ${conversation_duration_seconds} ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: conversation_end {
    type: time
    description: "The ending timestamp."
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.conversation_end ;;
  }

  dimension: conversation_name {
    type: string
    description: "The fully qualified resource name for the session."
    sql: ${TABLE}.conversation_name ;;
  }

  dimension_group: conversation_start {
    type: time
    description: "The starting timestamp."
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.conversation_start ;;
  }

  dimension: max_sentiment_score {
    type: number
    description: "The maximum sentiment score."
    sql: ${TABLE}.max_sentiment_score ;;
  }

  dimension: min_sentiment_score {
    type: number
    description: "The minimum sentiment score."
    sql: ${TABLE}.min_sentiment_score ;;
  }

  dimension: project_id {
    type: string
    description: "Project ID"
    sql: ${TABLE}.project_id ;;
  }

  dimension: turn_count {
    type: number
    description: "The number of conversational_turns in this conversation."
    sql: ${TABLE}.turn_count ;;
  }

  measure: count {
    type: count
    drill_fields: [conversation_id, conversation_name, conversational_turns.count]
  }
}
