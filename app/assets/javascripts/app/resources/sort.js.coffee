app.factory 'Sort', (railsResourceFactory, RailsResource) ->
  class SortResource extends RailsResource
    @configure
      url: '/sort/mergesort'
      name: 'sort'
      updateMethod: 'patch'

