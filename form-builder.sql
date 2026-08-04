-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 04, 2026 at 11:12 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `form-builder`
--

-- --------------------------------------------------------

--
-- Table structure for table `ai_requests`
--

CREATE TABLE `ai_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `form_id` bigint(20) UNSIGNED DEFAULT NULL,
  `prompt` longtext NOT NULL,
  `input_schema` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`input_schema`)),
  `operation` varchar(255) NOT NULL,
  `provider` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `attempt` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `input_tokens` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `output_tokens` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_tokens` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `latency_ms` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`response`)),
  `error` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ai_requests`
--

INSERT INTO `ai_requests` (`id`, `created_at`, `updated_at`, `form_id`, `prompt`, `input_schema`, `operation`, `provider`, `model`, `status`, `attempt`, `input_tokens`, `output_tokens`, `total_tokens`, `latency_ms`, `response`, `error`) VALUES
(1, '2026-08-04 01:44:47', '2026-08-04 01:45:35', NULL, 'Internship application with education history, skills and resume upload', NULL, 'generate', 'gemini', 'gemini-2.5-flash', 'failed', 1, 0, 0, 0, 1249, NULL, 'HTTP request returned status code 404:\n{\n  \"error\": {\n    \"code\": 404,\n    \"message\": \"This model models/gemini-2.5-flash is no longer available to new users.  (truncated...)\n'),
(2, '2026-08-04 01:51:33', '2026-08-04 01:51:56', NULL, 'asdsadasd', NULL, 'generate', 'gemini', 'gemini-2.5-flash', 'failed', 1, 0, 0, 0, 1039, NULL, 'HTTP request returned status code 404:\n{\n  \"error\": {\n    \"code\": 404,\n    \"message\": \"This model models/gemini-2.5-flash is no longer available to new users.  (truncated...)\n'),
(3, '2026-08-04 01:53:03', '2026-08-04 01:53:07', NULL, 'Internship application with education history, skills and resume upload', NULL, 'generate', 'gemini', 'gemini-2.5-flash', 'failed', 1, 0, 0, 0, 1707, NULL, 'HTTP request returned status code 404:\n{\n  \"error\": {\n    \"code\": 404,\n    \"message\": \"This model models/gemini-2.5-flash is no longer available to new users.  (truncated...)\n'),
(4, '2026-08-04 01:54:44', '2026-08-04 01:54:46', NULL, 'Internship application with education history, skills and resume upload', NULL, 'generate', 'gemini', 'gemini-2.5-flash', 'failed', 1, 0, 0, 0, 1854, NULL, 'HTTP request returned status code 404:\n{\n  \"error\": {\n    \"code\": 404,\n    \"message\": \"This model models/gemini-2.5-flash is no longer available to new users.  (truncated...)\n'),
(5, '2026-08-04 01:56:50', '2026-08-04 01:56:54', NULL, 'Internship application with education history, skills and resume upload', NULL, 'generate', 'gemini', 'gemini-2.5-flash', 'failed', 1, 0, 0, 0, 1110, NULL, 'HTTP request returned status code 404:\n{\n  \"error\": {\n    \"code\": 404,\n    \"message\": \"This model models/gemini-2.5-flash is no longer available to new users.  (truncated...)\n'),
(6, '2026-08-04 01:57:22', '2026-08-04 01:57:26', NULL, 'Internship application with education history, skills and resume upload', NULL, 'generate', 'gemini', 'gemini-2.5-flash', 'failed', 1, 0, 0, 0, 1516, NULL, 'HTTP request returned status code 404:\n{\n  \"error\": {\n    \"code\": 404,\n    \"message\": \"This model models/gemini-2.5-flash is no longer available to new users.  (truncated...)\n'),
(7, '2026-08-04 02:00:52', '2026-08-04 02:01:14', NULL, 'Internship application with education history, skills and resume upload', NULL, 'generate', 'gemini', 'gemini-3.6-flash', 'completed', 1, 1292, 2574, 5114, 18542, '{\"version\":1,\"title\":\"Internship Application Form\",\"description\":\"Please complete the application form below to apply for our internship program.\",\"fields\":[{\"id\":\"e0a12345-e29b-41d4-a716-446655440001\",\"type\":\"section\",\"label\":\"Personal Information\",\"description\":\"Provide your basic contact details.\",\"key\":\"personal_information\"},{\"id\":\"e0a12345-e29b-41d4-a716-446655440002\",\"type\":\"text\",\"label\":\"Full Name\",\"key\":\"full_name\",\"placeholder\":\"Jane Doe\",\"required\":true,\"help_text\":\"Enter your legal first and last name.\",\"default\":\"\",\"validation\":{\"min_length\":2,\"max_length\":100}},{\"id\":\"e0a12345-e29b-41d4-a716-446655440003\",\"type\":\"email\",\"label\":\"Email Address\",\"key\":\"email_address\",\"placeholder\":\"jane.doe@example.com\",\"required\":true,\"help_text\":\"We will use this email for all communications regarding your application.\",\"default\":\"\"},{\"id\":\"e0a12345-e29b-41d4-a716-446655440004\",\"type\":\"phone\",\"label\":\"Phone Number\",\"key\":\"phone_number\",\"placeholder\":\"+1 (555) 000-0000\",\"required\":true,\"help_text\":\"Enter a primary phone number where we can reach you.\",\"default\":\"\"},{\"id\":\"e0a12345-e29b-41d4-a716-446655440005\",\"type\":\"section\",\"label\":\"Education History\",\"description\":\"Tell us about your current academic status and background.\",\"key\":\"education_history\"},{\"id\":\"e0a12345-e29b-41d4-a716-446655440006\",\"type\":\"text\",\"label\":\"University \\/ College Name\",\"key\":\"institution_name\",\"placeholder\":\"State University\",\"required\":true,\"help_text\":\"Enter the name of your current school or university.\",\"default\":\"\",\"validation\":{\"min_length\":2,\"max_length\":150}},{\"id\":\"e0a12345-e29b-41d4-a716-446655440007\",\"type\":\"dropdown\",\"label\":\"Degree Program\",\"key\":\"degree_level\",\"required\":true,\"help_text\":\"Select your current level of study.\",\"default\":\"\",\"options\":[\"Associate Degree\",\"Bachelor\'s Degree\",\"Master\'s Degree\",\"Doctorate (Ph.D.)\",\"Other\"]},{\"id\":\"e0a12345-e29b-41d4-a716-446655440008\",\"type\":\"text\",\"label\":\"Major \\/ Field of Study\",\"key\":\"major_field_of_study\",\"placeholder\":\"Computer Science, Marketing, etc.\",\"required\":true,\"help_text\":\"\",\"default\":\"\",\"validation\":{\"min_length\":2,\"max_length\":100}},{\"id\":\"e0a12345-e29b-41d4-a716-446655440009\",\"type\":\"date\",\"label\":\"Expected Graduation Date\",\"key\":\"expected_graduation_date\",\"required\":true,\"help_text\":\"Select your estimated date of graduation.\",\"default\":null},{\"id\":\"e0a12345-e29b-41d4-a716-446655440010\",\"type\":\"number\",\"label\":\"Cumulative GPA\",\"key\":\"cumulative_gpa\",\"placeholder\":\"3.5\",\"required\":false,\"help_text\":\"Optional: Enter your current GPA on a 4.0 scale.\",\"default\":null,\"validation\":{\"min\":0,\"max\":4}},{\"id\":\"e0a12345-e29b-41d4-a716-446655440011\",\"type\":\"section\",\"label\":\"Skills & Experience\",\"description\":\"Highlight your key skills and why you are interested in this role.\",\"key\":\"skills&_experience\"},{\"id\":\"e0a12345-e29b-41d4-a716-446655440012\",\"type\":\"checkbox\",\"label\":\"Relevant Skills\",\"key\":\"relevant_skills\",\"required\":true,\"help_text\":\"Select all areas where you have coursework or practical experience.\",\"options\":[\"Software Development\",\"Data Analysis\",\"UI\\/UX Design\",\"Digital Marketing\",\"Project Management\",\"Content Creation\",\"Customer Support\"]},{\"id\":\"e0a12345-e29b-41d4-a716-446655440013\",\"type\":\"rating\",\"label\":\"Overall Skill Self-Assessment\",\"key\":\"skill_self_assessment\",\"help_text\":\"Rate your overall readiness and practical knowledge level.\",\"max\":5,\"required\":false},{\"id\":\"e0a12345-e29b-41d4-a716-446655440014\",\"type\":\"textarea\",\"label\":\"Statement of Interest\",\"key\":\"statement_of_interest\",\"placeholder\":\"Explain why you want to join this internship program and what you hope to achieve...\",\"required\":true,\"help_text\":\"Briefly describe your goals for this internship.\",\"default\":\"\",\"validation\":{\"min_length\":50,\"max_length\":1000}},{\"id\":\"e0a12345-e29b-41d4-a716-446655440015\",\"type\":\"section\",\"label\":\"Documents & Availability\",\"description\":\"Upload your resume and indicate your availability.\",\"key\":\"documents&_availability\"},{\"id\":\"e0a12345-e29b-41d4-a716-446655440016\",\"type\":\"file\",\"label\":\"Resume \\/ CV Upload\",\"key\":\"resume_file\",\"required\":true,\"help_text\":\"Please upload a PDF or DOCX file (max 5MB).\"},{\"id\":\"e0a12345-e29b-41d4-a716-446655440017\",\"type\":\"text\",\"label\":\"Portfolio \\/ LinkedIn URL\",\"key\":\"portfolio_url\",\"placeholder\":\"https:\\/\\/linkedin.com\\/in\\/yourprofile\",\"required\":false,\"help_text\":\"Link to your personal website, GitHub, or LinkedIn profile.\",\"default\":\"\",\"validation\":{\"min_length\":null,\"max_length\":255}},{\"id\":\"e0a12345-e29b-41d4-a716-446655440018\",\"type\":\"date\",\"label\":\"Earliest Start Date\",\"key\":\"earliest_start_date\",\"required\":true,\"help_text\":\"Select the date you can begin working.\",\"default\":null},{\"id\":\"e0a12345-e29b-41d4-a716-446655440019\",\"type\":\"radio\",\"label\":\"Work Availability\",\"key\":\"work_availability\",\"required\":true,\"help_text\":\"Indicate your desired schedule type.\",\"default\":\"\",\"options\":[\"Full-time (40 hours\\/week)\",\"Part-time (20 hours\\/week)\",\"Flexible \\/ Negotiable\"]},{\"id\":\"e0a12345-e29b-41d4-a716-446655440020\",\"type\":\"dropdown\",\"label\":\"How did you hear about this internship?\",\"key\":\"referral_source\",\"required\":false,\"help_text\":\"\",\"default\":\"\",\"options\":[\"University Career Portal\",\"LinkedIn\",\"Company Website\",\"Friend or Colleague\",\"Social Media\",\"Other\"]}]}', NULL),
(8, '2026-08-04 02:08:01', '2026-08-04 02:09:11', NULL, 'Internship application with education history, skills and resume upload', NULL, 'generate', 'gemini', 'gemini-3.6-flash', 'completed', 1, 1361, 3394, 6128, 59118, '{\"version\":1,\"title\":\"Internship Application Form\",\"description\":\"Please complete the form below to apply for our internship program. Make sure to provide accurate education details and upload your latest resume.\",\"fields\":[{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0001\",\"type\":\"section\",\"label\":\"Personal Details\",\"description\":\"Provide your contact information so we can reach out regarding your application.\",\"key\":\"personal_details\"},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0002\",\"type\":\"heading\",\"text\":\"Personal Information\",\"level\":2},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0003\",\"type\":\"text\",\"label\":\"First Name\",\"key\":\"first_name\",\"placeholder\":\"Jane\",\"required\":true,\"help_text\":\"Enter your legal first name.\",\"default\":\"\",\"validation\":{\"min_length\":1,\"max_length\":50}},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0004\",\"type\":\"text\",\"label\":\"Last Name\",\"key\":\"last_name\",\"placeholder\":\"Doe\",\"required\":true,\"help_text\":\"Enter your legal last name.\",\"default\":\"\",\"validation\":{\"min_length\":1,\"max_length\":50}},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0005\",\"type\":\"email\",\"label\":\"Email Address\",\"key\":\"email_address\",\"placeholder\":\"jane.doe@example.com\",\"required\":true,\"help_text\":\"We will send application updates to this email.\",\"default\":\"\"},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0006\",\"type\":\"phone\",\"label\":\"Phone Number\",\"key\":\"phone_number\",\"placeholder\":\"+1 (555) 000-0000\",\"required\":true,\"help_text\":\"Include your country code if outside the US.\",\"default\":\"\"},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0007\",\"type\":\"text\",\"label\":\"LinkedIn Profile URL\",\"key\":\"linkedin_url\",\"placeholder\":\"https:\\/\\/linkedin.com\\/in\\/username\",\"required\":false,\"help_text\":\"Provide a link to your professional LinkedIn profile.\",\"default\":\"\",\"validation\":{\"min_length\":null,\"max_length\":255}},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0008\",\"type\":\"section\",\"label\":\"Education History\",\"description\":\"Tell us about your current academic status and background.\",\"key\":\"education_history\"},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0009\",\"type\":\"heading\",\"text\":\"Academic Qualifications\",\"level\":2},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0010\",\"type\":\"dropdown\",\"label\":\"Current Degree Level\",\"key\":\"degree_level\",\"required\":true,\"help_text\":\"Select the degree level you are currently pursuing.\",\"default\":\"\",\"options\":[{\"label\":\"High School Diploma\",\"value\":\"high_school\"},{\"label\":\"Associate Degree\",\"value\":\"associate\"},{\"label\":\"Bachelor\'s Degree\",\"value\":\"bachelors\"},{\"label\":\"Master\'s Degree\",\"value\":\"masters\"},{\"label\":\"Doctorate \\/ PhD\",\"value\":\"doctorate\"}]},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0011\",\"type\":\"text\",\"label\":\"University \\/ Institution\",\"key\":\"institution_name\",\"placeholder\":\"e.g., Stanford University\",\"required\":true,\"help_text\":\"Enter the name of your current school or university.\",\"default\":\"\",\"validation\":{\"min_length\":2,\"max_length\":100}},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0012\",\"type\":\"text\",\"label\":\"Major \\/ Field of Study\",\"key\":\"major_field\",\"placeholder\":\"e.g., Computer Science\",\"required\":true,\"help_text\":\"Specify your academic major or focus area.\",\"default\":\"\",\"validation\":{\"min_length\":2,\"max_length\":100}},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0013\",\"type\":\"date\",\"label\":\"Expected Graduation Date\",\"key\":\"expected_graduation_date\",\"required\":true,\"help_text\":\"Select your anticipated graduation month and year.\",\"default\":null},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0014\",\"type\":\"number\",\"label\":\"Cumulative GPA\",\"key\":\"cumulative_gpa\",\"placeholder\":\"3.80\",\"required\":false,\"help_text\":\"Enter your GPA on a 4.0 scale.\",\"default\":null,\"validation\":{\"min\":0,\"max\":4}},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0015\",\"type\":\"section\",\"label\":\"Skills & Expertise\",\"description\":\"Share your technical competencies and area of interest for this internship.\",\"key\":\"skills&_expertise\"},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0016\",\"type\":\"heading\",\"text\":\"Skills & Area of Interest\",\"level\":2},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0017\",\"type\":\"radio\",\"label\":\"Preferred Internship Track\",\"key\":\"internship_track\",\"required\":true,\"help_text\":\"Choose the primary functional area you wish to apply for.\",\"default\":\"\",\"options\":[{\"label\":\"Software Engineering\",\"value\":\"software_engineering\"},{\"label\":\"Data Science & Analytics\",\"value\":\"data_science\"},{\"label\":\"Product Design (UI\\/UX)\",\"value\":\"product_design\"},{\"label\":\"Product Management\",\"value\":\"product_management\"},{\"label\":\"Marketing & Communications\",\"value\":\"marketing\"}]},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0018\",\"type\":\"checkbox\",\"label\":\"Technical Skills & Tools\",\"key\":\"technical_skills\",\"required\":true,\"help_text\":\"Select all technologies and methodologies you have experience with.\",\"options\":[{\"label\":\"Python\",\"value\":\"python\"},{\"label\":\"JavaScript \\/ TypeScript\",\"value\":\"javascript\"},{\"label\":\"SQL & Databases\",\"value\":\"sql\"},{\"label\":\"React \\/ Frontend Frameworks\",\"value\":\"react\"},{\"label\":\"Figma \\/ Adobe XD\",\"value\":\"figma\"},{\"label\":\"Data Analysis (Pandas, R)\",\"value\":\"data_analysis\"},{\"label\":\"Git \\/ Version Control\",\"value\":\"git\"}]},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0019\",\"type\":\"rating\",\"label\":\"Self-Assessed Overall Technical Proficiency\",\"key\":\"proficiency_rating\",\"help_text\":\"Rate your overall readiness for technical tasks (1 = Beginner, 5 = Advanced).\",\"max\":5,\"required\":false},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0020\",\"type\":\"textarea\",\"label\":\"Statement of Interest\",\"key\":\"statement_of_interest\",\"placeholder\":\"Describe why you want to join our internship program and what you hope to achieve...\",\"required\":true,\"help_text\":\"Keep your answer between 100 and 1000 characters.\",\"default\":\"\",\"validation\":{\"min_length\":100,\"max_length\":1000}},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0021\",\"type\":\"section\",\"label\":\"Documents & Availability\",\"description\":\"Upload relevant files and specify when you can start.\",\"key\":\"documents&_availability\"},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0022\",\"type\":\"heading\",\"text\":\"Attachments & Schedule\",\"level\":2},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0023\",\"type\":\"file\",\"label\":\"Resume \\/ CV\",\"key\":\"resume_file\",\"required\":true,\"help_text\":\"Upload your resume in PDF or DOCX format (Max size: 5MB).\"},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0024\",\"type\":\"date\",\"label\":\"Earliest Available Start Date\",\"key\":\"earliest_start_date\",\"required\":true,\"help_text\":\"Select the date you can start your internship.\",\"default\":null},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0025\",\"type\":\"radio\",\"label\":\"Are you authorized to work in the country where this role is located?\",\"key\":\"work_authorization\",\"required\":true,\"help_text\":\"Indicate if you possess valid work authorization.\",\"default\":\"\",\"options\":[{\"label\":\"Yes\",\"value\":\"yes\"},{\"label\":\"No\",\"value\":\"no\"},{\"label\":\"Will require sponsorship\",\"value\":\"requires_sponsorship\"}]}]}', NULL),
(9, '2026-08-04 02:15:33', '2026-08-04 02:16:02', 3, 'edit the exiting form schema and group the fields (wherever necessary) under appropriate sections', NULL, 'edit', 'gemini', 'gemini-3.6-flash', 'completed', 1, 4842, 3605, 11496, 27871, '{\"version\":1,\"title\":\"Internship Application Form\",\"description\":\"Please complete the form below to apply for our internship program. Make sure to provide accurate education details and upload your latest resume.\",\"fields\":[{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0001\",\"type\":\"section\",\"label\":\"Personal Details\",\"description\":\"Provide your contact information so we can reach out regarding your application.\",\"key\":\"personal_details\"},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0002\",\"type\":\"heading\",\"text\":\"Personal Information\",\"level\":2},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0003\",\"type\":\"text\",\"label\":\"First Name\",\"key\":\"first_name\",\"placeholder\":\"Jane\",\"required\":true,\"help_text\":\"Enter your legal first name.\",\"default\":\"\",\"validation\":{\"min_length\":1,\"max_length\":50}},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0004\",\"type\":\"text\",\"label\":\"Last Name\",\"key\":\"last_name\",\"placeholder\":\"Doe\",\"required\":true,\"help_text\":\"Enter your legal last name.\",\"default\":\"\",\"validation\":{\"min_length\":1,\"max_length\":50}},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0005\",\"type\":\"email\",\"label\":\"Email Address\",\"key\":\"email_address\",\"placeholder\":\"jane.doe@example.com\",\"required\":true,\"help_text\":\"We will send application updates to this email.\",\"default\":\"\"},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0006\",\"type\":\"phone\",\"label\":\"Phone Number\",\"key\":\"phone_number\",\"placeholder\":\"+1 (555) 000-0000\",\"required\":true,\"help_text\":\"Include your country code if outside the US.\",\"default\":\"\"},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0007\",\"type\":\"text\",\"label\":\"LinkedIn Profile URL\",\"key\":\"linkedin_url\",\"placeholder\":\"https:\\/\\/linkedin.com\\/in\\/username\",\"required\":false,\"help_text\":\"Provide a link to your professional LinkedIn profile.\",\"default\":\"\",\"validation\":{\"min_length\":null,\"max_length\":255}},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0008\",\"type\":\"section\",\"label\":\"Education History\",\"description\":\"Tell us about your current academic status and background.\",\"key\":\"education_history\"},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0009\",\"type\":\"heading\",\"text\":\"Academic Qualifications\",\"level\":2},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0010\",\"type\":\"dropdown\",\"label\":\"Current Degree Level\",\"key\":\"degree_level\",\"required\":true,\"help_text\":\"Select the degree level you are currently pursuing.\",\"default\":\"\",\"options\":[{\"label\":\"High School Diploma\",\"value\":\"high_school\"},{\"label\":\"Associate Degree\",\"value\":\"associate\"},{\"label\":\"Bachelor\'s Degree\",\"value\":\"bachelors\"},{\"label\":\"Master\'s Degree\",\"value\":\"masters\"},{\"label\":\"Doctorate \\/ PhD\",\"value\":\"doctorate\"}]},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0011\",\"type\":\"text\",\"label\":\"University \\/ Institution\",\"key\":\"institution_name\",\"placeholder\":\"e.g., Stanford University\",\"required\":true,\"help_text\":\"Enter the name of your current school or university.\",\"default\":\"\",\"validation\":{\"min_length\":2,\"max_length\":100}},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0012\",\"type\":\"text\",\"label\":\"Major \\/ Field of Study\",\"key\":\"major_field\",\"placeholder\":\"e.g., Computer Science\",\"required\":true,\"help_text\":\"Specify your academic major or focus area.\",\"default\":\"\",\"validation\":{\"min_length\":2,\"max_length\":100}},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0013\",\"type\":\"date\",\"label\":\"Expected Graduation Date\",\"key\":\"expected_graduation_date\",\"required\":true,\"help_text\":\"Select your anticipated graduation month and year.\",\"default\":null},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0014\",\"type\":\"number\",\"label\":\"Cumulative GPA\",\"key\":\"cumulative_gpa\",\"placeholder\":\"3.80\",\"required\":false,\"help_text\":\"Enter your GPA on a 4.0 scale.\",\"default\":null,\"validation\":{\"min\":0,\"max\":4}},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0015\",\"type\":\"section\",\"label\":\"Skills & Expertise\",\"description\":\"Share your technical competencies and area of interest for this internship.\",\"key\":\"skills_and_expertise\"},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0016\",\"type\":\"heading\",\"text\":\"Skills & Area of Interest\",\"level\":2},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0017\",\"type\":\"radio\",\"label\":\"Preferred Internship Track\",\"key\":\"internship_track\",\"required\":true,\"help_text\":\"Choose the primary functional area you wish to apply for.\",\"default\":\"\",\"options\":[{\"label\":\"Software Engineering\",\"value\":\"software_engineering\"},{\"label\":\"Data Science & Analytics\",\"value\":\"data_science\"},{\"label\":\"Product Design (UI\\/UX)\",\"value\":\"product_design\"},{\"label\":\"Product Management\",\"value\":\"product_management\"},{\"label\":\"Marketing & Communications\",\"value\":\"marketing\"}]},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0018\",\"type\":\"checkbox\",\"label\":\"Technical Skills & Tools\",\"key\":\"technical_skills\",\"required\":true,\"help_text\":\"Select all technologies and methodologies you have experience with.\",\"options\":[{\"label\":\"Python\",\"value\":\"python\"},{\"label\":\"JavaScript \\/ TypeScript\",\"value\":\"javascript\"},{\"label\":\"SQL & Databases\",\"value\":\"sql\"},{\"label\":\"React \\/ Frontend Frameworks\",\"value\":\"react\"},{\"label\":\"Figma \\/ Adobe XD\",\"value\":\"figma\"},{\"label\":\"Data Analysis (Pandas, R)\",\"value\":\"data_analysis\"},{\"label\":\"Git \\/ Version Control\",\"value\":\"git\"}]},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0019\",\"type\":\"rating\",\"label\":\"Self-Assessed Overall Technical Proficiency\",\"key\":\"proficiency_rating\",\"help_text\":\"Rate your overall readiness for technical tasks (1 = Beginner, 5 = Advanced).\",\"max\":5,\"required\":false},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0026\",\"type\":\"section\",\"label\":\"Statement of Purpose\",\"description\":\"Provide a personal statement outlining your goals and motivation.\",\"key\":\"statement_of_purpose\"},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0027\",\"type\":\"heading\",\"text\":\"Motivation & Goals\",\"level\":2},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0020\",\"type\":\"textarea\",\"label\":\"Statement of Interest\",\"key\":\"statement_of_interest\",\"placeholder\":\"Describe why you want to join our internship program and what you hope to achieve...\",\"required\":true,\"help_text\":\"Keep your answer between 100 and 1000 characters.\",\"default\":\"\",\"validation\":{\"min_length\":100,\"max_length\":1000}},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0021\",\"type\":\"section\",\"label\":\"Documents & Availability\",\"description\":\"Upload relevant files and specify when you can start.\",\"key\":\"documents_and_availability\"},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0022\",\"type\":\"heading\",\"text\":\"Attachments & Schedule\",\"level\":2},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0023\",\"type\":\"file\",\"label\":\"Resume \\/ CV\",\"key\":\"resume_file\",\"required\":true,\"help_text\":\"Upload your resume in PDF or DOCX format (Max size: 5MB).\"},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0024\",\"type\":\"date\",\"label\":\"Earliest Available Start Date\",\"key\":\"earliest_start_date\",\"required\":true,\"help_text\":\"Select the date you can start your internship.\",\"default\":null},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0025\",\"type\":\"radio\",\"label\":\"Are you authorized to work in the country where this role is located?\",\"key\":\"work_authorization\",\"required\":true,\"help_text\":\"Indicate if you possess valid work authorization.\",\"default\":\"\",\"options\":[{\"label\":\"Yes\",\"value\":\"yes\"},{\"label\":\"No\",\"value\":\"no\"},{\"label\":\"Will require sponsorship\",\"value\":\"requires_sponsorship\"}]}]}', NULL),
(10, '2026-08-04 02:16:32', '2026-08-04 02:17:15', 3, 'edit the exiting form schema and group the fields (wherever necessary) under appropriate sections', NULL, 'edit', 'gemini', 'gemini-3.6-flash', 'completed', 1, 4907, 3853, 16028, 41470, '{\"version\":1,\"title\":\"Internship Application Form\",\"description\":\"Please complete the form below to apply for our internship program. Make sure to provide accurate education details and upload your latest resume.\",\"fields\":[{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0001\",\"type\":\"section\",\"label\":\"Personal Details\",\"description\":\"Provide your contact information so we can reach out regarding your application.\",\"key\":\"personal_details\"},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0003\",\"type\":\"text\",\"label\":\"First Name\",\"key\":\"first_name\",\"placeholder\":\"Jane\",\"required\":true,\"help_text\":\"Enter your legal first name.\",\"default\":\"\",\"section_id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0001\",\"validation\":{\"min_length\":1,\"max_length\":50}},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0004\",\"type\":\"text\",\"label\":\"Last Name\",\"key\":\"last_name\",\"placeholder\":\"Doe\",\"required\":true,\"help_text\":\"Enter your legal last name.\",\"default\":\"\",\"section_id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0001\",\"validation\":{\"min_length\":1,\"max_length\":50}},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0005\",\"type\":\"email\",\"label\":\"Email Address\",\"key\":\"email_address\",\"placeholder\":\"jane.doe@example.com\",\"required\":true,\"help_text\":\"We will send application updates to this email.\",\"default\":\"\",\"section_id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0001\"},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0006\",\"type\":\"phone\",\"label\":\"Phone Number\",\"key\":\"phone_number\",\"placeholder\":\"+1 (555) 000-0000\",\"required\":true,\"help_text\":\"Include your country code if outside the US.\",\"default\":\"\",\"section_id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0001\"},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0007\",\"type\":\"text\",\"label\":\"LinkedIn Profile URL\",\"key\":\"linkedin_url\",\"placeholder\":\"https:\\/\\/linkedin.com\\/in\\/username\",\"required\":false,\"help_text\":\"Provide a link to your professional LinkedIn profile.\",\"default\":\"\",\"section_id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0001\",\"validation\":{\"min_length\":null,\"max_length\":255}},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0008\",\"type\":\"section\",\"label\":\"Education History\",\"description\":\"Tell us about your current academic status and background.\",\"key\":\"education_history\"},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0010\",\"type\":\"dropdown\",\"label\":\"Current Degree Level\",\"key\":\"degree_level\",\"required\":true,\"help_text\":\"Select the degree level you are currently pursuing.\",\"default\":\"\",\"section_id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0008\",\"options\":[{\"label\":\"High School Diploma\",\"value\":\"high_school\"},{\"label\":\"Associate Degree\",\"value\":\"associate\"},{\"label\":\"Bachelor\'s Degree\",\"value\":\"bachelors\"},{\"label\":\"Master\'s Degree\",\"value\":\"masters\"},{\"label\":\"Doctorate \\/ PhD\",\"value\":\"doctorate\"}]},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0011\",\"type\":\"text\",\"label\":\"University \\/ Institution\",\"key\":\"institution_name\",\"placeholder\":\"e.g., Stanford University\",\"required\":true,\"help_text\":\"Enter the name of your current school or university.\",\"default\":\"\",\"section_id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0008\",\"validation\":{\"min_length\":2,\"max_length\":100}},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0012\",\"type\":\"text\",\"label\":\"Major \\/ Field of Study\",\"key\":\"major_field\",\"placeholder\":\"e.g., Computer Science\",\"required\":true,\"help_text\":\"Specify your academic major or focus area.\",\"default\":\"\",\"section_id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0008\",\"validation\":{\"min_length\":2,\"max_length\":100}},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0013\",\"type\":\"date\",\"label\":\"Expected Graduation Date\",\"key\":\"expected_graduation_date\",\"required\":true,\"help_text\":\"Select your anticipated graduation month and year.\",\"default\":null,\"section_id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0008\"},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0014\",\"type\":\"number\",\"label\":\"Cumulative GPA\",\"key\":\"cumulative_gpa\",\"placeholder\":\"3.80\",\"required\":false,\"help_text\":\"Enter your GPA on a 4.0 scale.\",\"default\":null,\"section_id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0008\",\"validation\":{\"min\":0,\"max\":4}},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0015\",\"type\":\"section\",\"label\":\"Skills & Expertise\",\"description\":\"Share your technical competencies and area of interest for this internship.\",\"key\":\"skills&_expertise\"},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0017\",\"type\":\"radio\",\"label\":\"Preferred Internship Track\",\"key\":\"internship_track\",\"required\":true,\"help_text\":\"Choose the primary functional area you wish to apply for.\",\"default\":\"\",\"section_id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0015\",\"options\":[{\"label\":\"Software Engineering\",\"value\":\"software_engineering\"},{\"label\":\"Data Science & Analytics\",\"value\":\"data_science\"},{\"label\":\"Product Design (UI\\/UX)\",\"value\":\"product_design\"},{\"label\":\"Product Management\",\"value\":\"product_management\"},{\"label\":\"Marketing & Communications\",\"value\":\"marketing\"}]},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0018\",\"type\":\"checkbox\",\"label\":\"Technical Skills & Tools\",\"key\":\"technical_skills\",\"required\":true,\"help_text\":\"Select all technologies and methodologies you have experience with.\",\"section_id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0015\",\"options\":[{\"label\":\"Python\",\"value\":\"python\"},{\"label\":\"JavaScript \\/ TypeScript\",\"value\":\"javascript\"},{\"label\":\"SQL & Databases\",\"value\":\"sql\"},{\"label\":\"React \\/ Frontend Frameworks\",\"value\":\"react\"},{\"label\":\"Figma \\/ Adobe XD\",\"value\":\"figma\"},{\"label\":\"Data Analysis (Pandas, R)\",\"value\":\"data_analysis\"},{\"label\":\"Git \\/ Version Control\",\"value\":\"git\"}]},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0019\",\"type\":\"rating\",\"label\":\"Self-Assessed Overall Technical Proficiency\",\"key\":\"proficiency_rating\",\"help_text\":\"Rate your overall readiness for technical tasks (1 = Beginner, 5 = Advanced).\",\"max\":5,\"required\":false,\"section_id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0015\"},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0020\",\"type\":\"textarea\",\"label\":\"Statement of Interest\",\"key\":\"statement_of_interest\",\"placeholder\":\"Describe why you want to join our internship program and what you hope to achieve...\",\"required\":true,\"help_text\":\"Keep your answer between 100 and 1000 characters.\",\"default\":\"\",\"section_id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0015\",\"validation\":{\"min_length\":100,\"max_length\":1000}},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0021\",\"type\":\"section\",\"label\":\"Documents & Availability\",\"description\":\"Upload relevant files and specify when you can start.\",\"key\":\"documents&_availability\"},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0023\",\"type\":\"file\",\"label\":\"Resume \\/ CV\",\"key\":\"resume_file\",\"required\":true,\"help_text\":\"Upload your resume in PDF or DOCX format (Max size: 5MB).\",\"section_id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0021\"},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0024\",\"type\":\"date\",\"label\":\"Earliest Available Start Date\",\"key\":\"earliest_start_date\",\"required\":true,\"help_text\":\"Select the date you can start your internship.\",\"default\":null,\"section_id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0021\"},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0025\",\"type\":\"radio\",\"label\":\"Are you authorized to work in the country where this role is located?\",\"key\":\"work_authorization\",\"required\":true,\"help_text\":\"Indicate if you possess valid work authorization.\",\"default\":\"\",\"section_id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0021\",\"options\":[{\"label\":\"Yes\",\"value\":\"yes\"},{\"label\":\"No\",\"value\":\"no\"},{\"label\":\"Will require sponsorship\",\"value\":\"requires_sponsorship\"}]}]}', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('356a192b7913b04c54574d18c28d46e6395428ab', 'i:1;', 1785839840),
('356a192b7913b04c54574d18c28d46e6395428ab:timer', 'i:1785839840;', 1785839840);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `schema` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`schema`)),
  `status` varchar(255) NOT NULL DEFAULT 'draft',
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forms`
--

