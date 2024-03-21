/**
 * Created by bjohnson on 11/21/23.
 */

import {LightningElement, api} from 'lwc';
import awardChampionshipPoints from '@salesforce/apex/ContestantController.awardPoints'
import { RefreshEvent } from "lightning/refresh";

export default class ContestantPointsAction extends LightningElement {
   @api recordId;


    @api async invoke(){
        try{
            console.log(this.recordId);
          await  awardChampionshipPoints({contestantId: this.recordId})
            this.dispatchEvent(new RefreshEvent())
        }catch (e) {
            console.error(e.message)
        }
    }

}