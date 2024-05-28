/**
 * Created by bjohnson on 1/2/24.
 * Defaults unit of work to System Mode
 * PMD warnings on crud supressed do to false postives
 */

public with sharing class UnitOfWorkFactory extends fflib_Application.UnitOfWorkFactory {
    public UnitOfWorkFactory(List<SObjectType> objectTypes) {
        super(objectTypes);
    }

    public override fflib_ISObjectUnitOfWork newInstance(){
        return newInstance(AccessLevel.SYSTEM_MODE);
    }

    public fflib_ISObjectUnitOfWork newInstance(AccessLevel accessLevel){
        return newInstance(new UnitOfWorkDMLWithAccessLevel(accessLevel));
    }

    @SuppressWarnings('PMD.ApexCrudViolation')
    public without sharing class UnitOfWorkDMLWithAccessLevel extends fflib_SObjectUnitOfWork.SimpleDML{
       private AccessLevel accessLevel;

        public UnitOfWorkDMLWithAccessLevel(AccessLevel accessLevel){
            this.accessLevel = accessLevel;
        }

        public override void dmlInsert(List<SObject> objList){
            Database.insert(objList, accessLevel);
        }

        public override void dmlUpdate(List<SObject> objList){
            Database.update(objList, accessLevel);
        }

        public override void dmlDelete(List<SObject> objList){
            Database.delete(objList, accessLevel);
        }
    }



}