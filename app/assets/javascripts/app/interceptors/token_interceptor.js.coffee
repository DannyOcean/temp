app.factory 'TokenInterceptor', ($q, $window, AuthenticationService, $location) ->
  request: (config) ->
    config.headers ?= {}
    if $window.localStorage.visualizrToken
      config.headers.Authorization = 'Token token=' + $window.localStorage.visualizrToken
    config

  requestError: (rejection) ->
    $q.reject(rejection)

  response: (response) ->
    response || $q.when(response)

  responseError: (rejection) ->
    if rejection?.status == 401 && $window.localStorage.visualizrToken
      delete $window.localStorage.visualizrToken
      AuthenticationService.isLoggedIn = false
      $location.path('/sign_in')
    $q.reject(rejection)