(function () {
	"use strict";

	angular.module("app").controller("patientCtrl", function($scope, $http) {



		$scope.boolean = false

		$scope.addOne = function(){
			$scope.boolean = true

		}












		window.scope = $scope;
	});
})();