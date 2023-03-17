# Define the database connection to be used for this model.
connection: "prospect-ccai-logs"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: ccai-prototype_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: ccai-prototype_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Ccai-prototype"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: export_errors {}

explore: dialogflow_runtime_googleapis_com_requests {
  join: dialogflow_runtime_googleapis_com_requests__json_payload__messages {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Messages"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests.json_payload__messages}) as dialogflow_runtime_googleapis_com_requests__json_payload__messages ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__messages__text__text {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Messages Text Text"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__json_payload__messages.text__text}) as dialogflow_runtime_googleapis_com_requests__json_payload__messages__text__text ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__webhookids {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Webhookids"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests.json_payload__queryresult__webhookids}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__webhookids ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__webhooklatencies {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Webhooklatencies"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests.json_payload__queryresult__webhooklatencies}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__webhooklatencies ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__webhookdisplaynames {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Webhookdisplaynames"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests.json_payload__queryresult__webhookdisplaynames}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__webhookdisplaynames ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__webhookstatuses {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Webhookstatuses"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests.json_payload__queryresult__webhookstatuses}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__webhookstatuses ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__responsemessages {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Responsemessages"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests.json_payload__queryresult__responsemessages}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__responsemessages ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryparams__parameters__external_param {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryparams Parameters External Param"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests.json_payload__queryparams__parameters__external_param}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryparams__parameters__external_param ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__parameters__external_param {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Parameters External Param"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests.json_payload__queryresult__parameters__external_param}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__parameters__external_param ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__sessioninfo__parameters__external_param {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Sessioninfo Parameters External Param"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests.json_payload__sessioninfo__parameters__external_param}) as dialogflow_runtime_googleapis_com_requests__json_payload__sessioninfo__parameters__external_param ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__pageinfo__forminfo__parameterinfo {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Pageinfo Forminfo Parameterinfo"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests.json_payload__pageinfo__forminfo__parameterinfo}) as dialogflow_runtime_googleapis_com_requests__json_payload__pageinfo__forminfo__parameterinfo ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__responsemessages__text__text {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Responsemessages Text Text"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__responsemessages.text__text}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__responsemessages__text__text ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_webhookrequest__messages {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Webhookrequest Messages"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests.jsonpayload_v3alpha1_webhookrequest__messages}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_webhookrequest__messages ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_webhookrequest__messages__text__text {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Webhookrequest Messages Text Text"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_webhookrequest__messages.text__text}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_webhookrequest__messages__text__text ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__webhook_latencies__ms_ {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Webhook Latencies Ms"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests.json_payload__queryresult__diagnosticinfo__webhook_latencies__ms_}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__webhook_latencies__ms_ ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__unfulfilled_parameters {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Unfulfilled Parameters"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests.json_payload__queryresult__diagnosticinfo__unfulfilled_parameters}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__unfulfilled_parameters ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__webhookids {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Webhookids"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests.jsonpayload_v3alpha1_detectintentresponse__queryresult__webhookids}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__webhookids ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__triggered_transition_names {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Triggered Transition Names"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests.json_payload__queryresult__diagnosticinfo__triggered_transition_names}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__triggered_transition_names ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Execution Sequence"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests.json_payload__queryresult__diagnosticinfo__execution_sequence}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__alternative_matched_intents {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Alternative Matched Intents"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests.json_payload__queryresult__diagnosticinfo__alternative_matched_intents}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__alternative_matched_intents ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__webhooklatencies {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Webhooklatencies"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests.jsonpayload_v3alpha1_detectintentresponse__queryresult__webhooklatencies}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__webhooklatencies ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryinput__speechtranscripts__finaltranscripts__alternatives {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryinput Speechtranscripts Finaltranscripts Alternatives"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests.json_payload__queryinput__speechtranscripts__finaltranscripts__alternatives}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryinput__speechtranscripts__finaltranscripts__alternatives ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__webhookdisplaynames {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Webhookdisplaynames"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests.jsonpayload_v3alpha1_detectintentresponse__queryresult__webhookdisplaynames}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__webhookdisplaynames ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_webhookrequest__pageinfo__forminfo__parameterinfo {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Webhookrequest Pageinfo Forminfo Parameterinfo"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests.jsonpayload_v3alpha1_webhookrequest__pageinfo__forminfo__parameterinfo}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_webhookrequest__pageinfo__forminfo__parameterinfo ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__transition_targets_chain {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Transition Targets Chain"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests.json_payload__queryresult__diagnosticinfo__transition_targets_chain}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__transition_targets_chain ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__responsemessages {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Responsemessages"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests.jsonpayload_v3alpha1_detectintentresponse__queryresult__responsemessages}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__responsemessages ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__responsemessages__text__text {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Responsemessages Text Text"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__responsemessages.text__text}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__responsemessages__text__text ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__webhook_latencies__ms_ {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Diagnosticinfo Webhook Latencies Ms"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests.jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__webhook_latencies__ms_}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__webhook_latencies__ms_ ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__triggered_transition_names {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Diagnosticinfo Triggered Transition Names"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests.jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__triggered_transition_names}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__triggered_transition_names ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Diagnosticinfo Execution Sequence"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests.jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__alternative_matched_intents {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Diagnosticinfo Alternative Matched Intents"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests.jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__alternative_matched_intents}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__alternative_matched_intents ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_2__functionexecution__responses {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Execution Sequence Step 2 Functionexecution Responses"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence.step_2__functionexecution__responses}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_2__functionexecution__responses ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_9__functionexecution__responses {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Execution Sequence Step 9 Functionexecution Responses"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence.step_9__functionexecution__responses}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_9__functionexecution__responses ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_8__functionexecution__responses {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Execution Sequence Step 8 Functionexecution Responses"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence.step_8__functionexecution__responses}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_8__functionexecution__responses ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_7__functionexecution__responses {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Execution Sequence Step 7 Functionexecution Responses"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence.step_7__functionexecution__responses}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_7__functionexecution__responses ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_6__functionexecution__responses {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Execution Sequence Step 6 Functionexecution Responses"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence.step_6__functionexecution__responses}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_6__functionexecution__responses ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_5__functionexecution__responses {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Execution Sequence Step 5 Functionexecution Responses"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence.step_5__functionexecution__responses}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_5__functionexecution__responses ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_4__functionexecution__responses {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Execution Sequence Step 4 Functionexecution Responses"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence.step_4__functionexecution__responses}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_4__functionexecution__responses ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_3__functionexecution__responses {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Execution Sequence Step 3 Functionexecution Responses"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence.step_3__functionexecution__responses}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_3__functionexecution__responses ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_10__functionexecution__responses {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Execution Sequence Step 10 Functionexecution Responses"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence.step_10__functionexecution__responses}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_10__functionexecution__responses ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_11__functionexecution__responses {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Execution Sequence Step 11 Functionexecution Responses"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence.step_11__functionexecution__responses}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_11__functionexecution__responses ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_2__functionexecution__responses__text__text {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Execution Sequence Step 2 Functionexecution Responses Text Text"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_2__functionexecution__responses.text__text}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_2__functionexecution__responses__text__text ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_9__functionexecution__responses__text__text {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Execution Sequence Step 9 Functionexecution Responses Text Text"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_9__functionexecution__responses.text__text}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_9__functionexecution__responses__text__text ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_8__functionexecution__responses__text__text {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Execution Sequence Step 8 Functionexecution Responses Text Text"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_8__functionexecution__responses.text__text}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_8__functionexecution__responses__text__text ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_7__functionexecution__responses__text__text {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Execution Sequence Step 7 Functionexecution Responses Text Text"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_7__functionexecution__responses.text__text}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_7__functionexecution__responses__text__text ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_6__functionexecution__responses__text__text {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Execution Sequence Step 6 Functionexecution Responses Text Text"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_6__functionexecution__responses.text__text}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_6__functionexecution__responses__text__text ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_5__functionexecution__responses__text__text {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Execution Sequence Step 5 Functionexecution Responses Text Text"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_5__functionexecution__responses.text__text}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_5__functionexecution__responses__text__text ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_4__functionexecution__responses__text__text {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Execution Sequence Step 4 Functionexecution Responses Text Text"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_4__functionexecution__responses.text__text}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_4__functionexecution__responses__text__text ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_3__functionexecution__responses__text__text {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Execution Sequence Step 3 Functionexecution Responses Text Text"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_3__functionexecution__responses.text__text}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_3__functionexecution__responses__text__text ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_10__functionexecution__responses__text__text {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Execution Sequence Step 10 Functionexecution Responses Text Text"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_10__functionexecution__responses.text__text}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_10__functionexecution__responses__text__text ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_11__functionexecution__responses__text__text {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Execution Sequence Step 11 Functionexecution Responses Text Text"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_11__functionexecution__responses.text__text}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_11__functionexecution__responses__text__text ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__transition_targets_chain {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Diagnosticinfo Transition Targets Chain"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests.jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__transition_targets_chain}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__transition_targets_chain ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_2__functionexecution__responses__text__redactedtext {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Execution Sequence Step 2 Functionexecution Responses Text Redactedtext"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_2__functionexecution__responses.text__redactedtext}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_2__functionexecution__responses__text__redactedtext ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_1__initialstate__sessionparameters__external_param {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Execution Sequence Step 1 Initialstate Sessionparameters External Param"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence.step_1__initialstate__sessionparameters__external_param}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_1__initialstate__sessionparameters__external_param ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_9__functionexecution__responses__text__redactedtext {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Execution Sequence Step 9 Functionexecution Responses Text Redactedtext"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_9__functionexecution__responses.text__redactedtext}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_9__functionexecution__responses__text__redactedtext ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_8__functionexecution__responses__text__redactedtext {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Execution Sequence Step 8 Functionexecution Responses Text Redactedtext"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_8__functionexecution__responses.text__redactedtext}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_8__functionexecution__responses__text__redactedtext ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_7__functionexecution__responses__text__redactedtext {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Execution Sequence Step 7 Functionexecution Responses Text Redactedtext"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_7__functionexecution__responses.text__redactedtext}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_7__functionexecution__responses__text__redactedtext ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_6__functionexecution__responses__text__redactedtext {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Execution Sequence Step 6 Functionexecution Responses Text Redactedtext"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_6__functionexecution__responses.text__redactedtext}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_6__functionexecution__responses__text__redactedtext ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_5__functionexecution__responses__text__redactedtext {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Execution Sequence Step 5 Functionexecution Responses Text Redactedtext"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_5__functionexecution__responses.text__redactedtext}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_5__functionexecution__responses__text__redactedtext ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_4__functionexecution__responses__text__redactedtext {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Execution Sequence Step 4 Functionexecution Responses Text Redactedtext"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_4__functionexecution__responses.text__redactedtext}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_4__functionexecution__responses__text__redactedtext ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_3__functionexecution__responses__text__redactedtext {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Execution Sequence Step 3 Functionexecution Responses Text Redactedtext"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_3__functionexecution__responses.text__redactedtext}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_3__functionexecution__responses__text__redactedtext ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_10__functionexecution__responses__text__redactedtext {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Execution Sequence Step 10 Functionexecution Responses Text Redactedtext"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_10__functionexecution__responses.text__redactedtext}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_10__functionexecution__responses__text__redactedtext ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_11__functionexecution__responses__text__redactedtext {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Execution Sequence Step 11 Functionexecution Responses Text Redactedtext"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_11__functionexecution__responses.text__redactedtext}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_11__functionexecution__responses__text__redactedtext ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_2__functionexecution__systemfunctionresults___sys_func_substitute {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload Queryresult Diagnosticinfo Execution Sequence Step 2 Functionexecution Systemfunctionresults Sys Func Substitute"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence.step_2__functionexecution__systemfunctionresults___sys_func_substitute}) as dialogflow_runtime_googleapis_com_requests__json_payload__queryresult__diagnosticinfo__execution_sequence__step_2__functionexecution__systemfunctionresults___sys_func_substitute ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_2__functionexecution__responses {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Diagnosticinfo Execution Sequence Step 2 Functionexecution Responses"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence.step_2__functionexecution__responses}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_2__functionexecution__responses ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_9__functionexecution__responses {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Diagnosticinfo Execution Sequence Step 9 Functionexecution Responses"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence.step_9__functionexecution__responses}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_9__functionexecution__responses ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_8__functionexecution__responses {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Diagnosticinfo Execution Sequence Step 8 Functionexecution Responses"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence.step_8__functionexecution__responses}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_8__functionexecution__responses ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_7__functionexecution__responses {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Diagnosticinfo Execution Sequence Step 7 Functionexecution Responses"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence.step_7__functionexecution__responses}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_7__functionexecution__responses ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_6__functionexecution__responses {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Diagnosticinfo Execution Sequence Step 6 Functionexecution Responses"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence.step_6__functionexecution__responses}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_6__functionexecution__responses ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_5__functionexecution__responses {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Diagnosticinfo Execution Sequence Step 5 Functionexecution Responses"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence.step_5__functionexecution__responses}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_5__functionexecution__responses ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_4__functionexecution__responses {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Diagnosticinfo Execution Sequence Step 4 Functionexecution Responses"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence.step_4__functionexecution__responses}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_4__functionexecution__responses ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_3__functionexecution__responses {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Diagnosticinfo Execution Sequence Step 3 Functionexecution Responses"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence.step_3__functionexecution__responses}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_3__functionexecution__responses ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_10__functionexecution__responses {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Diagnosticinfo Execution Sequence Step 10 Functionexecution Responses"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence.step_10__functionexecution__responses}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_10__functionexecution__responses ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_2__functionexecution__responses__text__text {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Diagnosticinfo Execution Sequence Step 2 Functionexecution Responses Text Text"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_2__functionexecution__responses.text__text}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_2__functionexecution__responses__text__text ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_9__functionexecution__responses__text__text {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Diagnosticinfo Execution Sequence Step 9 Functionexecution Responses Text Text"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_9__functionexecution__responses.text__text}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_9__functionexecution__responses__text__text ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_8__functionexecution__responses__text__text {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Diagnosticinfo Execution Sequence Step 8 Functionexecution Responses Text Text"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_8__functionexecution__responses.text__text}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_8__functionexecution__responses__text__text ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_7__functionexecution__responses__text__text {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Diagnosticinfo Execution Sequence Step 7 Functionexecution Responses Text Text"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_7__functionexecution__responses.text__text}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_7__functionexecution__responses__text__text ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_6__functionexecution__responses__text__text {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Diagnosticinfo Execution Sequence Step 6 Functionexecution Responses Text Text"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_6__functionexecution__responses.text__text}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_6__functionexecution__responses__text__text ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_5__functionexecution__responses__text__text {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Diagnosticinfo Execution Sequence Step 5 Functionexecution Responses Text Text"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_5__functionexecution__responses.text__text}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_5__functionexecution__responses__text__text ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_4__functionexecution__responses__text__text {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Diagnosticinfo Execution Sequence Step 4 Functionexecution Responses Text Text"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_4__functionexecution__responses.text__text}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_4__functionexecution__responses__text__text ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_3__functionexecution__responses__text__text {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Diagnosticinfo Execution Sequence Step 3 Functionexecution Responses Text Text"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_3__functionexecution__responses.text__text}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_3__functionexecution__responses__text__text ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_10__functionexecution__responses__text__text {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Diagnosticinfo Execution Sequence Step 10 Functionexecution Responses Text Text"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_10__functionexecution__responses.text__text}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_10__functionexecution__responses__text__text ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_2__functionexecution__responses__text__redactedtext {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Diagnosticinfo Execution Sequence Step 2 Functionexecution Responses Text Redactedtext"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_2__functionexecution__responses.text__redactedtext}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_2__functionexecution__responses__text__redactedtext ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_9__functionexecution__responses__text__redactedtext {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Diagnosticinfo Execution Sequence Step 9 Functionexecution Responses Text Redactedtext"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_9__functionexecution__responses.text__redactedtext}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_9__functionexecution__responses__text__redactedtext ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_8__functionexecution__responses__text__redactedtext {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Diagnosticinfo Execution Sequence Step 8 Functionexecution Responses Text Redactedtext"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_8__functionexecution__responses.text__redactedtext}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_8__functionexecution__responses__text__redactedtext ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_7__functionexecution__responses__text__redactedtext {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Diagnosticinfo Execution Sequence Step 7 Functionexecution Responses Text Redactedtext"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_7__functionexecution__responses.text__redactedtext}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_7__functionexecution__responses__text__redactedtext ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_6__functionexecution__responses__text__redactedtext {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Diagnosticinfo Execution Sequence Step 6 Functionexecution Responses Text Redactedtext"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_6__functionexecution__responses.text__redactedtext}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_6__functionexecution__responses__text__redactedtext ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_5__functionexecution__responses__text__redactedtext {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Diagnosticinfo Execution Sequence Step 5 Functionexecution Responses Text Redactedtext"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_5__functionexecution__responses.text__redactedtext}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_5__functionexecution__responses__text__redactedtext ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_4__functionexecution__responses__text__redactedtext {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Diagnosticinfo Execution Sequence Step 4 Functionexecution Responses Text Redactedtext"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_4__functionexecution__responses.text__redactedtext}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_4__functionexecution__responses__text__redactedtext ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_3__functionexecution__responses__text__redactedtext {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Diagnosticinfo Execution Sequence Step 3 Functionexecution Responses Text Redactedtext"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_3__functionexecution__responses.text__redactedtext}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_3__functionexecution__responses__text__redactedtext ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_10__functionexecution__responses__text__redactedtext {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Diagnosticinfo Execution Sequence Step 10 Functionexecution Responses Text Redactedtext"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_10__functionexecution__responses.text__redactedtext}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_10__functionexecution__responses__text__redactedtext ;;
    relationship: one_to_many
  }

  join: dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_2__functionexecution__systemfunctionresults___sys_func_substitute {
    view_label: "Dialogflow Runtime Googleapis Com Requests: Jsonpayload V3alpha1 Detectintentresponse Queryresult Diagnosticinfo Execution Sequence Step 2 Functionexecution Systemfunctionresults Sys Func Substitute"
    sql: LEFT JOIN UNNEST(${dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence.step_2__functionexecution__systemfunctionresults___sys_func_substitute}) as dialogflow_runtime_googleapis_com_requests__jsonpayload_v3alpha1_detectintentresponse__queryresult__diagnosticinfo__execution_sequence__step_2__functionexecution__systemfunctionresults___sys_func_substitute ;;
    relationship: one_to_many
  }
}
