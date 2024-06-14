/**
 * Created by brooksjohnson on 6/4/24.
 */

import {createElement} from 'lwc';
import SetterDemoChild from "c/setterDemoChild";

describe('setter demo child test suite', () => {
      afterEach( () => {
          while (document.body.firstChild){
              document.body.removeChild(document.body.firstChild);
          }
      })

    async  function flushPromises(){
          return Promise.resolve();
    }

    it('', () => {
        
    });
});
