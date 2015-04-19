(function () {
	"use strict";

	angular.module("app").controller("patientCtrl", function($scope, $http) {


		$scope.fetchData= function(){
	  		$http.get("patients.json").then(function(response){
	  			$scope.patients = response.data["patients"];
	  		});
	  	}

		$scope.patientShowing = false;

		$scope.wantNew = false;

		$scope.toggleNewPatient = function(){
			$scope.patientShowing = !$scope.patientShowing;
		}


		$scope.adddNewPatient = function(firstName, lastName, dateOfBirth, cancerType, ageOfDiagnosis){
			var patient = (fistName, lastName, dateOfBirth, {cancer: {cancer_type: cancerType, age_of_diagnosis: ageOfDiagnosis}});
			$http.post('patients.json', patient).then(function(response){
				$scope.patients.push(patient);
				$scope.firstName = undefined;
				$scope.lastName = undefined;
				$scope.dateOfBirth = undefined;
				$scope.cancerType = undefined;
				$scope.ageOfDiagnosis = undefined;
			});
		}


		$scope.adddNewPatient = function(first_name, last_name, date_of_birth, cancer_type, age_of_diagnosis){

		}

		$scope.toggleNewCancer = function(patient){
			patient.addNewCancer = !patient.addNewCancer;
		}

		$scope.addCancer = function(id, patient, cancerType, ageOfDiagnosis){
			var cancer = {cancer_type: cancerType, age_of_diagnosis: ageOfDiagnosis, patient_id: id};
			console.log(patient);
			console.log(id);

			// $http.post('cancers', cancer).then(function(response){
			// 	$scope.patients.splice($scope.patients.indexOf(patient), 1);
			// 		 // $scope.tasks.splice($scope.tasks.indexOf($scope.tasks[j]), 1);
			// 	$scope.patient.push(cancer);
			// 	$scope.patients.push(patient);
			// 	$scope.cancerTypeTwo = undefined;
			// 	$scope.ageOfDiagnosisTwo = undefined;

			// })
		}



		$scope.deleteProfile = function(patient){
			var patient = patient;
			$http.delete('patients/patient.id', patient).then(function(response){
				$scope.patients.splice($scope.patients.indexOf($scope.patient), 1);

			})
		}

		$scope.addCountry = function(countryName, countryPopulation){
  		var country = {Name: countryName, Population: countryPopulation, visible: true};

  		$http.post('api/v1/countries.json', country).then(function(response){
  			$scope.countries.push(country);
  			$scope.countryName = undefined
  			$scope.countryPopulation = undefined
  			$scope.errors = null
  		}, function(error){
  			$scope.errors = error.data.errors;
  		});

  		}













		window.scope = $scope;
	});
})();