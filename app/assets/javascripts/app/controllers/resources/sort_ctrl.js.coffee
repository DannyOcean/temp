app.controller 'SortCtrl', ($scope, Sort, $interval) ->
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

  $scope.play = ->
    $scope.timer = $interval (->
      $scope.next()
      return
      ), 800, $scope.data.size

  $scope.reset = ->
    $interval.cancel($scope.timer)
    $scope.counter = 0
