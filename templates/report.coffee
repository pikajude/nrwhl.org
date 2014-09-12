angular.module('matchReporter', ['schemaForm'])
  .controller 'FormController', ($scope) ->
    $scope.reportSchema =
      type: 'object'
      properties:
        home_team:
          title: 'Home team'
          $ref: 'Team'
        away_team:
          title: 'Away team'
          $ref: 'Team'
        goals:
          type: 'array'
          items:
            $ref: 'Goal'
            title: 'Goal'
          title: 'Goals'
      required: ['home_team', 'away_team', 'goals']
      models:
        Goal:
          properties:
            scorer:
              type: 'string'
              title: 'Scorer'
            time:
              type: 'string'
              pattern: '[0-5]:[0-5][0-9]'
              title: 'Time'
          required: ['scorer', 'time']
        Team:
          properties:
            name:
              type: 'string'
              title: 'Team name'
            players:
              title: 'Players'
              type: 'array'
              minItems: 4
              maxItems: 4
              items:
                $ref: 'Player'
                title: 'Player'
              uniqueItems: true
          required: ['name', 'players']
        Player:
          properties:
            ID:
              type: 'number'
            name:
              type: 'string'
              minLength: 2
              title: 'Username'
          required: ['name', 'ID']

    $scope.reportForm = [
      '*',
      {
        type: 'submit'
        title: 'Save'
      }
    ]

    $scope.reportModel = {}
