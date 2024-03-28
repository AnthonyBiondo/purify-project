import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="direction-api"
export default class extends Controller {
  static values = {
    tripDeparture: String,
    tripDestination: String,
    tripConsumption: Number
  };

  connect() {
    fetch(`/directions?departure=${this.tripDepartureValue}&destination=${this.tripDestinationValue}`, {
    })
    .then(response => response.json())
    .then((data) => {
      Object.keys(data).forEach((key => {
        console.log(data)
        // this.distanceTargets.innerHTML = data[key]
        document.querySelector(`#${key}`).innerHTML = data[key]
        const result = (parseInt(data["driving_distance"], 10) * this.tripConsumptionValue)
        document.querySelector(`#driving_consumption`).innerHTML = `${Math.round(result / 1000)} kg Co²e`
      }))
    });
  }
}
