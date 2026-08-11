import { application } from "controllers/application"
import CascadingselectController from "controllers/cascadingselect_controller"
import SelectallcheckboxController from "controllers/selectallcheckbox_controller"

application.register("cascadingselect", CascadingselectController)
application.register("selectallcheckbox", SelectallcheckboxController)
