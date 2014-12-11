app.factory 'Sortdata', (railsResourceFactory, RailsResource) ->
  class InviteResource extends RailsResource
    @configure
      url: '/sortdata/{{id}}'
      name: 'sortdata'
      updateMethod: 'patch'
