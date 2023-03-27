# The name of this view in Looker is "Export Errors"
view: export_errors {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `ccai_prototype_logs.export_errors`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Insert ID" in Explore.

  dimension: insert_id {
    type: string
    sql: ${TABLE}.insertId ;;
  }

  dimension: log_entry {
    type: string
    sql: ${TABLE}.logEntry ;;
  }

  dimension: log_name {
    type: string
    sql: ${TABLE}.logName ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: receive_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.receiveTimestamp ;;
  }

  dimension: resource_type {
    type: string
    sql: ${TABLE}.resourceType ;;
  }

  dimension: schema_error_detail {
    type: string
    sql: ${TABLE}.schemaErrorDetail ;;
  }

  dimension: severity {
    type: string
    sql: ${TABLE}.severity ;;
  }

  dimension: sink {
    type: string
    sql: ${TABLE}.sink ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.timestamp ;;
  }

  dimension: trace {
    type: string
    sql: ${TABLE}.trace ;;
  }

  measure: count {
    type: count
    drill_fields: [log_name]
  }
}
