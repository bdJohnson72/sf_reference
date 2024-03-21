/**
 * Created by bjohnson on 11/18/23.
 */

public with sharing class FormulaForceApplication {

    public static final fflib_Application.UnitOfWorkFactory UnitOfWork =
            new UnitOfWorkFactory(
                   new List<SObjectType>{
                           Driver__c.SObjectType,
                           Season__c.SObjectType,
                           Race__c.SObjectType,
                           Contestant__c.SObjectType});

    public static final fflib_Application.SelectorFactory Selector =
            new fflib_Application.SelectorFactory(
                    new Map<SObjectType, Type>{
                            Contestant__c.SObjectType => ContestantsSelector.class,
                            Race__c.SObjectType => RacesSelector.class,
                            Championship_Points__mdt.SObjectType => ChampionshipPointsSelector.class
                    }
            );

    public static final fflib_Application.ServiceFactory Service =
            new FormulaForceApplication.ServiceFactory(
                    new Map<Type, Type>{
                            IRaceService.class => RaceServiceImpl.class
                    }
            );

    public static final fflib_Application.DomainFactory Domain = new fflib_Application.DomainFactory(
            FormulaForceApplication.Selector,
            new Map<SObjectType, Type>{
                    Driver__c.SObjectType => Drivers.Constructor.class
            }
    );

    private class ServiceFactory extends fflib_Application.ServiceFactory{
        private Map<String, String> servicesByClassName = new Map<String, String>();

        public ServiceFactory(Map<Type, Type> serviceInterfaceByServiceImplType ){
            super(serviceInterfaceByServiceImplType);
            //map of overriden services
            for (Service__mdt serviceOverride : Service__mdt.getAll().values()){
                servicesByClassName.put(serviceOverride.DeveloperName, serviceOverride.Apex_Class__c);
            }
        }

        public override Object newInstance(Type serviceInterfaceType ){
            if(!Test.isRunningTest() && servicesByClassName.containsKey(serviceInterfaceType.getName())){
                String overridenServiceImpl = servicesByClassName.get(serviceInterfaceType.getName());
                return Type.forName(overridenServiceImpl).newInstance();
            }
            return super.newInstance(serviceInterfaceType);
        }
    }

    public static void throwAuraHandledException(Exception e) {
        String message = e.getMessage();
        AuraHandledException error = new AuraHandledException(message);
        error.setMessage(message); // Apex tests can assert message
        throw error;
    }

}