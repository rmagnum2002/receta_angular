describe "RecipeController", ->
  scope        = null
  ctrl         = null
  routeParams  = null
  httpBackend  = null
  recipeId     = 42

  fakeRecipe   =
    id: recipeId
    name: "Baked Potatoes"
    instructions: "Pierce potato with fork, nuke for 20 minutes"

  setupController =(recipeExists=true)->
    inject(($location, $routeParams, $rootScope, $httpBackend, $controller)->
      scope       = $rootScope.$new()
      location    = $location
      httpBackend = $httpBackend
      routeParams = $routeParams
      routeParams.recipeId = recipeId

      ctrl        = $controller('RecipeController',
                                $scope: scope)
    )

  beforeEach(module("receta"))

  afterEach ->
    httpBackend.verifyNoOutstandingExpectation()
    httpBackend.verifyNoOutstandingRequest()

  describe 'controller initialization', ->
    describe 'recipe is found', ->
      beforeEach(setupController())
      it 'loads the given recipe', ->
        httpBackend.flush()
        expect(scope.recipe).toEqualData(fakeRecipe)
    describe 'recipe is not found', ->
      beforeEach(setupController(false))
      it 'loads the given recipe', ->
        httpBackend.flush()
        expect(scope.recipe).toBe(null)
        # what else?!
