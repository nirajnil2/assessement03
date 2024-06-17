
//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18 ;

contract schoolGradingsystem{
    //struct to store student detail
    struct Student{
        string name;
        uint8 grade;
        bool exists;

    }
    mapping(uint => Student)  private student ;
    //event emitted  when new student has been added
    event addstudent(uint studentId , string name);

    //event emitted when grade assign

    event assigngrade(uint studentId, uint8 grade);

    //function to add a new student 
    function addnewstudent(uint studentId , string memory name) public {
        //check that this id previously exits or not
        require(!student[studentId].exists,"this student already exits");
        
        //Add the students
        student[studentId] = Student(name,0,true);
        //emit event
        emit addstudent(studentId , name);
    }

    // function to add grade 
    function assignGrade(uint studentId , uint8 grade) public {
        require(student[studentId].exists ,"The record of student doesnot exists");

        student[studentId].grade = grade;

        //emit the event that the grade has been now updated

        emit assigngrade(studentId, grade);
        //noow then event make a record of updated value to the condumers

    }

    //function to get the grade of a srudent 
    function getGrade(uint studentId) public view returns(uint8){
        require(student[studentId].exists,"Student doenot exists");
        //Return the grade 
        return student[studentId].grade;

    }
    
    //function to update student the students name 
    function updatename(uint studentId, string memory newname) public {
        require(student[studentId].exists,"Student record doesnt find ");
        student[studentId].name = newname;
    }

    //fucntion to remove a student
    function removestudent(uint studentId) public {
        //check if the student exists
        require(student[studentId].exists," the record of the the student doesnot exists");
        //delete the student 
        delete student[studentId];
    }

    //function to demonstrate assert usage
    function validateData(uint studentId) public view {
        //validate that the student's grade is between 0 to 100
        assert(student[studentId].grade<=100);
    }
    //function  to demonstrate revert usage 

    function specialconditioncheck(uint studentId) public view {
        //check for the special conditio met ,e,g, grade  must be specific  value.
        if(student[studentId].grade==42){
            revert("Special condition met,operation not allowed");
        }
    }


}
