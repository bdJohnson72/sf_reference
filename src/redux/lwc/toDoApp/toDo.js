
export default class ToDo{

    subject = ''
    Id;
    status = 'Not Started'

    constructor(subject, id) {
        this.subject = subject;
        this.Id = id;
    }
}