appAngular = require("./appAngular.coffee")

module.exports = appAngular.run(($rootScope) ->
  $rootScope.typeOf = (value) ->
    return typeof value
)

.directive("stringToNumber", ->
  return {
    require: "ngModel",
    link: (scope, element, attrs, ngModel) ->
      ngModel.$parsers.push((value) ->
        return "" + value
      )

      ngModel.$formatters.push((value) ->
        return parseFloat(value)
      )
  }
)
