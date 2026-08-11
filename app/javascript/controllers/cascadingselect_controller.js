import { Controller } from "@hotwired/stimulus"
import Rails from "@rails/ujs"

// Connects to data-controller="cascadingselect"
export default class extends Controller {
  connect() {
  }

  static targets = ['countrySelect', 'stateSelect', 'citySelect']

  loadStates() {
    const countryId = this.countrySelectTarget.value;
    if (countryId) {
        Rails.ajax({
          type: 'GET',
          url: `/locations/states?country_id=${countryId}`,
          success: (data) => {
            if (data.length > 0) {
              this.updateOptions(this.stateSelectTarget, data, '');
              this.loadCities();
            }
            else {
              this.updateOptions(this.stateSelectTarget, data, 'Select State');
              this.updateOptions(this.citySelectTarget, data, 'Select City');
            }
          }
        });
    }
    else {
        this.stateSelectTarget.innerHTML = '<option value="">Select State</option>';
        this.citySelectTarget.innerHTML = '<option value="">Select City</option>';
    }
  }

  updateOptions(container, data, prompt) {
    container.innerHTML = this.generateOptions(data, prompt);
  }

  generateOptions(data, prompt) {
    const options = data.map(option => `<option value="${option.id}">${option.name}</option>`);

    if (prompt) {
      return `<option value="">${prompt}</option>${options.join('')}`;
    }
    else {
      return options;
    }
  }


  loadCities() {
    const stateId = this.stateSelectTarget.value;
    if (stateId) {
        Rails.ajax({
          type: 'GET',
          url: `/locations/cities?state_id=${stateId}`,
          success: (data) => {
            if (data.length > 0) {
              this.updateOptions(this.citySelectTarget, data, '');
            }
            else {
              this.updateOptions(this.citySelectTarget, data, 'Select City');
            }
          }
        });
    }
    else {
        this.citySelectTarget.innerHTML = '<option value="">Select City</option>';
    }
  }




}
