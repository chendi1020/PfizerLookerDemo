# Define the database connection to be used for this model.
connection: "dil-demo"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: pfizer_demo_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: pfizer_demo_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Pfizer Demo"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: diabetes {
  view_name: state_county_list
  join: hcc_by_county_diabetes {
    type: left_outer
    relationship: one_to_many
    sql_on:  ${state_county_list.state}=${hcc_by_county_diabetes.state}
    and ${state_county_list.county}= ${hcc_by_county_diabetes.county};;
  }

  join: proc_by_county_18 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${state_county_list.county}= ${proc_by_county_18.county}
    and ${state_county_list.state}= ${hcc_by_county_diabetes.state};;
  }
}

explore: hcc_by_county_diabetes {}


explore: hcc_by_state_diabetes {}

explore: proc_by_county {
  view_name: proc_by_county_18
}
