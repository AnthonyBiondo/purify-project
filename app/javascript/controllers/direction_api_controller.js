import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="direction-api"
export default class extends Controller {

  static values = {
    tripDeparture: String,
    tripDestination: String
  };

  connect() {
    fetch(`/directions?departure=${this.tripDepartureValue}&destination=${this.tripDestinationValue}`, {
    })
    .then(response => response.json())
    .then((data) => {
      Object.keys(data).forEach((key => {
        console.log(key)
        document.querySelector(`#${key}`).innerHTML = data[key]
      }))
    });
  }
}
