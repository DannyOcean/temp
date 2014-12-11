app.controller 'SortCtrl', ($scope, $q, Sort, $state) ->
  $scope.iarray = []

  $scope.mergesort = ->
    Sort.query({iarray: $scope.iarray}).then (results) ->
      $scope.data = results
      $scope.counter = 0
    , (err) ->
      console.log 'Could not fetch data'

  $scope.next = ->
    $scope.counter += 1
  
  $scope.prev = ->
    $scope.counter -= 1
  
  $scope.reset = ->
    $scope.counter = 0

  