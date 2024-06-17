# School Grading System Smart Contract

This smart contract implements a simple school grading system using Solidity. The contract allows for adding students, assigning grades, retrieving grades, and handling special conditions. It also demonstrates the use of `require()`, `assert()`, and `revert()` statements.

## Features

- Add a new student
- Assign a grade to a student
- Retrieve the grade of a student
- Update a student's name
- Remove a student
- Validate data using `assert()`
- Handle special conditions using `revert()`

## Smart Contract Details

### Structs

- `Student`: Contains details about the student including `name`, `grade`, and a boolean `exists` to check if the student is already added.

### Mappings

- `students`: A mapping from student ID to `Student` struct.

### Events

- `StudentAdded`: Emitted when a new student is added.
- `GradeAssigned`: Emitted when a grade is assigned to a student.

### Functions

- `addStudent(uint studentId, string memory name)`: Adds a new student with the given ID and name.
  - Uses `require()` to check if the student already exists.
  - Emits `StudentAdded` event.

- `assignGrade(uint studentId, uint8 grade)`: Assigns a grade to an existing student.
  - Uses `require()` to check if the student exists and if the grade is valid (0-100).
  - Emits `GradeAssigned` event.

- `getGrade(uint studentId)`: Retrieves the grade of an existing student.
  - Uses `require()` to check if the student exists.

- `updateStudentName(uint studentId, string memory newName)`: Updates the name of an existing student.
  - Uses `require()` to check if the student exists.

- `removeStudent(uint studentId)`: Removes an existing student.
  - Uses `require()` to check if the student exists.

- `validateData(uint studentId)`: Validates that the student's grade is between 0 and 100.
  - Uses `assert()` to ensure the grade is within the valid range.

- `specialConditionCheck(uint studentId)`: Checks for a special condition (e.g., grade equals 42) and reverts the transaction if the condition is met.
  - Uses `revert()` to handle the special condition.

## Usage

### Prerequisites

- [Node.js](https://nodejs.org/)
- [Truffle](https://www.trufflesuite.com/truffle)
- [Ganache](https://www.trufflesuite.com/ganache) (for local blockchain)

### Steps

1. **Clone the repository**:
    ```sh
    git clone <repository-url>
    cd <repository-directory>
    ```

2. **Install dependencies**:
    ```sh
    npm install
    ```

3. **Compile the contract**:
    ```sh
    truffle compile
    ```

4. **Deploy the contract**:
    ```sh
    truffle migrate
    ```

5. **Interact with the contract**:
    You can use Truffle Console to interact with the deployed contract:
    ```sh
    truffle console
    ```

    ```js
    let instance = await SchoolGradingSystem.deployed();

    // Add a new student
    await instance.addStudent(1, "John Doe");

    // Assign a grade to the student
    await instance.assignGrade(1, 85);

    // Retrieve the student's grade
    let grade = await instance.getGrade(1);
    console.log("Grade:", grade.toNumber());

    // Update the student's name
    await instance.updateStudentName(1, "John Smith");

    // Remove the student
    await instance.removeStudent(1);

    // Validate data (throws if the grade is out of bounds)
    await instance.validateData(1);

    // Check special condition (throws if the grade is 42)
    await instance.specialConditionCheck(1);
    ```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

