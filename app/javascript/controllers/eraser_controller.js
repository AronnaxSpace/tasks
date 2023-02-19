import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "erasable", "containsErasable" ]

  erase() {
    this.erasableTargets.forEach(target => {
      target.remove();
    });

    this.containsErasableTargets.forEach(target => {
      target.innerHTML = "";
    });
  }
}
