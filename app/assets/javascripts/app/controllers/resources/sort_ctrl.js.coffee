app.controller 'SortCtrl', ($scope, $q, Sort, $state) ->
  $scope.iarray = []

  $scope.mergesort = ->
    Sort.query({iarray: $scope.iarray}).then (results) ->
      $scope.data = results
    , (err) ->
      console.log 'Could not fetch data'
