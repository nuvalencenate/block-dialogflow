
<h1><span style="color:#2d7eea">README - Your LookML Project</span></h1>

<h2><span style="color:#2d7eea">LookML Overview</span></h2>

LookML is a data modeling language for describing dimensions, fields, aggregates and relationships based on SQL.

LookML is powerful because it:

- **Is all about reusability**: Most data analysis requires the same work to be done over and over again. You extract
raw data, prepare it, deliver an analysis... and then are never able touse any of that work again. This is hugely
inefficient, since the next analysis often involves many of the same steps. With LookML, once you define a
dimension or a measure, you continue to build on it, rather than having to rewrite it again and again.
- **Empowers end users**:  The data model that data analysts and developers create in LookML condenses and
encapsulates the complexity of SQL, it and lets analysts get the knowledge about what their data means out of
their heads so others can use it. This enables non-technical users to do their jobs &mdash; building dashboards,
drilling to row-level detail, and accessing complex metrics &mdash; without having to worry about what’s behind the curtain.
- **Allows for data governance**: By defining business metrics in LookML, you can ensure that Looker is always a
credible single source of truth.

The Looker application uses a model written in LookML to construct SQL queries against a particular database that
business analysts can [Explore](https://cloud.google.com/looker/docs/r/exploring-data) on. For an overview on the basics of LookML, see [What is LookML?](https://cloud.google.com/looker/docs/r/what-is-lookml)

<h2><span style="color:#2d7eea">Learn to Speak Looker</span></h2>
R
A LookML project is a collection of LookML files that describes a set of related [views](https://cloud.google.com/looker/docs/r/terms/view-file), [models](https://cloud.google.com/looker/docs/r/terms/model-file), and [Explores](https://cloud.google.com/looker/docs/r/terms/explore).
- A [view](https://cloud.google.com/looker/docs/r/terms/view-file) (.view files) contains information about how to access or calculate information from each table (or
across multiple joined tables). Here you’ll typically define the view, its dimensions and measures, and its field sets.
- A [model](https://cloud.google.com/looker/docs/r/terms/model-file) (.model file) contains information about which tables to use and how they should be joined together.
Here you’ll typically define the model, its Explores, and its joins.
- An [Explore](https://cloud.google.com/looker/docs/r/terms/explore) is the starting point for business users to query data, and it is the end result of the LookML you are
writing. To see the Explores in this project, select an Explore from the Explore menu.

<h2><span style="color:#2d7eea">Exploring Data</span></h2>

Ad-hoc data discovery is one of Looker’s most powerful and unique features. As you evaluate use cases for your
trial, consider what business areas you would like to explore. Open the Explore menu in the main navigation to see
the Explores you are building.

<h2><span style="color:#2d7eea">The Development Workflow</span></h2>

To support a multi-developer environment, Looker is integrated with Git for version control. Follow [these directions](https://cloud.google.com/looker/docs/r/develop/git-setup)
to set up Git for your project. To edit LookML, expand the Develop drop-down and toggle on [Development Mode](https://cloud.google.com/looker/docs/r/terms/dev-mode). In
Development Mode, changes you make to the LookML model exist only in your account until you commit the
changes and push them to your production model.

<h2><span style="color:#2d7eea">Additional Resources</span></h2>

To learn more about LookML and how to develop visit:
- [Looker User Guide](https://looker.com/guide)
- [Looker Help Center](https://help.looker.com)
- [Looker University](https://training.looker.com/)


**NOTE: This block requires exporting Dialogflow Log Files to BigQuery via Stackdriver. Please [review the step-by-step guide](https://github.com/GoogleCloudPlatform/dialogflow-integrations/tree/master/stacklogs-looker) and ensure the following is complete before attempting to use this block:**
1. Created a Dialogflow Agent
2. Created a BigQuery Dataset to hold Dialogflow Stackdriver Logs and Looker Persistent Derived Table
3. Created a StackDriver Sink Export to BigQuery

___
# Readme

### What does this Block do for me?

**(1) Analyze Dialogflow Efficiency** - Provides visibility into Dialogflow application performance so that you can identify the frequency and type of user queries that are being resolved inefficiently and remediate those interactions accordingly.

**(2) Understand User Behavior** - Provides insight into the topics that users most frequently ask questions about, the nature of how their questions are phrased, and their satisfaction with answers so that you can fine-tune your interactions to maximize customer satisfaction.

### Block Info

This block is modeled on the Dialogflow schema. Each record is parsed to extract the content as well as metadata of a human interaction with the bot. For telephonic interactions, additional metadata, such as the Area Code and Trace are extracted.

### Dialogflow Raw Data Structure

Human interactions with the bot are initially extracted as a payload, which can be converted into a JSON format. Each payload contains all the information about that chat.

### Dialogflow Block Structure

The Dialogflow block consists of an Explore with three underlying views.

**(1) Parsed Transcripts View**

This view creates a Persistent Derived Table which extracts all the data about an interaction from the Dialogflow payload into a JSON object. That JSON is then parsed to extract the content, as well as characteristics, of that interaction, which form the dimensions and measures of the view.

**(2) Session Facts View**

The session_id associated with an interaction is part of the Dialogflow payload. In order to understand the context of the session in which an interaction occurred, a Persistent Derived Table is created that captures the characteristic of that session, such as its start and end time as well as the overall session duration.

**(3) Parameters View**

This view is used to define any custom variables as well as their values that are logged as part of a specific Dialogflow deployment.

### Implementation Instructions
This block is installed via the Looker Marketplace. For more information about the Looker Marketplace, please visit this [link](https://docs.looker.com/data-modeling/marketplace).

#### Constants ####
During installation you will provide two values to populate the following constants:
* Connection Name - the Looker connection with access to and permission to retrieve data from your exported dialogflow tables.
* Schema - the schema name for your exported data.
* Table Partition - Table Partition Name (If Applicable).

#### Customization ####
- This block uses Refinements to allow for modification or extension of the LookML content. For more information on using refinements to customize marketplace blocks, please see [this documentation](https://docs.looker.com/data-modeling/marketplace/customize-blocks).

**Custom Variables**

Using the refinements file, you'll be able to add any custom dimensions that you'd like to track with a dimension declaration. An example that extracts the custom dimension country from a parameter called 'geo-country' is shown below:

```
view +parsed_transcripts {
dimension: country {
  type: string
  sql: (SELECT json_extract_scalar(parameters, '$.value.string_value')
    FROM UNNEST([${TABLE}]) WHERE ${key} = 'geo-country');;
}}
```
