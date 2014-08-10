#= require ./store
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree ./helpers
#= require_tree ./components
#= require_tree ./templates
#= require_tree ./routes
#= require ./router
#= require_self
#= require ./fixtures

App.ApplicationStore = DS.Store.extend(
  revision: 11
  adapter: "DS.FixtureAdapter"
)

App.Item = DS.Model.extend(
	metalName: DS.attr('string')
	employeeName: DS.attr('string')
	metalType: DS.attr('string')
	metalAttribute: DS.attr('string')
	metalRequired: DS.attr('boolean')
	updatedAt: DS.attr('date')
)

# App.ItemsRoute = Ember.Route.extend(model: ->
# 	App.Item.find()
# )

App.ItemController = Ember.ObjectController.extend(
	isEditing: false
	edit: ->
		@set "isEditing", true

	doneEditing: ->
		@set "isEditing", false
)

App.IndexRoute = Ember.Route.extend(redirect: ->
	@transitionTo "items"
)

Ember.Handlebars.registerBoundHelper "date", (date) ->
	moment(date).fromNow()

App.Router.map ->
	@resource "about"
	@resource "items", ->
		@resource "item",
			path: ":item_id"
