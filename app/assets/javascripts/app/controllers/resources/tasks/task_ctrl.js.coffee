app.controller 'TaskCtrl', ($scope, $q, $stateParams, Task, $state) ->

  Task.get({ projectId: $stateParams.projectId, id: $stateParams.taskId }).then (task) ->
    $scope.task = task
  , ->
    console.log 'Could not fetch the task'

  $scope.save = (taskForm)->
    $scope.$broadcast('runCustomValidations')

    if taskForm.$valid
      $scope.task.save().then (response) ->
        $state.go('project.tasks', {}, { reload: true })
        console.log 'Successfuly updated the task'
      , ->
        console.log 'Could not save the task'
