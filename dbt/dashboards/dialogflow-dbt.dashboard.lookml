- dashboard: dialogflow_overview__dbt
  title: Dialogflow Overview - DBT
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: BOzvvnfvc5jP7nie96j32Z
  elements:
  - title: Total Conversations
    name: Total Conversations
    model: ccai-dialogflow-cx
    explore: conversations
    type: single_value
    fields: [count_of_conversation_id_2]
    limit: 500
    column_limit: 50
    dynamic_fields: [{measure: count_of_conversation_id, based_on: conversations.conversation_id,
        expression: '', label: Count of Conversation ID, type: count_distinct, _kind_hint: measure,
        _type_hint: number}, {measure: count_of_conversation_id_2, based_on: conversations.conversation_id,
        expression: '', label: Count of Conversation ID, type: count_distinct, _kind_hint: measure,
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
    hidden_pivots: {}
    listen:
      Session Start Time: conversations.conversation_start_time
    row: 0
    col: 0
    width: 4
    height: 5
  - title: Average Conversation Duration (seconds)
    name: Average Conversation Duration (seconds)
    model: ccai-dialogflow-cx
    explore: conversations
    type: single_value
    fields: [conversations.average_conversation_duration_seconds]
    sorts: [conversations.average_conversation_duration_seconds desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "${conversations.average_conversation_duration_seconds}",
        label: Truncated duration, value_format: !!null '', value_format_name: decimal_2,
        _kind_hint: measure, table_calculation: truncated_duration, _type_hint: number}]
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
    hidden_fields: [conversations.average_conversation_duration_seconds]
    listen:
      Session Start Time: conversations.conversation_start_time
    row: 0
    col: 4
    width: 4
    height: 5
  - title: Total Phone Conversations
    name: Total Phone Conversations
    model: ccai-dialogflow-cx
    explore: conversational_turns
    type: single_value
    fields: [conversational_turns.input_type, count_of_conversation_id]
    filters:
      conversational_turns.input_type: AUDIO
    sorts: [conversational_turns.input_type]
    limit: 500
    column_limit: 50
    dynamic_fields: [{measure: count_of_conversation_id, based_on: conversational_turns.conversation_id,
        expression: '', label: Count of Conversation ID, type: count_distinct, _kind_hint: measure,
        _type_hint: number}, {measure: count_of_conversation_id, based_on: conversational_turns.conversation_id,
        expression: '', label: Count of Conversational Turn ID, type: count_distinct,
        _kind_hint: measure, _type_hint: number}]
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
    hidden_fields: [conversational_turns.input_type]
    hidden_pivots: {}
    listen: {}
    row: 0
    col: 8
    width: 4
    height: 5
  - title: Total Queries
    name: Total Queries
    model: ccai-dialogflow-cx
    explore: conversational_turns
    type: single_value
    fields: [conversational_turns.count]
    filters:
      conversational_turns.user_utterances: "-NULL"
    limit: 500
    column_limit: 50
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
    listen: {}
    row: 0
    col: 14
    width: 5
    height: 5
  - title: Average Queries per Conversation
    name: Average Queries per Conversation
    model: ccai-dialogflow-cx
    explore: conversational_turns
    type: single_value
    fields: [conversational_turns.count, count_of_conversation_id]
    filters:
      conversational_turns.user_utterances: "-NULL"
    limit: 500
    column_limit: 50
    dynamic_fields: [{measure: count_of_user_utterances, based_on: conversational_turns.user_utterances,
        expression: '', label: Count of User Utterances, type: count_distinct, _kind_hint: measure,
        _type_hint: number}, {measure: count_of_conversation_id, based_on: conversational_turns.conversation_id,
        expression: '', label: Count of Conversation ID, type: count_distinct, _kind_hint: measure,
        _type_hint: number}, {category: table_calculation, expression: "${conversational_turns.count}\
          \ / ${count_of_conversation_id}", label: Average Queries per Conversation,
        value_format: !!null '', value_format_name: decimal_2, _kind_hint: measure,
        table_calculation: average_queries_per_conversation, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [conversational_turns.count, count_of_conversation_id]
    listen: {}
    row: 0
    col: 19
    width: 5
    height: 5
  - title: Customer Sentiment Scores
    name: Customer Sentiment Scores
    model: ccai-dialogflow-cx
    explore: conversational_turns
    type: looker_area
    fields: [conversational_turns.sentiment_score, conversational_turns.count]
    filters:
      conversational_turns.sentiment_score: NOT NULL
    sorts: [conversational_turns.count desc 0]
    limit: 500
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    defaults_version: 1
    row: 18
    col: 6
    width: 7
    height: 11
  - title: Average Match Confidence
    name: Average Match Confidence
    model: ccai-dialogflow-cx
    explore: conversational_turns
    type: single_value
    fields: [average_of_match_confidence]
    limit: 500
    column_limit: 50
    dynamic_fields: [{measure: average_of_match_confidence, based_on: conversational_turns.match_confidence,
        expression: '', label: Average of Match Confidence, type: average, _kind_hint: measure,
        _type_hint: number}, {category: table_calculation, expression: "${average_of_match_confidence}",
        label: Truncated confidence, value_format: !!null '', value_format_name: percent_2,
        _kind_hint: measure, table_calculation: truncated_confidence, _type_hint: number}]
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
    row: 18
    col: 0
    width: 6
    height: 6
  - title: Top User Phrases
    name: Top User Phrases
    model: ccai-dialogflow-cx
    explore: conversational_turns
    type: looker_wordcloud
    fields: [conversational_turns.user_utterances, conversational_turns.count]
    filters:
      conversational_turns.user_utterances: "-NULL"
    sorts: [conversational_turns.count desc 0]
    limit: 500
    column_limit: 50
    color_application: undefined
    series_types: {}
    defaults_version: 1
    row: 5
    col: 13
    width: 11
    height: 13
  - title: Top Intents
    name: Top Intents
    model: ccai-dialogflow-cx
    explore: conversational_turns
    type: looker_bar
    fields: [conversational_turns.match_intent_display_name, conversational_turns.count]
    filters:
      conversational_turns.match_intent_display_name: "-EMPTY"
    sorts: [conversational_turns.count desc 0]
    limit: 500
    column_limit: 50
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
    row: 5
    col: 0
    width: 13
    height: 13
  - title: Customer Sentiment Score Aggregates
    name: Customer Sentiment Score Aggregates
    model: ccai-dialogflow-cx
    explore: conversational_turns
    type: looker_column
    fields: [average_of_sentiment_score, median_of_sentiment_score]
    filters:
      conversational_turns.sentiment_score: NOT NULL
    limit: 500
    dynamic_fields: [{measure: average_of_sentiment_score, based_on: conversational_turns.sentiment_score,
        expression: '', label: Average of Sentiment Score, type: average, _kind_hint: measure,
        _type_hint: number}, {measure: median_of_sentiment_score, based_on: conversational_turns.sentiment_score,
        expression: '', label: Median of Sentiment Score, type: median, _kind_hint: measure,
        _type_hint: number}]
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    defaults_version: 1
    row: 24
    col: 0
    width: 6
    height: 5
  - title: Bot Responses
    name: Bot Responses
    model: ccai-dialogflow-cx
    explore: conversational_turns
    type: looker_grid
    fields: [conversational_turns.agent_utterances, conversational_turns.count]
    filters:
      conversational_turns.agent_utterances: "-NULL"
    sorts: [conversational_turns.count desc 0]
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
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    row: 18
    col: 13
    width: 11
    height: 11
  filters:
  - name: Session Start Time
    title: Session Start Time
    type: field_filter
    default_value: 1 quarter
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: ccai-dialogflow-cx
    explore: conversations
    listens_to_filters: []
    field: conversations.conversation_start_time
