import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="objectives"
export default class extends Controller {
  static targets = ["goal"]
  connect() {
    console.log('conected obj');
  }

  home() {
    this.goalTarget.value = "Buy a Home"
  }

  travel() {
    this.goalTarget.value = "Travel"
  }

  emergency() {
    this.goalTarget.value = "Emergency"
  }

}
