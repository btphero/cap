const cds = require('@sap/cds')

class ProcessorService extends cds.ApplicationService {
  /** Registering custom event handlers */
  init() {
    this.before("UPDATE", "Incidents", (req) => this.onUpdate(req));
    this.before("CREATE", "Incidents", (req) => this.changeUrgencyDueToSubject(req.data));
    this.on("approveIncident", (req) => this.approveIncident(req.data));
    return super.init();
  }

  async approveIncident(data) {
    if (data) {
    let spaData = {
      "definitionId": "us10.2d459c33trial.automation.onboarding",
      "context": {
          "title": data,
          "customer": "Sunny Sunshine",
          "equipment": "Solar panel",
          "describeTheIssueInDetail": "Please call the customer and check the issue.",
          "priority": "High",
          "contactNumber": 9778829131
      }
    }
      console.log("<<<received data ",spaData)

      const workflow = await cds.connect.to('workflow');

      const result = await workflow.post(`/workflow/rest/v1/workflow-instances`, spaData);

      console.log(' workflow started ', result)




    }
  }






  changeUrgencyDueToSubject(data) {
    if (data) {
      const incidents = Array.isArray(data) ? data : [data];
      incidents.forEach((incident) => {
        if (incident.title?.toLowerCase().includes("urgent")) {
          incident.urgency = { code: "H", descr: "High" };
        }
      });
    }
  }

  /** Custom Validation */
  async onUpdate (req) {
    const { status_code } = await SELECT.one(req.subject, i => i.status_code).where({ID: req.data.ID})
    if (status_code === 'C')
      return req.reject(`Can't modify a closed incident`)
  }
}
module.exports = { ProcessorService }
