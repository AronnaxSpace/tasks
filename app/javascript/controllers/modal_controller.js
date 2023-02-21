import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "modal", "toggle" ]

  open() {
    this.modalTarget.classList.remove("hidden")
    this.toggleTarget.checked = true
  }

  close(event) {
    if (event.target.id == "modal") this.modalTarget.classList.add("hidden")
    this.toggleTarget.checked = false
  }
}
