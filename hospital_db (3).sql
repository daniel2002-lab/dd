-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2025 at 06:13 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `epidemiological_data`
--

CREATE TABLE `epidemiological_data` (
  `Data_ID` int(11) NOT NULL,
  `Location_ID` int(11) NOT NULL,
  `Recorded_Date` date NOT NULL,
  `Cases_per_thousand_people` int(11) NOT NULL,
  `Rainfall` int(11) NOT NULL,
  `Average_temperature` decimal(5,2) NOT NULL,
  `Update_date` date NOT NULL,
  `Added_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `facility_type`
--

CREATE TABLE `facility_type` (
  `facility_type_ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Description` text NOT NULL,
  `Date_Added` date NOT NULL,
  `Date_updated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `geographical_location`
--

CREATE TABLE `geographical_location` (
  `Location_ID` int(11) NOT NULL,
  `Village` varchar(100) NOT NULL,
  `Parish` varchar(100) NOT NULL,
  `Sub_county` varchar(100) NOT NULL,
  `County` varchar(100) NOT NULL,
  `Region` varchar(50) NOT NULL,
  `Population` int(11) NOT NULL,
  `Coordiantes` varchar(100) NOT NULL,
  `Malaria_risk_level` varchar(50) NOT NULL,
  `Health_facilities_count` int(11) NOT NULL,
  `ITN_coverage` decimal(5,2) NOT NULL,
  `Reported_cases` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `health_facility`
--

CREATE TABLE `health_facility` (
  `Facility_ID` int(11) NOT NULL,
  `facility_Name` varchar(100) NOT NULL,
  `Location_ID` int(11) NOT NULL,
  `Facility_type` int(11) NOT NULL,
  `capacity` int(11) NOT NULL,
  `Contact_details` varchar(10) NOT NULL,
  `Date_added` date NOT NULL,
  `Facility_head` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `interventions`
--

CREATE TABLE `interventions` (
  `Intervention_ID` int(11) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Location_ID` int(11) NOT NULL,
  `Start_date` date NOT NULL,
  `End_date` date NOT NULL,
  `Outcome` varchar(50) NOT NULL,
  `Date_added` date NOT NULL,
  `Update_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lab_test`
--

CREATE TABLE `lab_test` (
  `Test_ID` int(11) NOT NULL,
  `Case_ID` int(11) NOT NULL,
  `Test_Type` varchar(50) NOT NULL,
  `Test_Result` varchar(50) NOT NULL,
  `Test_Date` date NOT NULL,
  `Fcaility_Head` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `malaria_cases`
--

CREATE TABLE `malaria_cases` (
  `case_ID` int(11) NOT NULL,
  `Patient_ID` int(11) NOT NULL,
  `Facility_ID` int(11) NOT NULL,
  `Date_of_Diagnosis` date NOT NULL,
  `Type_of_Malaria` varchar(50) NOT NULL,
  `Treatment_ID` int(11) NOT NULL,
  `Outcome_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `malaria_type`
--

CREATE TABLE `malaria_type` (
  `type_ID` int(11) NOT NULL,
  `Type_Name` varchar(50) NOT NULL,
  `Description` text NOT NULL,
  `Date_Added` date NOT NULL,
  `Added_By` int(11) NOT NULL,
  `Update_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient_data`
--

CREATE TABLE `patient_data` (
  `Patient_ID` int(11) NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Date_Of_Birth` date NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Phone_number` varchar(10) NOT NULL,
  `Next_of_kin` varchar(100) NOT NULL,
  `Location_ID` int(11) NOT NULL,
  `Date_added` date NOT NULL,
  `Update_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referral`
--

CREATE TABLE `referral` (
  `Referral_ID` int(11) NOT NULL,
  `Case_ID` int(11) NOT NULL,
  `Referred _from` int(11) NOT NULL,
  `Referred_to` int(11) NOT NULL,
  `Referral_date` date NOT NULL,
  `Reason` text NOT NULL,
  `Outcome_ID` int(11) NOT NULL,
  `Update_date` date NOT NULL,
  `Referred_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resource`
--

CREATE TABLE `resource` (
  `Resource_ID` int(11) NOT NULL,
  `facility_ID` int(11) NOT NULL,
  `Resource_type` varchar(50) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Last_updated_date` date NOT NULL,
  `Description` text NOT NULL,
  `Date_added` date NOT NULL,
  `Update_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supply_chain`
--

CREATE TABLE `supply_chain` (
  `Supply_ID` int(11) NOT NULL,
  `Resource_ID` int(11) NOT NULL,
  `Facility_ID` int(11) NOT NULL,
  `Qauntity_shipped` int(11) NOT NULL,
  `Shipment_Date` date NOT NULL,
  `Expected_Arrival_Date` date NOT NULL,
  `Shpped_By` int(11) NOT NULL,
  `Status` varchar(50) NOT NULL,
  `Update_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_log`
--

CREATE TABLE `system_log` (
  `Log_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Activity` text NOT NULL,
  `Timestamp` datetime NOT NULL,
  `IP_Address` varchar(10) NOT NULL,
  `Location` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `training`
--

CREATE TABLE `training` (
  `Training_ID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `Training_Type` varchar(100) NOT NULL,
  `Training_Date` date NOT NULL,
  `Completion_Status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `treatment`
--

CREATE TABLE `treatment` (
  `Treatment_ID` int(11) NOT NULL,
  `Treatment_Name` varchar(50) NOT NULL,
  `Treament_descrp` text NOT NULL,
  `Dosage` varchar(50) NOT NULL,
  `Side_Effects` text NOT NULL,
  `Date_added` date NOT NULL,
  `Update_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `User_ID` int(11) NOT NULL,
  `First_Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Preferred_name` varchar(50) NOT NULL,
  `Role_ID` int(11) NOT NULL,
  `User_name` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Facilty_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `Role_ID` int(11) NOT NULL,
  `Role_Name` varchar(50) NOT NULL,
  `Role_Descrp` text NOT NULL,
  `Date_Added` date NOT NULL,
  `Update_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visit_record`
--

CREATE TABLE `visit_record` (
  `Visit_ID` int(11) NOT NULL,
  `Patient_ID` int(11) NOT NULL,
  `Visit_Number` int(11) NOT NULL,
  `Visit_Date` date NOT NULL,
  `Date_added` date NOT NULL,
  `Date_updated` date NOT NULL,
  `Facility_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `epidemiological_data`
--
ALTER TABLE `epidemiological_data`
  ADD PRIMARY KEY (`Data_ID`),
  ADD KEY `Location_ID` (`Location_ID`);

--
-- Indexes for table `facility_type`
--
ALTER TABLE `facility_type`
  ADD PRIMARY KEY (`facility_type_ID`);

--
-- Indexes for table `geographical_location`
--
ALTER TABLE `geographical_location`
  ADD PRIMARY KEY (`Location_ID`);

--
-- Indexes for table `health_facility`
--
ALTER TABLE `health_facility`
  ADD PRIMARY KEY (`Facility_ID`),
  ADD KEY `Location_ID` (`Location_ID`);

--
-- Indexes for table `interventions`
--
ALTER TABLE `interventions`
  ADD PRIMARY KEY (`Intervention_ID`),
  ADD KEY `Location_ID` (`Location_ID`);

--
-- Indexes for table `lab_test`
--
ALTER TABLE `lab_test`
  ADD PRIMARY KEY (`Test_ID`),
  ADD KEY `Case_ID` (`Case_ID`);

--
-- Indexes for table `malaria_cases`
--
ALTER TABLE `malaria_cases`
  ADD PRIMARY KEY (`case_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Facility_ID` (`Facility_ID`),
  ADD KEY `Treatment_ID` (`Treatment_ID`),
  ADD KEY `Outcome_ID` (`Outcome_ID`);

--
-- Indexes for table `malaria_type`
--
ALTER TABLE `malaria_type`
  ADD PRIMARY KEY (`type_ID`);

--
-- Indexes for table `patient_data`
--
ALTER TABLE `patient_data`
  ADD PRIMARY KEY (`Patient_ID`),
  ADD KEY `Location_ID` (`Location_ID`);

--
-- Indexes for table `referral`
--
ALTER TABLE `referral`
  ADD PRIMARY KEY (`Referral_ID`),
  ADD KEY `Case_ID` (`Case_ID`),
  ADD KEY `Outcome_ID` (`Outcome_ID`);

--
-- Indexes for table `resource`
--
ALTER TABLE `resource`
  ADD PRIMARY KEY (`Resource_ID`),
  ADD KEY `facility_ID` (`facility_ID`);

--
-- Indexes for table `supply_chain`
--
ALTER TABLE `supply_chain`
  ADD PRIMARY KEY (`Supply_ID`);

--
-- Indexes for table `system_log`
--
ALTER TABLE `system_log`
  ADD PRIMARY KEY (`Log_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `training`
--
ALTER TABLE `training`
  ADD PRIMARY KEY (`Training_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `treatment`
--
ALTER TABLE `treatment`
  ADD PRIMARY KEY (`Treatment_ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User_ID`),
  ADD KEY `Role_ID` (`Role_ID`),
  ADD KEY `Facilty_ID` (`Facilty_ID`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`Role_ID`);

--
-- Indexes for table `visit_record`
--
ALTER TABLE `visit_record`
  ADD PRIMARY KEY (`Visit_ID`),
  ADD KEY `Patient_ID` (`Patient_ID`),
  ADD KEY `Facility_ID` (`Facility_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
