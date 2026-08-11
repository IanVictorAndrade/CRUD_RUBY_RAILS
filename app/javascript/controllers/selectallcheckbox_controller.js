import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="selectallcheckbox"
export default class extends Controller {
  connect() {
  }

  static targets = ["chkheader", "chkrow"]

  toggleAll(){
    let isChecked = this.chkheaderTarget.checked;
    this.chkrowTargets.forEach(checkbox => {
      checkbox.checked = isChecked;
    });
  }


}
