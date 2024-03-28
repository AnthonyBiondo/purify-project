import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="direction-api"
export default class extends Controller {
  static targets = [ "lineHoriz" ]
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
      console.log(data)
      Object.keys(data).forEach((key => {
        const loader = document.querySelector(`#spinner-${key}`)
        if (loader) {
          loader.classList.add('disapear')
          loader.remove()
        }
        const planeLoader = document.querySelector(`#spinner-plane_duration`)
        if (planeLoader) {
          planeLoader.classList.add('disapear')
          planeLoader.remove()
        }
        this.lineHorizTargets.forEach((line) => {
          line.classList.add('display-it')
        })
        document.querySelector(`#${key}`).innerHTML = data[key]
        const result = (parseInt(data["driving_distance"], 10) * this.tripConsumptionValue)
        document.querySelector(`#driving_consumption`).innerHTML = `${Math.round(result / 1000)} kg Co²e`
      }))
    });
  }
}
