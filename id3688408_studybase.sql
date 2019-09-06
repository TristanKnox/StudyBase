-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2017 at 09:44 PM
-- Server version: 5.7.19-log
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id3688408_studybase`
--

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `AnswerID` int(11) NOT NULL,
  `QuestionID` int(11) NOT NULL,
  `PostedBy` int(11) NOT NULL,
  `Solution` text NOT NULL,
  `Work` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`AnswerID`, `QuestionID`, `PostedBy`, `Solution`, `Work`) VALUES
(1, 1, 4, 'datatype variable  = value', 'A variable provides us with named storage that our programs can manipulate. Each variable in Java has a specific type, which determines the size and layout of the variable\'s memory; the range of values that can be stored within that memory; and the set of operations that can be applied to the variable.\r\n\r\nYou must declare all variables before they can be used. Following is the basic form of a variable declaration ?\r\n\r\ndatatype variable = value; \r\n\r\nHere data type is one of Java\'s datatypes and variable is the name of the variable. To declare more than one variable of the specified type, you can use a comma-separated list.\r\n\r\nFollowing are valid examples of variable declaration and initialization in Java ?\r\n\r\nExample\r\nint a, b, c;         // Declares three ints, a, b, and c.\r\nint a = 10, b = 10;  // Example of \r\n                       initialization\r\nbyte B = 22;         // initializes a \r\n                  byte type variable B.\r\ndouble pi = 3.14159;   // declares and \r\n                        assigns a value \r\n                                 of PI.\r\nchar a = \'a\';        // the char \r\n                      variable a is \r\n                      initialized with \r\n                          value \'a\''),
(2, 2, 3, 'public class Dog  \r\n{ \r\n //code// \r\n{', 'A class is a blueprint from which individual objects are created. \r\nA class can contain any of the following variable types.\r\n\r\nLocal variables ? Variables defined inside methods, constructors or blocks are called local variables. The variable will be declared and initialized within the method and the variable will be destroyed when the method has completed.\r\n\r\nInstance variables ? Instance variables are variables within a class but outside any method. These variables are initialized when the class is instantiated. Instance variables can be accessed from inside any method, constructor or blocks of that particular class.\r\n\r\nClass variables ? Class variables are variables declared within a class, outside any method, with the static keyword.\r\n\r\nA class can have any number of methods to access the value of various kinds of methods. In the above example, barking(), hungry() and sleeping() are methods.');

-- --------------------------------------------------------

--
-- Table structure for table `answervotes`
--

CREATE TABLE `answervotes` (
  `AnswerID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Vote` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answervotes`
--

INSERT INTO `answervotes` (`AnswerID`, `UserID`, `Vote`) VALUES
(1, 5, 8),
(1, 6, 7);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `CourseID` int(11) NOT NULL,
  `Name` text NOT NULL,
  `SubjectID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`CourseID`, `Name`, `SubjectID`) VALUES
(1, 'Intro to Java', 1),
(2, 'Python', 1),
(3, 'Algebra', 2),
(4, 'Spanish 101', 3);

-- --------------------------------------------------------

--
-- Table structure for table `coursetopic`
--

CREATE TABLE `coursetopic` (
  `CourseID` int(11) NOT NULL,
  `TopicID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coursetopic`
--

INSERT INTO `coursetopic` (`CourseID`, `TopicID`) VALUES
(1, 1),
(3, 2),
(3, 3),
(1, 4),
(2, 5),
(4, 6),
(4, 7),
(4, 8),
(4, 9);

-- --------------------------------------------------------

--
-- Table structure for table `courssection`
--

CREATE TABLE `courssection` (
  `CourseSectionID` int(11) NOT NULL,
  `Name` text NOT NULL,
  `CourseID` int(11) NOT NULL,
  `InstructorID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `explanation`
--

