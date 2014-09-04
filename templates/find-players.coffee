$(document).ready ->
  window.teams = %{toJSON teams}
  $("#select-team").selectize
    delimiter: ','
    render:
      option: (item, escape) ->
        team = teams[item.value]
        "
          <div style='border-left: 3px solid ##{team.color}'>
            #{escape(item.text)}
          </div>
        "
    plugins: ['optgroup_columns']
