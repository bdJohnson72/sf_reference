/**
 * Created by brooksjohnson on 6/16/25.
 */

import { LightningElement, track } from 'lwc';
import ToDO from './toDo'

export default class ToDoApp extends LightningElement {

 @track   toDoStore = {
        todos: [],
        currentToDos: [],
        currentFilter: ''
    }

    idGenerator = this.generateId();

    addToDos(event){
        console.log('addToDos', event);
        const toDo = new ToDO(event.detail.value, this.idGenerator.next().value)
        this.toDoStore.todos = [...this.toDoStore.todos, toDo];
        console.log(`the store is now ${JSON.stringify(this.toDoStore)}`)
        this.filter();
    }

    handleFilterChange(event){
        this.toDoStore = {...this.toDoStore, currentFilter: event.detail}
        console.log(`the store is now ${JSON.stringify(this.toDoStore)}`)
        this.filter();

    }

    filter(){
        console.log('filter')
        if(this.toDoStore.currentFilter === ''){
            console.log('currentFilter is null')
            this.toDoStore.currentToDos = [...this.toDoStore.todos];
        }
        if (this.toDoStore.currentFilter !== ''){
            const tempArray = this.toDoStore.todos;
            const filteredToDos = tempArray.filter(todo => {
                console.log(JSON.stringify(todo))
                return todo.status === this.toDoStore.currentFilter
            })

            this.toDoStore.currentToDos = [...filteredToDos]
            console.log(JSON.stringify(this.toDoStore.currentToDos))
        }


    }

    handleToDoStatusChange(event){
        console.log('handleToDoStatusChange', event);
        const changedToDo = event.detail;
        const tempToDos = this.toDoStore.todos;
        tempToDos.forEach(todo => {
            if (todo.Id === changedToDo.Id){
                tempToDos[tempToDos.indexOf(todo)] = {...changedToDo}
            }
        })
        this.toDoStore.todos = [...tempToDos]
        this.filter();
        console.log(`the store is now ${JSON.stringify(this.toDoStore)}`)

    }

    *generateId(){
        let index = 0;
        while (true){
            yield ++index;
        }
    }

}