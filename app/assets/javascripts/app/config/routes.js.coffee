app.config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise('/sort')
  $stateProvider
    .state 'sort',
      url: '/sort'
      templateUrl: 'sort/index.html'
      controller: 'SortCtrl'
