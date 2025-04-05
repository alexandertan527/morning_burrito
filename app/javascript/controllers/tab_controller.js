import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tab"
export default class extends Controller {

  static targets = [ "track", "unfinished", "trackText", "unfinishedText" ]

  connect() {
    this.trackTarget.classList
    this.unfinishedTarget.classList
  }

  // loadLearningTrack() {
  //   this.trackTextTarget.style.opacity = "1";
  //   this.unfinishedTextTarget.style.opacity = "0.5";
  // }

  // loadUnfinished() {
  //   this.unfinishedTextTarget.style.opacity = "1";
  //   this.trackTextTarget.style.opacity = "0.5";
  // }
}
