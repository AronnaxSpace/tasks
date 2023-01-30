import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "sidenav" ]

  connect() {
    this.sidenav = this.sidenavTarget;
  }

  toggle() {
    if (this.sidenav.style.left === "0px") {
      this.sidenav.style.removeProperty("left");
    } else {
      this.sidenav.style.left = "0px";
    }
  }
}
