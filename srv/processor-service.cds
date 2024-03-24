using { sap.capire.incidents as my } from '../db/schema';

service ProcessorService { 
    entity Incidents as projection on my.Incidents;

    @readonly
    entity Customers as projection on my.Customers;

    action createIncident(title: String) returns String;

    action approveIncident(title: String @title:'Title');

}

extend projection ProcessorService.Customers with {
  firstName || ' ' || lastName as name: String
}


annotate ProcessorService.Incidents with @odata.draft.enabled;
annotate ProcessorService with @(requires: 'support');
