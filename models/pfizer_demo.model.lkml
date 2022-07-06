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

  join: geo_puf {
    type: left_outer
    relationship: one_to_many
    sql_on: ${state_county_list.state}=${geo_puf.state}
    and ${state_county_list.county}= ${geo_puf.county}
    and ${hcc_by_county_diabetes.year}= ${geo_puf.year};;
  }

  join: geo_puf_wide {
    type: left_outer
    relationship: one_to_one
    sql_on: ${state_county_list.state}=${geo_puf_wide.state}
          and ${state_county_list.county}= ${geo_puf_wide.county}
          and ${hcc_by_county_diabetes.year}= ${geo_puf_wide.year};;
  }
}

explore: geo_puf_wide {
  join: state_county_list {
    type: inner
    relationship: many_to_one
    sql_on: ${geo_puf_wide.state}=${state_county_list.state}
    and ${geo_puf_wide.county}= ${state_county_list.county};;
  }

  join: geo_puf {
    type: inner
    relationship: one_to_many
    sql_on: ${geo_puf_wide.state}=${geo_puf.state}
    and ${geo_puf_wide.county}= ${geo_puf.county}
    and ${geo_puf_wide.year}= ${geo_puf.year};;
  }
}

explore: hcc_all {
  join: state_county_list {
    type: inner
    relationship: many_to_one
    sql_on: ${hcc_all.state}= ${state_county_list.state}
    and ${hcc_all.county}= ${state_county_list.county}
    and ${hcc_all.state} <> 'PR'
    ;;
  }
}

explore: betos {
  join: state_county_list {
    type: inner
    relationship: many_to_one
    sql_on: ${betos.state}= ${state_county_list.state}
    and ${betos.county}=  ${state_county_list.county}
    and ${betos.state} <> 'PR'
    ;;
  }
}

explore: ssp_exp_rs {
  join: state_county_list {
    type: inner
    relationship: many_to_one
    sql_on: ${state_county_list.state}=${ssp_exp_rs.State}
    and ${state_county_list.county}= ${ssp_exp_rs.County}
    and ${ssp_exp_rs.State}<>'PR'
    ;;
  }
}

# explore: hcc_by_state_diabetes {}

# explore: proc_by_county {
#   view_name: proc_by_county_18
# }
