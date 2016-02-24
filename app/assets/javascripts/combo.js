angular.module('comboTime', ['ui.router', 'templates'])
  .controller('ComboMaker', [
    '$scope',
    function($scope){
      var myEl = angular.element( document.querySelector( '#HK' ) );
      // $scope.element = myEl
      // $scope.test = 'Hello World'
      // console.log(myEl)
    }
  ]);