CREATE TABLE `explanation` (
  `ExplanationID` int(11) NOT NULL,
  `TopicID` int(11) NOT NULL,
  `Title` text NOT NULL,
  `Body` text NOT NULL,
  `PostedBy` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `explanation`
--

INSERT INTO `explanation` (`ExplanationID`, `TopicID`, `Title`, `Body`, `PostedBy`, `CourseID`) VALUES
(1, 1, 'Commenting Lines of Code', 'Placing // on a line will comment out everything on the line after it and will prevent it from executing', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `explanationvotes`
--

CREATE TABLE `explanationvotes` (
  `ExplanationID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Vote` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `explanationvotes`
--

INSERT INTO `explanationvotes` (`ExplanationID`, `UserID`, `Vote`) VALUES
(1, 5, 9);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `QuestionID` int(11) NOT NULL,
  `Title` text NOT NULL,
  `Body` text NOT NULL,
  `PostedBy` int(11) NOT NULL,
  `CourseID` int(11) DEFAULT NULL,
  `TopicID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`QuestionID`, `Title`, `Body`, `PostedBy`, `CourseID`, `TopicID`) VALUES
(1, 'Syntax ', 'How do you declare a new variable in java? ', 4, 1, 1),
(2, 'Classes in java ', 'How do I instantiate a new class in java?', 5, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `questionvotes`
--

CREATE TABLE `questionvotes` (
  `QuestionID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Vote` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questionvotes`
--

INSERT INTO `questionvotes` (`QuestionID`, `UserID`, `Vote`) VALUES
(1, 1, 5),
(1, 2, 8);

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE `quiz` (
  `QuizID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `quizquestion`
--

CREATE TABLE `quizquestion` (
  `QuizID` int(11) NOT NULL,
  `QuestionID` int(11) NOT NULL,
  `Score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `quiztopic`
--

CREATE TABLE `quiztopic` (
  `TopicID` int(11) NOT NULL,
  `QuizID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `school`
--

CREATE TABLE `school` (
  `SchoolID` int(11) NOT NULL,
  `Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `school`
--

INSERT INTO `school` (`SchoolID`, `Name`) VALUES
(1, 'Tompkins Cortland Community College');

-- --------------------------------------------------------

--
-- Table structure for table `schoolcourse`
--

CREATE TABLE `schoolcourse` (
  `SchoolID` int(11) NOT NULL,
  `CoursID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schoolcourse`
--

INSERT INTO `schoolcourse` (`SchoolID`, `CoursID`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `SubjectID` int(11) NOT NULL,
  `Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`SubjectID`, `Name`) VALUES
(1, 'Computer Science'),
(2, 'Math'),
(3, 'Spanish'),
(4, '');

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE `topic` (
  `TopicID` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `topic`
--

INSERT INTO `topic` (`TopicID`, `Name`, `Description`) VALUES
(1, 'Java Syntax', 'Information on Basic java syntax'),
(2, 'Linear Equations', ''),
(3, 'Functions', ''),
(4, 'Object-oriented programming', ''),
(5, 'Python syntax', ''),
(6, 'AR Verbs', ''),
(7, 'IR Verbs', ''),
(8, 'ER Verbs', ''),
(9, 'Stem Changing Verbs', '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `UserName` text NOT NULL,
  `Password` text NOT NULL,
  `UserType` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `UserName`, `Password`, `UserType`) VALUES
(1, 'Tristan', 'Happy', 'SpyMaster'),
(2, 'Sam', 'Sam', 'Sam'),
(3, 'Elvis ', '1234', 'MasterOfTheUniverse'),
(4, 'BobbyKnownothing', 'password', 'student'),
(5, 'joeydonothing', 'passcode', 'student'),
(6, 'Alex', 'Hippo2', 'Student'),
(12, 'Lucky', 'Ham', ''),
(13, 'Robin', 'P', 'Student'),
(14, 'Turky', 'L', 'Instructor'),
(15, 'Grap', 'Ham', 'Student');

-- --------------------------------------------------------

--
-- Table structure for table `usercoursesection`
--

CREATE TABLE `usercoursesection` (
  `UserID` int(11) NOT NULL,
  `CourseSectionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userquiz`
--

CREATE TABLE `userquiz` (
  `UserID` int(11) NOT NULL,
  `QuizID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`AnswerID`),
  ADD KEY `QuestionID` (`QuestionID`,`PostedBy`),
  ADD KEY `PostedBy` (`PostedBy`);

--
-- Indexes for table `answervotes`
--
ALTER TABLE `answervotes`
  ADD PRIMARY KEY (`AnswerID`,`UserID`),
  ADD KEY `AnswerID` (`AnswerID`,`UserID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`CourseID`),
  ADD KEY `SubjectID` (`SubjectID`);

--
-- Indexes for table `coursetopic`
--
ALTER TABLE `coursetopic`
  ADD PRIMARY KEY (`CourseID`,`TopicID`),
  ADD KEY `CourseID` (`CourseID`,`TopicID`),
  ADD KEY `TopicID` (`TopicID`);

--
-- Indexes for table `courssection`
--
ALTER TABLE `courssection`
  ADD PRIMARY KEY (`CourseSectionID`),
  ADD KEY `CourseID` (`CourseID`,`InstructorID`),
  ADD KEY `InstructorID` (`InstructorID`);

--
-- Indexes for table `explanation`
--
ALTER TABLE `explanation`
  ADD PRIMARY KEY (`ExplanationID`),
  ADD KEY `TopicID` (`TopicID`,`PostedBy`,`CourseID`),
  ADD KEY `PostedBy` (`PostedBy`),
  ADD KEY `CourseID` (`CourseID`);

--
-- Indexes for table `explanationvotes`
--
ALTER TABLE `explanationvotes`
  ADD PRIMARY KEY (`ExplanationID`,`UserID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `ExplanationID` (`ExplanationID`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`QuestionID`),
  ADD KEY `PostedBy` (`PostedBy`,`CourseID`,`TopicID`),
  ADD KEY `TopicID` (`TopicID`),
  ADD KEY `CourseID` (`CourseID`);

--
-- Indexes for table `questionvotes`
--
ALTER TABLE `questionvotes`
  ADD PRIMARY KEY (`QuestionID`,`UserID`),
  ADD KEY `QuestionID` (`QuestionID`,`UserID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`QuizID`);

--
-- Indexes for table `quizquestion`
--
ALTER TABLE `quizquestion`
  ADD PRIMARY KEY (`QuizID`,`QuestionID`),
  ADD KEY `QuizID` (`QuizID`,`QuestionID`),
  ADD KEY `QuestionID` (`QuestionID`);

--
-- Indexes for table `quiztopic`
--
ALTER TABLE `quiztopic`
  ADD PRIMARY KEY (`TopicID`,`QuizID`),
  ADD KEY `TopicID` (`TopicID`,`QuizID`),
  ADD KEY `QuizID` (`QuizID`);

--
-- Indexes for table `school`
--
ALTER TABLE `school`
  ADD PRIMARY KEY (`SchoolID`);

--
-- Indexes for table `schoolcourse`
--
ALTER TABLE `schoolcourse`
  ADD PRIMARY KEY (`SchoolID`,`CoursID`),
  ADD KEY `SchoolID` (`SchoolID`,`CoursID`),
  ADD KEY `CoursID` (`CoursID`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`SubjectID`);

--
-- Indexes for table `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`TopicID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `UserID` (`UserID`);

--
-- Indexes for table `usercoursesection`
--
ALTER TABLE `usercoursesection`
  ADD PRIMARY KEY (`UserID`,`CourseSectionID`),
  ADD KEY `UserID` (`UserID`,`CourseSectionID`),
  ADD KEY `CourseSectionID` (`CourseSectionID`);

--
-- Indexes for table `userquiz`
--
ALTER TABLE `userquiz`
  ADD PRIMARY KEY (`UserID`,`QuizID`),
  ADD KEY `UserID` (`UserID`,`QuizID`),
  ADD KEY `QuizID` (`QuizID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `AnswerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `CourseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `courssection`
--
ALTER TABLE `courssection`
  MODIFY `CourseSectionID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `explanation`
--
ALTER TABLE `explanation`
  MODIFY `ExplanationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `QuestionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `QuizID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `school`
--
ALTER TABLE `school`
  MODIFY `SchoolID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `SubjectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `topic`
--
ALTER TABLE `topic`
  MODIFY `TopicID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`QuestionID`) REFERENCES `question` (`QuestionID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `answer_ibfk_2` FOREIGN KEY (`PostedBy`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `answervotes`
--
ALTER TABLE `answervotes`
  ADD CONSTRAINT `answerVotes_ibfk_1` FOREIGN KEY (`AnswerID`) REFERENCES `answer` (`AnswerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `answerVotes_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`SubjectID`) REFERENCES `subject` (`SubjectID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `coursetopic`
--
ALTER TABLE `coursetopic`
  ADD CONSTRAINT `coursetopic_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `coursetopic_ibfk_2` FOREIGN KEY (`TopicID`) REFERENCES `topic` (`TopicID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `courssection`
--
ALTER TABLE `courssection`
  ADD CONSTRAINT `courseSection_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `courseSection_ibfk_2` FOREIGN KEY (`InstructorID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `explanation`
--
ALTER TABLE `explanation`
  ADD CONSTRAINT `Explanation_ibfk_1` FOREIGN KEY (`TopicID`) REFERENCES `topic` (`TopicID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Explanation_ibfk_2` FOREIGN KEY (`PostedBy`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Explanation_ibfk_3` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `explanationvotes`
--
ALTER TABLE `explanationvotes`
  ADD CONSTRAINT `ExplanationVotes_ibfk_1` FOREIGN KEY (`ExplanationID`) REFERENCES `explanation` (`ExplanationID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ExplanationVotes_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `Question_ibfk_1` FOREIGN KEY (`PostedBy`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Question_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `course` (`CourseID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Question_ibfk_3` FOREIGN KEY (`TopicID`) REFERENCES `topic` (`TopicID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `questionvotes`
--
ALTER TABLE `questionvotes`
  ADD CONSTRAINT `QuestionVotes_ibfk_1` FOREIGN KEY (`QuestionID`) REFERENCES `question` (`QuestionID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `QuestionVotes_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quizquestion`
--
ALTER TABLE `quizquestion`
  ADD CONSTRAINT `qjizQuestion_ibfk_1` FOREIGN KEY (`QuizID`) REFERENCES `quiz` (`QuizID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `qjizQuestion_ibfk_2` FOREIGN KEY (`QuestionID`) REFERENCES `question` (`QuestionID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quiztopic`
--
ALTER TABLE `quiztopic`
  ADD CONSTRAINT `quizTopic_ibfk_1` FOREIGN KEY (`TopicID`) REFERENCES `topic` (`TopicID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `quizTopic_ibfk_2` FOREIGN KEY (`QuizID`) REFERENCES `quiz` (`QuizID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `schoolcourse`
--
ALTER TABLE `schoolcourse`
  ADD CONSTRAINT `SchoolCourse_ibfk_1` FOREIGN KEY (`SchoolID`) REFERENCES `school` (`SchoolID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `SchoolCourse_ibfk_2` FOREIGN KEY (`CoursID`) REFERENCES `course` (`CourseID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usercoursesection`
--
ALTER TABLE `usercoursesection`
  ADD CONSTRAINT `UserCourseSectionSchoolCourse_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `UserCourseSectionSchoolCourse_ibfk_2` FOREIGN KEY (`CourseSectionID`) REFERENCES `courssection` (`CourseSectionID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `userquiz`
--
ALTER TABLE `userquiz`
  ADD CONSTRAINT `userQuiz_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userQuiz_ibfk_2` FOREIGN KEY (`QuizID`) REFERENCES `quiz` (`QuizID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
