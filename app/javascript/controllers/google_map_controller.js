import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="google-map"
export default class extends Controller {
  static values = {
    markers: Array
  };

  connect() {
    this.initMap();
    console.log(this.element);
    console.log(this.markersValue)
  }

  // Initialize and add the map
  async initMap() {
    // The location of Uluru
    const position = { lat: 25.2048493, lng: 55.2707828 };
    // Request needed libraries.
    //@ts-ignore
    const { Map } = await google.maps.importLibrary("maps");
    const { AdvancedMarkerView } = await google.maps.importLibrary("marker");

    // The map, centered at Uluru
    this.map = new Map(document.getElementById("map"), {
      zoom: 2,
      center: position,
      mapId: "DEMO_MAP_ID",
    });

    this.markersValue.forEach((marker) => {
      this.markerCoordinates = {lat: marker[0], lng: marker[1]}
      const newMarker = new AdvancedMarkerView({
        map: this.map,
        position: this.markerCoordinates,
        title: "Uluru",
      });
    })
  }
}
