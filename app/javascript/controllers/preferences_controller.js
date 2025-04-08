import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="preferences"
export default class extends Controller {
  static targets = [ "length", "category", "lengthTick", "categoryTick", "update", "tagline", "challengetag" ];

  lengthTargetConnected(lengthTarget) {
    lengthTarget.classList.remove("d-none")
    setTimeout(() => {
      (lengthTarget.classList.add("visible"))
    }, 100);
  }

  showLengthButton() {
    this.lengthTickTarget.classList.remove("d-none");
    this.lengthTickTarget.classList.add("visible", "fa-fade");
    this.taglineTarget.innerText = "Fit this challenge into your routine and set the right time for you!"
  }

  scrollLength() {
    this.lengthTarget.scrollIntoView();
  }

  loadCategory() {
    console.log("hello")
    const category = this.categoryTarget;
    category.classList.remove("d-none");
    category.classList.add("visible");
    setTimeout(() => {
      category.scrollIntoView();
    }, 100);
  }

  categoryIntoView() {
    this.categoryTarget.scrollIntoView();
    this.categoryTickTarget.classList.remove("d-none");
    this.categoryTickTarget.classList.add("visible", "fa-fade");
  }

  scrollCategory() {
    this.categoryTarget.scrollIntoView();
  }

  loadUpdate() {
    let update = this.updateTarget;
    update.classList.remove("d-none");
    update.classList.add("visible");
    update.scrollIntoView();
  }
}
