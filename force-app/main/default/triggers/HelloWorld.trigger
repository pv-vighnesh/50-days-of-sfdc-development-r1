trigger HelloWorld on Lead (before update ) {
    for (lead l : Trigger.new) {
        l.FirstName = 'Hello';
        l.LastName  = 'World';
    }
}