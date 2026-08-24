import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="salary"
export default class extends Controller {
  connect() {
  }

  static targets = ["salaryInput", "allowanceSalary", "netSalary"];

  calculate() {
    const salary = parseFloat(this.salaryInputTarget.value);
    const selectedRadioButton = this.element.querySelector('input[name="allowance_type_id"]:checked');
    if (!selectedRadioButton) {
        alert("Please select atleast one allowance type.");
        return;
    }


    const allowancePercentage = parseFloat(selectedRadioButton.dataset.percentage);
    if (isNaN(salary) || isNaN(allowancePercentage)) {
      return;
    }

    const allowanceAmout = (salary * allowancePercentage) / 100;
    this.allowanceSalaryTarget.value = allowanceAmout.toFixed(2);
    const netSalary = salary + allowanceAmout;
    this.netSalaryTarget.value = netSalary.toFixed(2);


  }


  calculate_check_box()
  {
    const salary = parseFloat(this.salaryInputTarget.value);
    const checkedCheckboxes = document.querySelectorAll('input[name="allowancetype_ids[]"]:checked');
    let allowanceAmount = 0;

    checkedCheckboxes.forEach(checkbox => {
      const percentage = parseFloat(checkbox.dataset.percentage);
      allowanceAmount += (salary * percentage) / 100;
    });

    const netSalary = salary + allowanceAmount;
    this.allowanceSalaryTarget.value = allowanceAmount.toFixed(2);
    this.netSalaryTarget.value = netSalary.toFixed(2);
  }


}
