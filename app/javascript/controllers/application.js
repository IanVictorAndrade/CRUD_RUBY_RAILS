import { Application } from "@hotwired/stimulus"
import Rails from "@rails/ujs"

Rails.start()
const application = Application.start()
window.Stimulus = application

export { application }
