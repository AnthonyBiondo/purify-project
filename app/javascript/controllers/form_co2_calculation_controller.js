import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-co2-calculation"
export default class extends Controller {
  static targets = ["ticketclass", "planetype", "roundtype", "titreresult"]
  static values = {
    distance: Number,
  };
  // connect() {
  //   console.log(this.distanceValue);
  //   console.log(this.ticketclassTarget.value);
  //   console.log(this.planetypeTarget.value);
  //   console.log(this.roundtypeTarget.value);
  // }
  calculator(event) {
    let factor = 0

    event.preventDefault()
    if (this.distanceValue < 1000){
      factor = 0.230;
    } else if(this.distanceValue > 3500){
      factor = 0.152;
    } else {
      factor = 0.178;
    }
    const result = (this.distanceValue * factor * (this.ticketclassTarget.value) * (this.planetypeTarget.value) * (this.roundtypeTarget.value))

    console.log(result);
    this.titreresultTarget.innerHTML = Math.round(result)

  }
}
