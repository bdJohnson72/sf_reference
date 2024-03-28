/**
 *@description used to default into User Mode and
 * disable sorting of fields for performance improvements
 */

public inherited sharing abstract class ApplicationSelector extends fflib_SObjectSelector {

    public ApplicationSelector(){
        this(false);
    }

    public ApplicationSelector(Boolean includeFieldSets){
        this(includeFieldSets, fflib_SObjectSelector.DataAccess.USER_MODE);
    }

    public ApplicationSelector(Boolean includeFieldSets, fflib_SObjectSelector.DataAccess accessMode){
       super(includeFieldSets, accessMode);
        unsortedSelectFields();
    }
}