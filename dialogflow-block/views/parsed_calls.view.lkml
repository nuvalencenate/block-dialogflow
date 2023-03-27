view: parsed_calls {
  derived_table: {
    sql:
    SELECT *
      FROM `@{LOGS_DB}.@{CALLS_TABLE}`
       ;;
  }
}