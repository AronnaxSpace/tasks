import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="duplicator"
export default class extends Controller {
  static targets = [ "container", "duplicatable", "eraser" ]

  duplicate() {
    const duplicate = this.duplicatableTarget.cloneNode(true);
    duplicate.removeAttribute("data-duplicator-target");
    duplicate.setAttribute("data-controller", "eraser");
    duplicate.setAttribute("data-eraser-target", "erasable");

    const duplicateEraser = duplicate.getElementsByClassName("duplicate-eraser")[0]
    if (duplicateEraser !== undefined) { duplicateEraser.removeAttribute("style"); }

    this.containerTarget.appendChild(duplicate);
  }
}
