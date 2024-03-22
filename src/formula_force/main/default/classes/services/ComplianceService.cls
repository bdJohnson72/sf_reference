/**
 * Generic compliance support
 * @throws ComplianceException
 */
public with sharing class ComplianceService {


    public interface ICompliant {
        List<VerifyResult> verifyCompliance();
    }

    public static void verify(Set<Id> recordIds){
        fflib_SObjects domain = (fflib_SObjects) FormulaForceApplication.Domain.newInstance(recordIds);
        if (domain instanceof ICompliant) {
            ICompliant compliantDomain = (ICompliant) domain;
            List<VerifyResult> verifyResults = compliantDomain.verifyCompliance();
            if (verifyResults != null) {
                List<VerifyResult> failedCompliances = new List<ComplianceService.VerifyResult>();
                for (VerifyResult result : verifyResults ){
                    if(!result.passed){
                        failedCompliances.add(result);
                    }
                }
                if (failedCompliances.size() > 0) {
                    throw new ComplianceException('Compliance Failures Found', failedCompliances);
                }
            }

        }

    }
    public class ComplianceException extends Exception{
        public List<VerifyResult> failures {get; private set;}

        public ComplianceException(String message, List<VerifyResult> failures){
            this(message);
            this.failures =failures;
        }
    }

    public class VerifyResult {
        public Id recordId;
        public String complianceCode;
        public Boolean passed;
        public String failureReason;
    }

}