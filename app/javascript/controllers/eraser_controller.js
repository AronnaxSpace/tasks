import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "erasable" ]

  erase() {
    this.erasableTargets.forEach(target => {
      target.innerHTML = "";
    });
  }
}
