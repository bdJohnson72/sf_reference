/**
 * Created by bjohnson on 12/30/23.
 */

public inherited sharing abstract class ApplicationDomain extends fflib_SObjectDomain {

  public ApplicationDomain(List<SObject> records){
      super(records);
      Configuration.disableTriggerCRUDSecurity();
  }
}