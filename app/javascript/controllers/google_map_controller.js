import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="google-map"
export default class extends Controller {
  static values = {
    markers: Array,
    center: Array,
    bounding: Array
  };

  connect() {
    this.initMap();
  }

  // Initialize and add the map
  async initMap() {
    // The location of Uluru
    const position = { lat: this.centerValue[0], lng: this.centerValue[1] };
    // Request needed libraries.
    //@ts-ignore
    const { Map } = await google.maps.importLibrary("maps");
    const { AdvancedMarkerView } = await google.maps.importLibrary("marker");


    // The map, centered at Uluru
    this.map = new Map(document.getElementById("map"), {
      zoom: 4,
      center: position,
      mapId: "a91aedc354161852",
      fullscreenControl: false,
      streetViewControl: false,
      disableDefaultUI: true
    });


    this.markersValue.forEach((marker) => {
      this.markerCoordinates = {lat: marker[0], lng: marker[1]}
      const pinViewBackground = new google.maps.marker.PinView({
        background: "#E6549A",
      });
      const newMarker = new AdvancedMarkerView({
        map: this.map,
        position: this.markerCoordinates,
        title: "Purify_Show",
        content: pinViewBackground.element,
      });
    })

    const markerBounds = new google.maps.LatlngBounds();
    this.boundingValue.forEach(bound => {
      markerBounds.extend(bound);
    });
    this.map.fitBounds(markerBounds)
  }

}
