import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    "cardNumberInput",
    "cardHolderInput",
    "monthInput",
    "yearInput",
    "cvvInput",
    "cardNumberBox",
    "cardHolderName",
    "expMonth",
    "expYear",
    "front",
    "back",
    "cvvBox"
  ]

  connect() {
    this.setEventListeners();
  }

  setEventListeners() {
    this.cardNumberInputTarget.oninput = () => {
      this.cardNumberBoxTarget.innerText = this.cardNumberInputTarget.value;
    }

    this.cardHolderInputTarget.oninput = () => {
      this.cardHolderNameTarget.innerText = this.cardHolderInputTarget.value;
    }

    this.monthInputTarget.oninput = () => {
      this.expMonthTarget.innerText = this.monthInputTarget.value;
    }

    this.yearInputTarget.oninput = () => {
      this.expYearTarget.innerText = this.yearInputTarget.value;
    }

    this.cvvInputTarget.onmouseenter = () => {
      this.frontTarget.style.transform = 'perspective(1000px) rotateY(-180deg)';
      this.backTarget.style.transform = 'perspective(1000px) rotateY(0deg)';
    }

    this.cvvInputTarget.onmouseleave = () => {
      this.frontTarget.style.transform = 'perspective(1000px) rotateY(0deg)';
      this.backTarget.style.transform = 'perspective(1000px) rotateY(180deg)';
    }

    this.cvvInputTarget.oninput = () => {
      this.cvvBoxTarget.innerText = this.cvvInputTarget.value;
    }
  }
}

