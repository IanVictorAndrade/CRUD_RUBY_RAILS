import { application } from "controllers/application"
import CascadingselectController from "controllers/cascadingselect_controller"
import SalaryController from "controllers/salary_controller"
import SelectallcheckboxController from "controllers/selectallcheckbox_controller"

application.register("cascadingselect", CascadingselectController)
application.register("salary", SalaryController)
application.register("selectallcheckbox", SelectallcheckboxController)
