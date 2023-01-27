import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "dymanic" ]

  toggle() {
    this.dymanicTargets.forEach(target => {
      if (target.style.display === "none") {
        target.style.removeProperty("display");
      } else {
        target.style.display = "none";
      }
    });
  }
}
