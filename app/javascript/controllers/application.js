import { Application } from "@hotwired/stimulus"
import "@hotwired/turbo-rails"
import "./controllers"
import Turbo from "@hotwired/turbo"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

Turbo.start()

export { application }
