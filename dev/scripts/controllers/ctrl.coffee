
angular.module 'controllersModule'
  .controller 'mainCtrl', ($scope) ->
    $scope.nodes = [
      'First value'
      'Second value'
      'Third value'
    ]
    undefined