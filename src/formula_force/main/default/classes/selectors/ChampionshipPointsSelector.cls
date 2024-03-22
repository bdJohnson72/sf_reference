/**
 * Created by bjohnson on 11/18/23.
 */

public with sharing class ChampionshipPointsSelector extends fflib_SObjectSelector {
    public  List<SObjectField> getSObjectFieldList() {

        return new List<Schema.SObjectField> {
                Championship_Points__mdt.Id,
                Championship_Points__mdt.DeveloperName,
                Championship_Points__mdt.PointsAwarded__c
        };
    }
    public SObjectType getSObjectType() {
        return Championship_Points__mdt.SObjectType;
    }

    public Map<Integer, Championship_Points__mdt> pointsByTrackPosition(){
        Map<Integer, Championship_Points__mdt> pointsByTrackPosition = new Map<Integer, Championship_Points__mdt>();

        for(Championship_Points__mdt record : Championship_Points__mdt.getAll().values()){
            Integer trackPosition = Integer.valueOf(record.DeveloperName.remove('TrackPosition'));
            pointsByTrackPosition.put(trackPosition, record);
        }
        return pointsByTrackPosition;
    }

}