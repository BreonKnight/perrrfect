angular.module('comboTime', ['ui.router', 'templates'])
  .controller('ComboMaker', [
    '$scope',
    function($scope){
      $scope.test = 'Hello World'
    }
  ]);
