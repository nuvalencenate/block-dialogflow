- dashboard: dialogflow_agent_operations__phone
  title: Dialogflow Agent Operations - Phone
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  refresh: 1 hour
  preferred_slug: AvwoPvmnHPkGIJus0VjTu5
  elements:
  - title: Avg Duration
    name: Avg Duration
    model: ccai-dialogflow-cx
    explore: conversations
    type: single_value
    fields: [average_of_conversation_duration_seconds, median_of_conversation_duration_seconds]
    filters:
      conversations.is_audio_input: 'Yes'
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "concat(\n  to_string(\n\
          \    round(\n      mean(${conversations.conversation_duration_seconds} /\
          \ 60), 1)), \" min\")", label: Avg Duration (min), value_format: !!null '',
        value_format_name: '', _kind_hint: dimension, table_calculation: avg_duration_min,
        _type_hint: string, is_disabled: true}, {category: table_calculation, expression: 'concat(to_string(${avg_duration_min}),
          " min")', label: labeled value, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, table_calculation: labeled_value, _type_hint: string,
        is_disabled: true}, {measure: average_of_conversation_duration_seconds, based_on: conversations.conversation_duration_seconds,
        expression: '', label: Average of Conversation Duration Seconds, type: average,
        _kind_hint: measure, _type_hint: number}, {category: table_calculation, expression: "concat(\n\
          \  to_string(\n    round(\n      if(${average_of_conversation_duration_seconds}\
          \ > 60, ${average_of_conversation_duration_seconds} / 60, ${average_of_conversation_duration_seconds}),\
          \ 2)), if(${average_of_conversation_duration_seconds} > 60, \" min\", \"\
          \ sec\"))", label: Formatted avg, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, table_calculation: formatted_avg, _type_hint: string},
      {category: table_calculation, expression: "concat(\n  to_string(\n    round(\n\
          \      if(${median_of_conversation_duration_seconds} > 60, ${median_of_conversation_duration_seconds}\
          \ / 60, ${median_of_conversation_duration_seconds}), 2)), if(${median_of_conversation_duration_seconds}\
          \ > 60, \" min\", \" sec\"))", label: Formatted median, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, table_calculation: formatted_median,
        _type_hint: string}, {measure: median_of_conversation_duration_seconds, based_on: conversations.conversation_duration_seconds,
        expression: '', label: Median of Conversation Duration Seconds, type: median,
        _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: ''
    comparison_label: Median
    hidden_fields: [average_of_conversation_duration_seconds, median_of_conversation_duration_seconds]
    series_types: {}
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Average duration of phone conversations with applied filters
    listen:
      Conversation Date: conversations.conversation_start_date
      Agent ID: conversations.agent_id
    row: 0
    col: 13
    width: 4
    height: 5
  - title: Top Area Codes
    name: Top Area Codes
    model: ccai-dialogflow-cx
    explore: conversational_turns
    type: looker_pie
    fields: [area_code_1, count_of_conversation_id_4]
    filters:
      area_code_1: "-NULL"
    sorts: [count_of_conversation_id_4 desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields: [{measure: count_of_caller_id, based_on: conversational_turns.caller_id,
        expression: '', label: Count of Caller ID, type: count_distinct, _kind_hint: measure,
        _type_hint: number}, {measure: count_of_conversation_id, based_on: conversational_turns.conversation_id,
        expression: '', label: Count of Conversation ID, type: count_distinct, _kind_hint: measure,
        _type_hint: number}, {category: dimension, expression: 'substring(${conversational_turns.caller_id},
          2, 3)', label: Area Code, value_format: !!null '', value_format_name: !!null '',
        dimension: area_code_1, _kind_hint: dimension, _type_hint: string}, {measure: count_of_conversation_id_2,
        based_on: conversational_turns.conversation_id, expression: '', label: Count
          of Conversation ID, type: count_distinct, _kind_hint: measure, _type_hint: number},
      {measure: count_of_conversation_id_3, based_on: conversational_turns.conversation_id,
        expression: '', label: Count of Conversation ID, type: count_distinct, _kind_hint: measure,
        _type_hint: number}, {measure: count_of_area_code, based_on: area_code_1,
        expression: '', label: Count of Area Code, type: count_distinct, _kind_hint: measure,
        _type_hint: number}, {measure: count_of_conversation_id_4, based_on: conversational_turns.conversation_id,
        expression: '', label: Count of Conversation ID, type: count_distinct, _kind_hint: measure,
        _type_hint: number}]
    value_labels: labels
    label_type: labPer
    inner_radius:
    hidden_fields:
    series_types: {}
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Language Code: conversational_turns.language_code
      Conversation Date: conversational_turns.input_timestamp_date
      Agent ID: conversational_turns.agent_id
    row: 12
    col: 14
    width: 4
    height: 7
  - title: Conversation Volume by Quarter Hour
    name: Conversation Volume by Quarter Hour
    model: ccai-dialogflow-cx
    explore: conversational_turns
    type: looker_column
    fields: [conversational_turns.input_timestamp_day_of_week, count_of_conversation_id,
      quarter_hour_of_day]
    pivots: [quarter_hour_of_day]
    fill_fields: [conversational_turns.input_timestamp_day_of_week]
    filters:
      conversational_turns.caller_id: "-NULL"
    sorts: [quarter_hour_of_day, conversational_turns.input_timestamp_day_of_week]
    limit: 500
    column_limit: 50
    dynamic_fields: [{measure: count_of_conversation_id, based_on: conversational_turns.conversation_id,
        expression: '', label: Count of Conversation ID, type: count_distinct, _kind_hint: measure,
        _type_hint: number}, {category: dimension, expression: "(${conversational_turns.input_timestamp_hour_of_day}\
          \ + 1) / 4", label: Quarter Hour of Day, value_format: !!null '', value_format_name: !!null '',
        dimension: quarter_hour_of_day, _kind_hint: measure, _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      custom:
        id: 9bebed03-ae56-478d-91ec-04bb1bcc9377
        label: Custom
        type: continuous
        stops:
        - color: "#2d73e6"
          offset: 0
        - color: "#2d73e6"
          offset: 100
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: count_of_conversation_id,
            id: 0 - count_of_conversation_id, name: '0'}, {axisId: count_of_conversation_id,
            id: 1 - count_of_conversation_id, name: '1'}, {axisId: count_of_conversation_id,
            id: 2 - count_of_conversation_id, name: '2'}, {axisId: count_of_conversation_id,
            id: 3 - count_of_conversation_id, name: '3'}, {axisId: count_of_conversation_id,
            id: 4 - count_of_conversation_id, name: '4'}, {axisId: count_of_conversation_id,
            id: 5 - count_of_conversation_id, name: '5'}, {axisId: count_of_conversation_id,
            id: 6 - count_of_conversation_id, name: '6'}, {axisId: count_of_conversation_id,
            id: 7 - count_of_conversation_id, name: '7'}, {axisId: count_of_conversation_id,
            id: 8 - count_of_conversation_id, name: '8'}, {axisId: count_of_conversation_id,
            id: 9 - count_of_conversation_id, name: '9'}, {axisId: count_of_conversation_id,
            id: 10 - count_of_conversation_id, name: '10'}, {axisId: count_of_conversation_id,
            id: 11 - count_of_conversation_id, name: '11'}, {axisId: count_of_conversation_id,
            id: 12 - count_of_conversation_id, name: '12'}, {axisId: count_of_conversation_id,
            id: 13 - count_of_conversation_id, name: '13'}, {axisId: count_of_conversation_id,
            id: 14 - count_of_conversation_id, name: '14'}, {axisId: count_of_conversation_id,
            id: 15 - count_of_conversation_id, name: '15'}, {axisId: count_of_conversation_id,
            id: 16 - count_of_conversation_id, name: '16'}, {axisId: count_of_conversation_id,
            id: 17 - count_of_conversation_id, name: '17'}, {axisId: count_of_conversation_id,
            id: 18 - count_of_conversation_id, name: '18'}, {axisId: count_of_conversation_id,
            id: 19 - count_of_conversation_id, name: '19'}, {axisId: count_of_conversation_id,
            id: 20 - count_of_conversation_id, name: '20'}, {axisId: count_of_conversation_id,
            id: 21 - count_of_conversation_id, name: '21'}, {axisId: count_of_conversation_id,
            id: 22 - count_of_conversation_id, name: '22'}, {axisId: count_of_conversation_id,
            id: 23 - count_of_conversation_id, name: '23'}], showLabels: false, showValues: true,
        unpinAxis: false, tickDensity: custom, tickDensityCustom: 6, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: true
    series_colors: {}
    hidden_pivots: {}
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Count of conversations per quarter hour for each weekday that occurs
      in the last week (or in the timezone range defined by the top time filter).
      Times are UTC. Hours are numbered 0-24.
    listen:
      Language Code: conversational_turns.language_code
      Conversation Date: conversational_turns.input_timestamp_date
      Agent ID: conversational_turns.agent_id
    row: 21
    col: 12
    width: 12
    height: 11
  - title: Total Calls
    name: Total Calls
    model: ccai-dialogflow-cx
    explore: conversational_turns
    type: single_value
    fields: [conversational_turns.input_timestamp_week, count_of_conversation_id]
    fill_fields: [conversational_turns.input_timestamp_week]
    filters:
      conversational_turns.caller_id: "-NULL"
    sorts: [conversational_turns.input_timestamp_week desc]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields: [{category: table_calculation, expression: "${count_of_conversation_id:total}",
        label: Total Conversations, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, table_calculation: total_conversations, _type_hint: number},
      {measure: count_of_conversation_id, based_on: conversational_turns.conversation_id,
        expression: '', label: Count of Conversation ID, type: count_distinct, _kind_hint: measure,
        _type_hint: number}, {category: table_calculation, expression: 'diff_days(now(),
          ${conversational_turns.input_timestamp_week})', label: Diff days, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: dimension, table_calculation: diff_days,
        _type_hint: number}, {category: table_calculation, expression: 'if(${diff_days}
          <= -7 AND ${diff_days} > -14, ${count_of_conversation_id}, 0)', label: Prior
          week count, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        table_calculation: prior_week_count, _type_hint: number}, {category: table_calculation,
        expression: 'sum(${prior_week_count})', label: Prior week, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, table_calculation: prior_week,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Prior Week
    series_types: {}
    defaults_version: 1
    hidden_fields: [conversational_turns.input_timestamp_week, count_of_conversation_id,
      diff_days, prior_week_count]
    note_state: collapsed
    note_display: hover
    note_text: Total number of calls with applied filters
    listen:
      Language Code: conversational_turns.language_code
      Conversation Date: conversational_turns.input_timestamp_date
      Agent ID: conversational_turns.agent_id
    row: 0
    col: 3
    width: 9
    height: 9
  - title: Repeat Callers
    name: Repeat Callers
    model: ccai-dialogflow-cx
    explore: conversational_turns
    type: looker_donut_multiples
    fields: [conversational_turns.caller_id, count_of_conversation_id, count_of_caller_id]
    filters:
      conversational_turns.caller_id: "-NULL"
      count_of_conversation_id: ">1"
    sorts: [conversational_turns.caller_id]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields: [{measure: count_of_conversation_id, based_on: conversational_turns.conversation_id,
        expression: '', label: Count of Conversation ID, type: count_distinct, _kind_hint: measure,
        _type_hint: number}, {category: table_calculation, expression: "${count_of_conversation_id}\
          \ > 1", label: Repeat Caller, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, table_calculation: repeat_caller, _type_hint: yesno,
        is_disabled: true}, {category: table_calculation, expression: "${count_of_conversation_id}\
          \ = 1", label: First Time Caller, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, table_calculation: first_time_caller, _type_hint: yesno,
        is_disabled: true}, {category: table_calculation, expression: "${count_of_conversation_id:total}",
        label: Total Conversations, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, table_calculation: total_conversations, _type_hint: number,
        is_disabled: true}, {category: table_calculation, expression: 'count_distinct(${count_of_conversation_id}
          > 1)', label: Repeat Caller Count, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, table_calculation: repeat_caller_count, _type_hint: number},
      {category: table_calculation, expression: "${count_of_caller_id:total} - ${repeat_caller_count}",
        label: First Time Caller Count, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, table_calculation: first_time_caller_count, _type_hint: number},
      {measure: count_of_caller_id, based_on: conversational_turns.caller_id, expression: '',
        label: Count of Caller ID, type: count_distinct, _kind_hint: measure, _type_hint: number}]
    show_value_labels: true
    font_size: 12
    hide_legend: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
        reverse: false
    series_colors:
      first_time_caller_count: "#1A73E8"
      repeat_caller_count: "#12B5CB"
    series_labels:
      count_of_conversation_id: Repeat
      total_conversations: First
      repeat_caller_count: Repeat
      first_time_caller_count: First
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: [conversational_turns.caller_id, count_of_conversation_id, count_of_caller_id]
    series_types: {}
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Percentages of callers who have called more than once
    listen:
      Language Code: conversational_turns.language_code
      Conversation Date: conversational_turns.input_timestamp_date
      Agent ID: conversational_turns.agent_id
    row: 12
    col: 10
    width: 4
    height: 7
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":" "}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 19
    col: 0
    width: 24
    height: 2
  - title: Top Intents
    name: Top Intents
    model: ccai-dialogflow-cx
    explore: conversational_turns
    type: looker_grid
    fields: [conversational_turns.match_intent_display_name, conversational_turns.count]
    filters:
      conversational_turns.match_intent_display_name: "-NULL,-Default Welcome Intent"
      conversational_turns.caller_id: "-NULL"
    sorts: [conversational_turns.count desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      conversational_turns.match_intent_display_name: Intent Name
      conversational_turns.count: Count
    series_cell_visualizations:
      conversational_turns.count:
        is_active: true
    hidden_pivots: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen:
      Language Code: conversational_turns.language_code
      Conversation Date: conversational_turns.input_timestamp_date
      Agent ID: conversational_turns.agent_id
    row: 21
    col: 0
    width: 12
    height: 11
  - title: Avg Match Confidence
    name: Avg Match Confidence
    model: ccai-dialogflow-cx
    explore: conversational_turns
    type: single_value
    fields: [average_of_match_confidence]
    filters:
      conversational_turns.is_audio_input: 'Yes'
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: measure, expression: '', label: Average of Match Confidence,
        value_format: !!null '', value_format_name: decimal_2, based_on: conversational_turns.match_confidence,
        _kind_hint: measure, measure: average_of_match_confidence, type: average,
        _type_hint: number}, {category: table_calculation, expression: "${average_of_match_confidence}",
        label: Formatted avg, value_format: !!null '', value_format_name: percent_0,
        _kind_hint: measure, table_calculation: formatted_avg, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    hidden_fields: [average_of_match_confidence]
    note_state: collapsed
    note_display: hover
    note_text: Average match confidence score for phone conversations
    listen:
      Language Code: conversational_turns.language_code
      Conversation Date: conversational_turns.input_timestamp_date
      Agent ID: conversational_turns.agent_id
    row: 0
    col: 17
    width: 4
    height: 5
  - title: Abandoned Conversations
    name: Abandoned Conversations
    model: ccai-dialogflow-cx
    explore: conversational_turns
    type: looker_donut_multiples
    fields: [conversational_turns.reached_end_page, count_of_conversation_id_2]
    pivots: [conversational_turns.reached_end_page]
    fill_fields: [conversational_turns.reached_end_page]
    filters:
      conversational_turns.caller_id: "-NULL"
    sorts: [conversational_turns.reached_end_page]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields: [{category: table_calculation, expression: 'count(${conversational_turns.reached_end_page}
          = yes)', label: Ended Conversations, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, table_calculation: ended_conversations, _type_hint: number,
        is_disabled: true}, {measure: count_of_conversation_id, based_on: conversational_turns.conversation_id,
        expression: '', label: Count of Conversation ID, type: count_distinct, _kind_hint: measure,
        _type_hint: number}, {measure: count_of_conversation_id_2, based_on: conversational_turns.conversation_id,
        expression: '', label: Count of Conversation ID, type: count_distinct, _kind_hint: measure,
        _type_hint: number}, {args: [count_of_conversation_id_2], calculation_type: percent_of_column_sum,
        category: table_calculation, based_on: count_of_conversation_id_2, label: Percent
          of  Count of Conversation ID, source_field: count_of_conversation_id_2,
        table_calculation: percent_of_count_of_conversation_id, value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, _type_hint: number, is_disabled: true}]
    show_value_labels: true
    font_size: 12
    hide_legend: false
    series_colors:
      No - count_of_conversation_id_2: "#80868B"
      Yes - count_of_conversation_id_2: "#1A73E8"
    series_labels:
      No - count_of_conversation_id_2: Abandoned
      Yes - count_of_conversation_id_2: Completed
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: []
    series_types: {}
    hidden_pivots: {}
    hidden_points_if_no:
    note_state: collapsed
    note_display: hover
    note_text: Abandoned conversations are those where the user did not reach an end
      page and the conversation timed out or otherwise ended
    listen:
      Language Code: conversational_turns.language_code
      Conversation Date: conversational_turns.input_timestamp_date
      Agent ID: conversational_turns.agent_id
    row: 12
    col: 6
    width: 4
    height: 7
  - title: Total Callers
    name: Total Callers
    model: ccai-dialogflow-cx
    explore: conversational_turns
    type: single_value
    fields: [count_of_caller_id]
    filters:
      conversational_turns.caller_id: "-NULL"
    limit: 500
    dynamic_fields: [{measure: count_of_caller_id, based_on: conversational_turns.caller_id,
        expression: '', label: Count of Caller ID, type: count_distinct, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Total unique callers
    listen:
      Language Code: conversational_turns.language_code
      Conversation Date: conversational_turns.input_timestamp_date
      Agent ID: conversational_turns.agent_id
    row: 5
    col: 17
    width: 4
    height: 4
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: '[{"type":"h1","children":[{"text":" "}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 9
    col: 0
    width: 24
    height: 3
  - title: Avg Turns
    name: Avg Turns
    model: ccai-dialogflow-cx
    explore: conversational_turns
    type: single_value
    fields: [count_of_conversational_turn_id_2, conversational_turns.conversation_id]
    filters:
      conversational_turns.caller_id: "-NULL"
    sorts: [count_of_conversational_turn_id_2 desc 0]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields: [{measure: count_of_conversational_turn_id, based_on: conversational_turns.conversational_turn_id,
        expression: '', label: Count of Conversational Turn ID, type: count_distinct,
        _kind_hint: measure, _type_hint: number}, {category: table_calculation, expression: 'count(${conversational_turns.conversational_turn_id})
          / count(${conversational_turns.conversation_id})', label: Avg Turns/Conversation,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        table_calculation: avg_turnsconversation, _type_hint: number, is_disabled: true},
      {measure: count_of_conversational_turn_id_2, based_on: conversational_turns.conversational_turn_id,
        expression: '', label: Count of Conversational Turn ID, type: count_distinct,
        _kind_hint: measure, _type_hint: number}, {category: table_calculation, expression: 'round(${count_of_conversational_turn_id_2:total}
          / count(${conversational_turns.conversation_id}), 0)', label: Avg Turns,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        table_calculation: avg_turns, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [count_of_conversational_turn_id_2, conversational_turns.conversation_id]
    series_types: {}
    note_state: collapsed
    note_display: hover
    note_text: Average conversational turns per phone conversation. A conversational
      turn is one user input and at least one agent response.
    listen:
      Language Code: conversational_turns.language_code
      Conversation Date: conversational_turns.input_timestamp_date
      Agent ID: conversational_turns.agent_id
    row: 5
    col: 13
    width: 4
    height: 4
  filters:
  - name: Conversation Date
    title: Conversation Date
    type: field_filter
    default_value: 7 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: ccai-dialogflow-cx
    explore: conversational_turns
    listens_to_filters: []
    field: conversational_turns.input_timestamp_date
  - name: Language Code
    title: Language Code
    type: field_filter
    default_value: en,es
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: ccai-dialogflow-cx
    explore: conversational_turns
    listens_to_filters: []
    field: conversational_turns.language_code
  - name: Agent ID
    title: Agent ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: ccai-dialogflow-cx
    explore: conversational_turns
    listens_to_filters: []
    field: conversational_turns.agent_id