INSERT INTO `forms` (`id`, `uuid`, `created_at`, `updated_at`, `deleted_at`, `name`, `slug`, `description`, `schema`, `status`, `created_by`, `published_at`) VALUES
(1, '3f8c1a83-18f0-45ec-bbaf-05c10efc544b', '2026-08-03 05:56:56', '2026-08-03 23:03:03', NULL, 'Test From', 'test-from', NULL, '{\"version\":1,\"title\":\"Test From\",\"description\":null,\"fields\":[{\"id\":\"6e20b7d8-c929-4af2-92c2-b5c30f58534d\",\"type\":\"text\",\"label\":\"Text\",\"key\":\"text_2\",\"required\":true,\"validation\":{\"min_length\":\"5\",\"max_length\":\"10\"},\"default\":\"default\"},{\"id\":\"7fd8674f-f4df-4db4-9c1c-8a3e452346e4\",\"type\":\"section\",\"label\":\"New Section\",\"description\":\"\"},{\"id\":\"e79f88d9-d045-47ee-aee9-ae8bbad13e8c\",\"type\":\"dropdown\",\"label\":\"Dropdown\",\"key\":\"dropdown_1\",\"required\":true,\"options\":[{\"label\":\"option 1\",\"value\":\"option_1\"},{\"label\":\"option 2\",\"value\":\"option_2\"},{\"label\":\"option 3\",\"value\":\"option_3\"}],\"placeholder\":\"test\",\"help_text\":\"test\",\"section_id\":\"7fd8674f-f4df-4db4-9c1c-8a3e452346e4\"}]}', 'draft', 1, NULL),
(2, '09c781af-be78-490f-954f-6f33a8f13f86', '2026-08-03 10:32:30', '2026-08-03 23:54:39', '2026-08-03 23:54:39', 'Test Form 2', 'test-form-2', NULL, '{\"version\":1,\"title\":\"Test Form 2\",\"description\":null,\"fields\":[]}', 'draft', 1, NULL),
(3, '263e185e-8a14-4e7a-8f45-cf151a50de67', '2026-08-04 02:10:17', '2026-08-04 02:17:24', NULL, 'Internship Application Form', 'internship-application-form', 'Please complete the form below to apply for our internship program. Make sure to provide accurate education details and upload your latest resume.', '{\"version\":1,\"title\":\"Internship Application Form\",\"description\":\"Please complete the form below to apply for our internship program. Make sure to provide accurate education details and upload your latest resume.\",\"fields\":[{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0001\",\"type\":\"section\",\"label\":\"Personal Details\",\"description\":\"Provide your contact information so we can reach out regarding your application.\",\"key\":\"personal_details\"},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0003\",\"type\":\"text\",\"label\":\"First Name\",\"key\":\"first_name\",\"placeholder\":\"Jane\",\"required\":true,\"help_text\":\"Enter your legal first name.\",\"default\":\"\",\"section_id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0001\",\"validation\":{\"min_length\":1,\"max_length\":50}},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0004\",\"type\":\"text\",\"label\":\"Last Name\",\"key\":\"last_name\",\"placeholder\":\"Doe\",\"required\":true,\"help_text\":\"Enter your legal last name.\",\"default\":\"\",\"section_id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0001\",\"validation\":{\"min_length\":1,\"max_length\":50}},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0005\",\"type\":\"email\",\"label\":\"Email Address\",\"key\":\"email_address\",\"placeholder\":\"jane.doe@example.com\",\"required\":true,\"help_text\":\"We will send application updates to this email.\",\"default\":\"\",\"section_id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0001\"},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0006\",\"type\":\"phone\",\"label\":\"Phone Number\",\"key\":\"phone_number\",\"placeholder\":\"+1 (555) 000-0000\",\"required\":true,\"help_text\":\"Include your country code if outside the US.\",\"default\":\"\",\"section_id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0001\"},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0007\",\"type\":\"text\",\"label\":\"LinkedIn Profile URL\",\"key\":\"linkedin_url\",\"placeholder\":\"https:\\/\\/linkedin.com\\/in\\/username\",\"required\":false,\"help_text\":\"Provide a link to your professional LinkedIn profile.\",\"default\":\"\",\"section_id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0001\",\"validation\":{\"min_length\":null,\"max_length\":255}},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0008\",\"type\":\"section\",\"label\":\"Education History\",\"description\":\"Tell us about your current academic status and background.\",\"key\":\"education_history\"},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0010\",\"type\":\"dropdown\",\"label\":\"Current Degree Level\",\"key\":\"degree_level\",\"required\":true,\"help_text\":\"Select the degree level you are currently pursuing.\",\"default\":\"\",\"section_id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0008\",\"options\":[{\"label\":\"High School Diploma\",\"value\":\"high_school\"},{\"label\":\"Associate Degree\",\"value\":\"associate\"},{\"label\":\"Bachelor\'s Degree\",\"value\":\"bachelors\"},{\"label\":\"Master\'s Degree\",\"value\":\"masters\"},{\"label\":\"Doctorate \\/ PhD\",\"value\":\"doctorate\"}]},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0011\",\"type\":\"text\",\"label\":\"University \\/ Institution\",\"key\":\"institution_name\",\"placeholder\":\"e.g., Stanford University\",\"required\":true,\"help_text\":\"Enter the name of your current school or university.\",\"default\":\"\",\"section_id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0008\",\"validation\":{\"min_length\":2,\"max_length\":100}},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0012\",\"type\":\"text\",\"label\":\"Major \\/ Field of Study\",\"key\":\"major_field\",\"placeholder\":\"e.g., Computer Science\",\"required\":true,\"help_text\":\"Specify your academic major or focus area.\",\"default\":\"\",\"section_id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0008\",\"validation\":{\"min_length\":2,\"max_length\":100}},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0013\",\"type\":\"date\",\"label\":\"Expected Graduation Date\",\"key\":\"expected_graduation_date\",\"required\":true,\"help_text\":\"Select your anticipated graduation month and year.\",\"default\":null,\"section_id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0008\"},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0014\",\"type\":\"number\",\"label\":\"Cumulative GPA\",\"key\":\"cumulative_gpa\",\"placeholder\":\"3.80\",\"required\":false,\"help_text\":\"Enter your GPA on a 4.0 scale.\",\"default\":null,\"section_id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0008\",\"validation\":{\"min\":0,\"max\":4}},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0015\",\"type\":\"section\",\"label\":\"Skills & Expertise\",\"description\":\"Share your technical competencies and area of interest for this internship.\",\"key\":\"skills&_expertise\"},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0017\",\"type\":\"radio\",\"label\":\"Preferred Internship Track\",\"key\":\"internship_track\",\"required\":true,\"help_text\":\"Choose the primary functional area you wish to apply for.\",\"default\":\"\",\"section_id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0015\",\"options\":[{\"label\":\"Software Engineering\",\"value\":\"software_engineering\"},{\"label\":\"Data Science & Analytics\",\"value\":\"data_science\"},{\"label\":\"Product Design (UI\\/UX)\",\"value\":\"product_design\"},{\"label\":\"Product Management\",\"value\":\"product_management\"},{\"label\":\"Marketing & Communications\",\"value\":\"marketing\"}]},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0018\",\"type\":\"checkbox\",\"label\":\"Technical Skills & Tools\",\"key\":\"technical_skills\",\"required\":true,\"help_text\":\"Select all technologies and methodologies you have experience with.\",\"section_id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0015\",\"options\":[{\"label\":\"Python\",\"value\":\"python\"},{\"label\":\"JavaScript \\/ TypeScript\",\"value\":\"javascript\"},{\"label\":\"SQL & Databases\",\"value\":\"sql\"},{\"label\":\"React \\/ Frontend Frameworks\",\"value\":\"react\"},{\"label\":\"Figma \\/ Adobe XD\",\"value\":\"figma\"},{\"label\":\"Data Analysis (Pandas, R)\",\"value\":\"data_analysis\"},{\"label\":\"Git \\/ Version Control\",\"value\":\"git\"}]},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0019\",\"type\":\"rating\",\"label\":\"Self-Assessed Overall Technical Proficiency\",\"key\":\"proficiency_rating\",\"help_text\":\"Rate your overall readiness for technical tasks (1 = Beginner, 5 = Advanced).\",\"max\":5,\"required\":false,\"section_id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0015\"},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0020\",\"type\":\"textarea\",\"label\":\"Statement of Interest\",\"key\":\"statement_of_interest\",\"placeholder\":\"Describe why you want to join our internship program and what you hope to achieve...\",\"required\":true,\"help_text\":\"Keep your answer between 100 and 1000 characters.\",\"default\":\"\",\"section_id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0015\",\"validation\":{\"min_length\":100,\"max_length\":1000}},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0021\",\"type\":\"section\",\"label\":\"Documents & Availability\",\"description\":\"Upload relevant files and specify when you can start.\",\"key\":\"documents&_availability\"},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0023\",\"type\":\"file\",\"label\":\"Resume \\/ CV\",\"key\":\"resume_file\",\"required\":true,\"help_text\":\"Upload your resume in PDF or DOCX format (Max size: 5MB).\",\"section_id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0021\"},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0024\",\"type\":\"date\",\"label\":\"Earliest Available Start Date\",\"key\":\"earliest_start_date\",\"required\":true,\"help_text\":\"Select the date you can start your internship.\",\"default\":null,\"section_id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0021\"},{\"id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0025\",\"type\":\"radio\",\"label\":\"Are you authorized to work in the country where this role is located?\",\"key\":\"work_authorization\",\"required\":true,\"help_text\":\"Indicate if you possess valid work authorization.\",\"default\":\"\",\"section_id\":\"e3b0c442-98fc-4c14-921d-1a1a1a1a0021\",\"options\":[{\"label\":\"Yes\",\"value\":\"yes\"},{\"label\":\"No\",\"value\":\"no\"},{\"label\":\"Will require sponsorship\",\"value\":\"requires_sponsorship\"}]}]}', 'published', 1, NULL),
(4, 'f1c5b528-e5ee-4e4f-8b31-f629dbc527f2', '2026-08-04 04:46:25', '2026-08-04 04:46:25', NULL, 'x6hRPavOAt6QnRRXzFFfOMQQhEzIUnfLmLztUvSW', 'x6hrpavoat6qnrrxzfffomqqheziunflmlztuvsw', '', '{\"version\":1,\"title\":\"x6hRPavOAt6QnRRXzFFfOMQQhEzIUnfLmLztUvSW\",\"description\":\"\",\"fields\":[{\"id\":\"03d19884-61cb-4aa1-85a0-b2456eee1546\",\"type\":\"section\",\"label\":\"Internship Application Form\",\"description\":\"\",\"key\":\"internship_application_form\"},{\"id\":\"8b2ff294-8aa9-420b-a062-a7c9e59227ec\",\"type\":\"section\",\"label\":\"Personal Information\",\"description\":\"\",\"key\":\"personal_information\"},{\"id\":\"799a8109-cb62-450c-aa4c-8191db601428\",\"type\":\"text\",\"label\":\"Full Name\",\"key\":\"full_name\",\"placeholder\":\"Enter your full name\",\"required\":true,\"help_text\":\"Please enter your legal full name\",\"default\":\"\",\"section_id\":\"8b2ff294-8aa9-420b-a062-a7c9e59227ec\",\"validation\":{\"min_length\":2,\"max_length\":100}},{\"id\":\"0adcb59e-0952-45e1-8e5a-9667a877bb69\",\"type\":\"email\",\"label\":\"Email Address\",\"key\":\"email_address\",\"placeholder\":\"example@domain.com\",\"required\":true,\"help_text\":\"We will send application updates to this email\",\"default\":\"\",\"section_id\":\"8b2ff294-8aa9-420b-a062-a7c9e59227ec\"},{\"id\":\"da5e287a-12ff-4609-af50-0e0f8e0ae686\",\"type\":\"phone\",\"label\":\"Phone Number\",\"key\":\"phone_number\",\"placeholder\":\"+1 (555) 000-0000\",\"required\":true,\"help_text\":\"Provide a phone number where we can reach you\",\"default\":\"\",\"section_id\":\"8b2ff294-8aa9-420b-a062-a7c9e59227ec\"},{\"id\":\"f3679a88-1fad-43cd-8123-eb83ee92504a\",\"type\":\"date\",\"label\":\"Date of Birth\",\"key\":\"date_of_birth\",\"required\":true,\"help_text\":\"Select your date of birth\",\"default\":null,\"section_id\":\"8b2ff294-8aa9-420b-a062-a7c9e59227ec\",\"validation\":{\"min\":null,\"max\":null}},{\"id\":\"7ca1af0c-b352-43a5-9844-10c3df02483b\",\"type\":\"radio\",\"label\":\"Gender\",\"key\":\"gender\",\"required\":true,\"help_text\":\"Select your gender\",\"default\":\"\",\"section_id\":\"8b2ff294-8aa9-420b-a062-a7c9e59227ec\",\"options\":[{\"label\":\"Male\",\"value\":\"male\"},{\"label\":\"Female\",\"value\":\"female\"},{\"label\":\"Other\",\"value\":\"other\"}]},{\"id\":\"8c80a617-1d2c-4ff4-8c18-f2a4390adca1\",\"type\":\"section\",\"label\":\"Education\",\"description\":\"\",\"key\":\"education\"},{\"id\":\"40562d71-fc44-426b-bcca-076133423682\",\"type\":\"text\",\"label\":\"College Name\",\"key\":\"college_name\",\"placeholder\":\"Enter your college or university name\",\"required\":true,\"help_text\":\"\",\"default\":\"\",\"section_id\":\"8c80a617-1d2c-4ff4-8c18-f2a4390adca1\",\"validation\":{\"min_length\":2,\"max_length\":150}},{\"id\":\"afbacf34-803e-457b-b90a-0a40aaa26149\",\"type\":\"text\",\"label\":\"Course\",\"key\":\"course\",\"placeholder\":\"e.g. B.S. Computer Science\",\"required\":true,\"help_text\":\"\",\"default\":\"\",\"section_id\":\"8c80a617-1d2c-4ff4-8c18-f2a4390adca1\",\"validation\":{\"min_length\":2,\"max_length\":100}},{\"id\":\"5499084f-7838-4bb6-ba1c-58f0e64a9aa3\",\"type\":\"number\",\"label\":\"Graduation Year\",\"key\":\"graduation_year\",\"placeholder\":\"e.g. 2025\",\"required\":true,\"help_text\":\"Year of expected or actual graduation\",\"default\":null,\"section_id\":\"8c80a617-1d2c-4ff4-8c18-f2a4390adca1\",\"validation\":{\"min\":1950,\"max\":2030}},{\"id\":\"b1e67b05-3ae2-4cce-baa8-8b6434050829\",\"type\":\"section\",\"label\":\"Skills\",\"description\":\"\",\"key\":\"skills\"},{\"id\":\"91efa203-7a9c-4abc-9506-d12cc05ca76d\",\"type\":\"checkbox\",\"label\":\"Primary Skill\",\"key\":\"primary_skill\",\"required\":true,\"help_text\":\"Select your technical skills\",\"section_id\":\"b1e67b05-3ae2-4cce-baa8-8b6434050829\",\"options\":[{\"label\":\"PHP\",\"value\":\"php\"},{\"label\":\"Laravel\",\"value\":\"laravel\"},{\"label\":\"JavaScript\",\"value\":\"javascript\"}]},{\"id\":\"d225fb02-6fc8-4fa3-aa10-fa1232395213\",\"type\":\"section\",\"label\":\"Documents\",\"description\":\"\",\"key\":\"documents\"},{\"id\":\"088d6259-72cd-4e80-bf3e-982d912ae255\",\"type\":\"file\",\"label\":\"Resume\",\"key\":\"resume\",\"required\":true,\"help_text\":\"Upload your resume (PDF or Word document, max 2MB)\",\"accept\":\".pdf,.doc,.docx\",\"max_size\":2048,\"section_id\":\"d225fb02-6fc8-4fa3-aa10-fa1232395213\"}]}', 'published', 1, NULL),
(5, '7994606a-0837-4442-822c-6078e0b7f7e0', '2026-08-04 05:07:31', '2026-08-04 05:07:31', NULL, 'Job Application Form', 'job-application-form', 'Please complete all sections to submit your application.', '{\"version\":1,\"title\":\"Job Application Form\",\"description\":\"Please complete all sections to submit your application.\",\"fields\":[{\"id\":\"56bac8a6-d48d-4900-8bd1-2692568d7179\",\"type\":\"section\",\"label\":\"Personal\",\"description\":\"Provide your basic personal information.\",\"key\":\"personal\"},{\"id\":\"62dfc6a1-1e88-4ee5-9d01-3a8d438c1e9e\",\"type\":\"text\",\"label\":\"Full Name\",\"key\":\"full_name\",\"placeholder\":\"e.g. Jane Doe\",\"required\":true,\"help_text\":\"Enter your full legal name\",\"default\":\"\",\"section_id\":\"56bac8a6-d48d-4900-8bd1-2692568d7179\",\"validation\":{\"min_length\":2,\"max_length\":100}},{\"id\":\"e06993aa-0d2a-4433-84ff-11028aba9fd6\",\"type\":\"email\",\"label\":\"Email\",\"key\":\"email\",\"placeholder\":\"e.g. jane.doe@example.com\",\"required\":true,\"help_text\":\"Enter a primary email address where we can contact you\",\"default\":\"\",\"section_id\":\"56bac8a6-d48d-4900-8bd1-2692568d7179\"},{\"id\":\"adc5d6df-363f-4393-9f77-ff1b3ba7d24a\",\"type\":\"phone\",\"label\":\"Phone\",\"key\":\"phone\",\"placeholder\":\"e.g. +1 (555) 000-0000\",\"required\":false,\"help_text\":\"Enter your phone number with country code\",\"default\":\"\",\"section_id\":\"56bac8a6-d48d-4900-8bd1-2692568d7179\"},{\"id\":\"446e035f-daa3-4003-a526-7fd8c206f4d4\",\"type\":\"radio\",\"label\":\"Gender\",\"key\":\"gender\",\"required\":true,\"help_text\":\"Select your gender identity\",\"default\":\"\",\"section_id\":\"56bac8a6-d48d-4900-8bd1-2692568d7179\",\"options\":[{\"label\":\"Male\",\"value\":\"male\"},{\"label\":\"Female\",\"value\":\"female\"},{\"label\":\"Other\",\"value\":\"other\"}]},{\"id\":\"e481abd1-e3a7-48e6-b784-797e18d317b2\",\"type\":\"section\",\"label\":\"Education\",\"description\":\"Provide information about your academic background.\",\"key\":\"education\"},{\"id\":\"39dcb488-8adf-457d-b1ea-eb44b557a771\",\"type\":\"text\",\"label\":\"College\",\"key\":\"college\",\"placeholder\":\"e.g. Harvard University\",\"required\":true,\"help_text\":\"Enter the name of your college or university\",\"default\":\"\",\"section_id\":\"e481abd1-e3a7-48e6-b784-797e18d317b2\",\"validation\":{\"min_length\":2,\"max_length\":150}},{\"id\":\"c1835138-8279-429d-a05f-77cf5887b53c\",\"type\":\"text\",\"label\":\"Degree\",\"key\":\"degree\",\"placeholder\":\"e.g. Bachelor of Science in Computer Science\",\"required\":true,\"help_text\":\"Enter your degree and major\",\"default\":\"\",\"section_id\":\"e481abd1-e3a7-48e6-b784-797e18d317b2\",\"validation\":{\"min_length\":2,\"max_length\":100}},{\"id\":\"271b190c-c156-4cba-8b6c-0a10cc8c714a\",\"type\":\"section\",\"label\":\"Documents\",\"description\":\"Upload all relevant documents for evaluation.\",\"key\":\"documents\"},{\"id\":\"de6c489f-c88e-42f0-8c95-9e4a4ffb7b2d\",\"type\":\"file\",\"label\":\"Resume\",\"key\":\"resume\",\"required\":true,\"help_text\":\"Upload your updated resume (PDF or Word document, max 5MB)\",\"accept\":\".pdf,.doc,.docx\",\"max_size\":5120,\"section_id\":\"271b190c-c156-4cba-8b6c-0a10cc8c714a\"}]}', 'published', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `form_versions`
--

CREATE TABLE `form_versions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `form_id` bigint(20) UNSIGNED NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `schema` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`schema`)),
  `created_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `import_requests`
--

CREATE TABLE `import_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `form_id` bigint(20) UNSIGNED DEFAULT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `parsed_schema` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`parsed_schema`)),
  `provider` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `input_tokens` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `output_tokens` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `total_tokens` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `latency_ms` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `error` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `import_requests`
--

INSERT INTO `import_requests` (`id`, `created_at`, `updated_at`, `form_id`, `file_name`, `file_type`, `status`, `parsed_schema`, `provider`, `model`, `input_tokens`, `output_tokens`, `total_tokens`, `latency_ms`, `error`) VALUES
(1, '2026-08-04 04:27:54', '2026-08-04 04:46:25', 4, 'imports/x6hRPavOAt6QnRRXzFFfOMQQhEzIUnfLmLztUvSW.docx', 'docx', 'completed', '{\"version\":1,\"title\":\"x6hRPavOAt6QnRRXzFFfOMQQhEzIUnfLmLztUvSW\",\"description\":\"\",\"fields\":[{\"id\":\"03d19884-61cb-4aa1-85a0-b2456eee1546\",\"type\":\"section\",\"label\":\"Internship Application Form\",\"description\":\"\",\"key\":\"internship_application_form\"},{\"id\":\"8b2ff294-8aa9-420b-a062-a7c9e59227ec\",\"type\":\"section\",\"label\":\"Personal Information\",\"description\":\"\",\"key\":\"personal_information\"},{\"id\":\"799a8109-cb62-450c-aa4c-8191db601428\",\"type\":\"text\",\"label\":\"Full Name\",\"key\":\"full_name\",\"placeholder\":\"Enter your full name\",\"required\":true,\"help_text\":\"Please enter your legal full name\",\"default\":\"\",\"section_id\":\"8b2ff294-8aa9-420b-a062-a7c9e59227ec\",\"validation\":{\"min_length\":2,\"max_length\":100}},{\"id\":\"0adcb59e-0952-45e1-8e5a-9667a877bb69\",\"type\":\"email\",\"label\":\"Email Address\",\"key\":\"email_address\",\"placeholder\":\"example@domain.com\",\"required\":true,\"help_text\":\"We will send application updates to this email\",\"default\":\"\",\"section_id\":\"8b2ff294-8aa9-420b-a062-a7c9e59227ec\"},{\"id\":\"da5e287a-12ff-4609-af50-0e0f8e0ae686\",\"type\":\"phone\",\"label\":\"Phone Number\",\"key\":\"phone_number\",\"placeholder\":\"+1 (555) 000-0000\",\"required\":true,\"help_text\":\"Provide a phone number where we can reach you\",\"default\":\"\",\"section_id\":\"8b2ff294-8aa9-420b-a062-a7c9e59227ec\"},{\"id\":\"f3679a88-1fad-43cd-8123-eb83ee92504a\",\"type\":\"date\",\"label\":\"Date of Birth\",\"key\":\"date_of_birth\",\"required\":true,\"help_text\":\"Select your date of birth\",\"default\":null,\"section_id\":\"8b2ff294-8aa9-420b-a062-a7c9e59227ec\",\"validation\":{\"min\":null,\"max\":null}},{\"id\":\"7ca1af0c-b352-43a5-9844-10c3df02483b\",\"type\":\"radio\",\"label\":\"Gender\",\"key\":\"gender\",\"required\":true,\"help_text\":\"Select your gender\",\"default\":\"\",\"section_id\":\"8b2ff294-8aa9-420b-a062-a7c9e59227ec\",\"options\":[{\"label\":\"Male\",\"value\":\"male\"},{\"label\":\"Female\",\"value\":\"female\"},{\"label\":\"Other\",\"value\":\"other\"}]},{\"id\":\"74f6491a-d0d9-476e-a64e-b23897f94089\",\"type\":\"radio\",\"label\":\"\\u2022 Male\",\"key\":\"\\u2022_male\",\"required\":false,\"help_text\":\"\",\"default\":\"\",\"section_id\":\"8b2ff294-8aa9-420b-a062-a7c9e59227ec\",\"options\":[{\"label\":\"Male\",\"value\":\"male\"}]},{\"id\":\"75f60bda-ecff-4f68-97a6-529caa46250a\",\"type\":\"radio\",\"label\":\"\\u2022 Female\",\"key\":\"\\u2022_female\",\"required\":false,\"help_text\":\"\",\"default\":\"\",\"section_id\":\"8b2ff294-8aa9-420b-a062-a7c9e59227ec\",\"options\":[{\"label\":\"Female\",\"value\":\"female\"}]},{\"id\":\"caf1fb4d-afa7-4c5c-a3ea-12882d0f9167\",\"type\":\"radio\",\"label\":\"\\u2022 Other\",\"key\":\"\\u2022_other\",\"required\":false,\"help_text\":\"\",\"default\":\"\",\"section_id\":\"8b2ff294-8aa9-420b-a062-a7c9e59227ec\",\"options\":[{\"label\":\"Other\",\"value\":\"other\"}]},{\"id\":\"8c80a617-1d2c-4ff4-8c18-f2a4390adca1\",\"type\":\"section\",\"label\":\"Education\",\"description\":\"\",\"key\":\"education\"},{\"id\":\"40562d71-fc44-426b-bcca-076133423682\",\"type\":\"text\",\"label\":\"College Name\",\"key\":\"college_name\",\"placeholder\":\"Enter your college or university name\",\"required\":true,\"help_text\":\"\",\"default\":\"\",\"section_id\":\"8c80a617-1d2c-4ff4-8c18-f2a4390adca1\",\"validation\":{\"min_length\":2,\"max_length\":150}},{\"id\":\"afbacf34-803e-457b-b90a-0a40aaa26149\",\"type\":\"text\",\"label\":\"Course\",\"key\":\"course\",\"placeholder\":\"e.g. B.S. Computer Science\",\"required\":true,\"help_text\":\"\",\"default\":\"\",\"section_id\":\"8c80a617-1d2c-4ff4-8c18-f2a4390adca1\",\"validation\":{\"min_length\":2,\"max_length\":100}},{\"id\":\"5499084f-7838-4bb6-ba1c-58f0e64a9aa3\",\"type\":\"number\",\"label\":\"Graduation Year\",\"key\":\"graduation_year\",\"placeholder\":\"e.g. 2025\",\"required\":true,\"help_text\":\"Year of expected or actual graduation\",\"default\":null,\"section_id\":\"8c80a617-1d2c-4ff4-8c18-f2a4390adca1\",\"validation\":{\"min\":1950,\"max\":2030}},{\"id\":\"b1e67b05-3ae2-4cce-baa8-8b6434050829\",\"type\":\"section\",\"label\":\"Skills\",\"description\":\"\",\"key\":\"skills\"},{\"id\":\"91efa203-7a9c-4abc-9506-d12cc05ca76d\",\"type\":\"checkbox\",\"label\":\"Primary Skill\",\"key\":\"primary_skill\",\"required\":true,\"help_text\":\"Select your technical skills\",\"section_id\":\"b1e67b05-3ae2-4cce-baa8-8b6434050829\",\"options\":[{\"label\":\"PHP\",\"value\":\"php\"},{\"label\":\"Laravel\",\"value\":\"laravel\"},{\"label\":\"JavaScript\",\"value\":\"javascript\"}]},{\"id\":\"02ae8c97-aa99-4a93-877c-f0c131f049ae\",\"type\":\"checkbox\",\"label\":\"\\u2022 PHP\",\"key\":\"\\u2022_p_h_p\",\"required\":false,\"help_text\":\"\",\"section_id\":\"b1e67b05-3ae2-4cce-baa8-8b6434050829\",\"options\":[{\"label\":\"PHP\",\"value\":\"php\"}]},{\"id\":\"ac687e74-38ad-4c8a-bb7c-4a58f4f88864\",\"type\":\"checkbox\",\"label\":\"\\u2022 Laravel\",\"key\":\"\\u2022_laravel\",\"required\":false,\"help_text\":\"\",\"section_id\":\"b1e67b05-3ae2-4cce-baa8-8b6434050829\",\"options\":[{\"label\":\"Laravel\",\"value\":\"laravel\"}]},{\"id\":\"752d80e5-fd34-40e7-b54a-b51d9d9ec7b9\",\"type\":\"checkbox\",\"label\":\"\\u2022 JavaScript\",\"key\":\"\\u2022_java_script\",\"required\":false,\"help_text\":\"\",\"section_id\":\"b1e67b05-3ae2-4cce-baa8-8b6434050829\",\"options\":[{\"label\":\"JavaScript\",\"value\":\"javascript\"}]},{\"id\":\"d225fb02-6fc8-4fa3-aa10-fa1232395213\",\"type\":\"section\",\"label\":\"Documents\",\"description\":\"\",\"key\":\"documents\"},{\"id\":\"088d6259-72cd-4e80-bf3e-982d912ae255\",\"type\":\"file\",\"label\":\"Resume\",\"key\":\"resume\",\"required\":true,\"help_text\":\"Upload your resume (PDF or Word document, max 2MB)\",\"accept\":\".pdf,.doc,.docx\",\"max_size\":2048,\"section_id\":\"d225fb02-6fc8-4fa3-aa10-fa1232395213\"}]}', NULL, NULL, 0, 0, 0, 0, NULL),
(2, '2026-08-04 05:06:35', '2026-08-04 05:07:31', 5, 'imports/urscg7WUabPALLwK0yxzvmbL5HtMbWJWR9EbOXG9.xlsx', 'xlsx', 'completed', '{\"version\":1,\"title\":\"Job Application Form\",\"description\":\"Please complete all sections to submit your application.\",\"fields\":[{\"id\":\"56bac8a6-d48d-4900-8bd1-2692568d7179\",\"type\":\"section\",\"label\":\"Personal\",\"description\":\"Provide your basic personal information.\",\"key\":\"personal\"},{\"id\":\"62dfc6a1-1e88-4ee5-9d01-3a8d438c1e9e\",\"type\":\"text\",\"label\":\"Full Name\",\"key\":\"full_name\",\"placeholder\":\"e.g. Jane Doe\",\"required\":true,\"help_text\":\"Enter your full legal name\",\"default\":\"\",\"section_id\":\"56bac8a6-d48d-4900-8bd1-2692568d7179\",\"validation\":{\"min_length\":2,\"max_length\":100}},{\"id\":\"e06993aa-0d2a-4433-84ff-11028aba9fd6\",\"type\":\"email\",\"label\":\"Email\",\"key\":\"email\",\"placeholder\":\"e.g. jane.doe@example.com\",\"required\":true,\"help_text\":\"Enter a primary email address where we can contact you\",\"default\":\"\",\"section_id\":\"56bac8a6-d48d-4900-8bd1-2692568d7179\"},{\"id\":\"adc5d6df-363f-4393-9f77-ff1b3ba7d24a\",\"type\":\"phone\",\"label\":\"Phone\",\"key\":\"phone\",\"placeholder\":\"e.g. +1 (555) 000-0000\",\"required\":false,\"help_text\":\"Enter your phone number with country code\",\"default\":\"\",\"section_id\":\"56bac8a6-d48d-4900-8bd1-2692568d7179\"},{\"id\":\"446e035f-daa3-4003-a526-7fd8c206f4d4\",\"type\":\"radio\",\"label\":\"Gender\",\"key\":\"gender\",\"required\":true,\"help_text\":\"Select your gender identity\",\"default\":\"\",\"section_id\":\"56bac8a6-d48d-4900-8bd1-2692568d7179\",\"options\":[{\"label\":\"Male\",\"value\":\"male\"},{\"label\":\"Female\",\"value\":\"female\"},{\"label\":\"Other\",\"value\":\"other\"}]},{\"id\":\"e481abd1-e3a7-48e6-b784-797e18d317b2\",\"type\":\"section\",\"label\":\"Education\",\"description\":\"Provide information about your academic background.\",\"key\":\"education\"},{\"id\":\"39dcb488-8adf-457d-b1ea-eb44b557a771\",\"type\":\"text\",\"label\":\"College\",\"key\":\"college\",\"placeholder\":\"e.g. Harvard University\",\"required\":true,\"help_text\":\"Enter the name of your college or university\",\"default\":\"\",\"section_id\":\"e481abd1-e3a7-48e6-b784-797e18d317b2\",\"validation\":{\"min_length\":2,\"max_length\":150}},{\"id\":\"c1835138-8279-429d-a05f-77cf5887b53c\",\"type\":\"text\",\"label\":\"Degree\",\"key\":\"degree\",\"placeholder\":\"e.g. Bachelor of Science in Computer Science\",\"required\":true,\"help_text\":\"Enter your degree and major\",\"default\":\"\",\"section_id\":\"e481abd1-e3a7-48e6-b784-797e18d317b2\",\"validation\":{\"min_length\":2,\"max_length\":100}},{\"id\":\"271b190c-c156-4cba-8b6c-0a10cc8c714a\",\"type\":\"section\",\"label\":\"Documents\",\"description\":\"Upload all relevant documents for evaluation.\",\"key\":\"documents\"},{\"id\":\"de6c489f-c88e-42f0-8c95-9e4a4ffb7b2d\",\"type\":\"file\",\"label\":\"Resume\",\"key\":\"resume\",\"required\":true,\"help_text\":\"Upload your updated resume (PDF or Word document, max 5MB)\",\"accept\":\".pdf,.doc,.docx\",\"max_size\":5120,\"section_id\":\"271b190c-c156-4cba-8b6c-0a10cc8c714a\"}]}', 'gemini', 'gemini-3.6-flash', 5310, 1538, 9614, 19544, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_08_03_101828_create_forms_table', 2),
(5, '2026_08_03_101829_create_form_versions_table', 3),
(6, '2026_08_03_101829_create_submissions_table', 3),
(8, '2026_08_03_101833_create_ai_generations_table', 4),
(10, '2026_08_04_091949_create_import_requests_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('dQBVTnPQKC8tNaW798NT43FfZaZghDmRMyRR7Lej', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:153.0) Gecko/20100101 Firefox/153.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRzB2WjNGVE8xVHNvRzRZbnJONElxbHdBekNodVlVS3FXRXZST29HbSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly9mb3JtLWJ1aWxkZXIudGVzdC9mb3Jtcy9jcmVhdGUiO31zOjM6InVybCI7YTowOnt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1785841839);

-- --------------------------------------------------------

--
-- Table structure for table `submissions`
--

CREATE TABLE `submissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `form_id` bigint(20) UNSIGNED NOT NULL,
  `answers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`answers`)),
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `submissions`
--

INSERT INTO `submissions` (`id`, `created_at`, `updated_at`, `form_id`, `answers`, `ip_address`, `user_agent`, `submitted_at`) VALUES
(1, '2026-08-03 23:22:51', '2026-08-03 23:22:51', 1, '{\"text_2\":\"default te\",\"dropdown_1\":\"option_3\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:153.0) Gecko/20100101 Firefox/153.0', '2026-08-04 04:52:51'),
(2, '2026-08-04 03:11:13', '2026-08-04 03:11:13', 3, '{\"first_name\":\"Halla\",\"last_name\":\"Chan\",\"email_address\":\"gumuvi@mailinator.com\",\"phone_number\":\"+1 (957) 273-3264\",\"linkedin_url\":\"Dolor est corrupti \",\"degree_level\":\"bachelors\",\"institution_name\":\"Catherine Sanchez\",\"major_field\":\"Consectetur facilis \",\"expected_graduation_date\":\"2003-12-06\",\"cumulative_gpa\":\"4\",\"internship_track\":\"marketing\",\"proficiency_rating\":\"3\",\"statement_of_interest\":\"Unde sed esse sed po Unde sed esse sed po Unde sed esse sed po Unde sed esse sed po Unde sed esse sed po\",\"resume_file\":\"uploads\\/5aQwu3FZ1pE4beiVDNvAlr1PDnKs6PWISqydyEuy.pdf\",\"earliest_start_date\":\"1985-10-14\",\"work_authorization\":\"yes\",\"technical_skills\":[\"figma\",\"data_analysis\",\"git\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:153.0) Gecko/20100101 Firefox/153.0', '2026-08-04 08:41:13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@test.com', NULL, '$2y$12$9KadOC9MRGA489YT3qS6WeBMRPXzhsXl0OvYXTM7AzrmYzaQFRMJm', '1tCWOzcbkZgRorhv7B9EH5BjDmnKUhpKmBjZayehi25AKGWnHrxYvwINrP6c', '2026-08-03 04:42:31', '2026-08-03 04:42:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ai_requests`
--
ALTER TABLE `ai_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ai_requests_form_id_status_index` (`form_id`,`status`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `forms_uuid_unique` (`uuid`),
  ADD UNIQUE KEY `forms_slug_unique` (`slug`),
  ADD KEY `forms_status_index` (`status`),
  ADD KEY `forms_created_by_index` (`created_by`),
  ADD KEY `forms_published_at_index` (`published_at`);

--
-- Indexes for table `form_versions`
--
ALTER TABLE `form_versions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `form_versions_form_id_version_unique` (`form_id`,`version`),
  ADD KEY `form_versions_created_by_foreign` (`created_by`);

--
-- Indexes for table `import_requests`
--
ALTER TABLE `import_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `import_requests_form_id_foreign` (`form_id`),
  ADD KEY `import_requests_status_index` (`status`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `submissions`
--
ALTER TABLE `submissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `submissions_form_id_submitted_at_index` (`form_id`,`submitted_at`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ai_requests`
--
ALTER TABLE `ai_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `form_versions`
--
ALTER TABLE `form_versions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `import_requests`
--
ALTER TABLE `import_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `submissions`
--
ALTER TABLE `submissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ai_requests`
--
ALTER TABLE `ai_requests`
  ADD CONSTRAINT `ai_requests_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `forms`
--
ALTER TABLE `forms`
  ADD CONSTRAINT `forms_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `form_versions`
--
ALTER TABLE `form_versions`
  ADD CONSTRAINT `form_versions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `form_versions_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `import_requests`
--
ALTER TABLE `import_requests`
  ADD CONSTRAINT `import_requests_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `submissions`
--
ALTER TABLE `submissions`
  ADD CONSTRAINT `submissions_form_id_foreign` FOREIGN KEY (`form_id`) REFERENCES `forms` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
