class Cow {

String tag; 
DateTime dob;
DateTime dueDate; 
String breed;
DateTime covered;



  Cow(String tag, DateTime dob, DateTime covered,String breed )
  {
    this.tag  = tag;
    this.dob = dob;
    //this.dueDate =  new DateTime(covered.year, covered.month , date.day);
    this.breed  = breed;
    this.covered = covered;
  }
}