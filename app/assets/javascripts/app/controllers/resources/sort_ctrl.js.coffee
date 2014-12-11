app.controller 'SortCtrl', ($scope, $q, Sortdata, $state) ->

  Sortdata.query({}).then (results) ->
    $scope.data = results
  , (err) ->
    console.log 'Could not fetch data'
