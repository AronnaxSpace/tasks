import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "dymanic" ]

  toggle() {
    this.dymanicTargets.forEach(target => {
      target.classList.toggle("hidden");
    });
  }
}
