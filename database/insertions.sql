USE ThesisHubDb;

GO
-- CLEAN TABLES IN ORDER
DELETE FROM comments;

DELETE FROM documents;

DELETE FROM project_tutors;

DELETE FROM projects;

DELETE FROM tutors;

DELETE FROM students;

DELETE FROM departments;

GO
-- RESEED ALL TABLES WITH IDENTITY
DBCC CHECKIDENT ('departments', RESEED, 0);

DBCC CHECKIDENT ('students', RESEED, 0);

DBCC CHECKIDENT ('tutors', RESEED, 0);

DBCC CHECKIDENT ('projects', RESEED, 0);

DBCC CHECKIDENT ('project_tutors', RESEED, 0);

DBCC CHECKIDENT ('documents', RESEED, 0);

DBCC CHECKIDENT ('comments', RESEED, 0);

GO
-- INSERT DEPARTMENTS
SET
IDENTITY_INSERT departments ON;

INSERT INTO
    departments (id, dept_name, faculty_head, email)
VALUES
    (1, 'Computer Science', 'Dr. Patricia Walsh', 'p.walsh@univ.edu'),
    (2, 'Mechanical Engineering', 'Dr. Robert Hines', 'r.hines@univ.edu'),
    (3, 'Business Administration', 'Dr. Sandra Bloom', 's.bloom@univ.edu'),
    (4, 'Biomedical Engineering', 'Dr. James Ortega', 'j.ortega@univ.edu');

SET
IDENTITY_INSERT departments OFF;

GO
-- INSERT STUDENTS
INSERT INTO
    students (first_name, last_name, email, phone, department_id)
VALUES
    ('Ethan', 'Carroll', 'e.carroll@student.univ.edu', '809-112-3344', 1),
    ('Sophia', 'Brennan', 's.brennan@student.univ.edu', '809-223-4455', 2),
    ('Marcus', 'Delgado', 'm.delgado@student.univ.edu', '809-334-5566', 1),
    ('Isabelle', 'Fontaine', 'i.fontaine@student.univ.edu', '809-445-6677', 3),
    ('Noah', 'Castillo', 'n.castillo@student.univ.edu', '809-556-7788', 4),
    ('Olivia', 'Harrington', 'o.harrington@student.univ.edu', '809-667-8899', 3),
    ('Liam', 'Okafor', 'l.okafor@student.univ.edu', '809-778-9900', 2);

GO
-- INSERT TUTORS
INSERT INTO
    tutors (first_name, last_name, email, specialization, department_id)
VALUES
    ('Patricia', 'Walsh', 'p.walsh@univ.edu', 'Artificial Intelligence', 1),
    ('Robert', 'Hines', 'r.hines@univ.edu', 'Robotics & Control Systems', 2),
    ('Sandra', 'Bloom', 's.bloom@univ.edu', 'Digital Marketing Strategy', 3),
    ('James', 'Ortega', 'j.ortega@univ.edu', 'Biomedical Signal Processing', 4),
    ('Diana', 'Mercer', 'd.mercer@univ.edu', 'Software Architecture', 1),
    ('Kevin', 'Ashworth', 'k.ashworth@univ.edu', 'Supply Chain Management', 3);

GO
-- INSERT PROJECTS
INSERT INTO
    projects (title, project_description, registration_date, project_status, student_id)
VALUES
    (
        'Adaptive Book Recommendation Engine',
        'Design and implementation of a machine learning system that recommends books based on reading history, ratings, and behavioral patterns using collaborative filtering.',
        DATEADD(DAY, -110, GETDATE()),
        'in progress',
        1
    ),
    (
        'Autonomous Terrain Scout Robot',
        'Mechanical design, sensor integration, and embedded control of a four-wheeled robot capable of mapping and navigating unstructured outdoor terrain.',
        DATEADD(DAY, -80, GETDATE()),
        'under review',
        2
    ),
    (
        'Social Media Growth Strategy for SMEs',
        'Development of a data-driven digital marketing plan for small and medium enterprises, covering content strategy, KPI definition, and ROI measurement frameworks.',
        DATEADD(DAY, -60, GETDATE()),
        'approved',
        4
    ),
    (
        'Early Disease Detection via Health Data Analysis',
        'Statistical modeling and machine learning pipeline for processing anonymized patient records to identify early indicators of chronic diseases.',
        DATEADD(DAY, -120, GETDATE()),
        'completed',
        3
    ),
    (
        'Wearable ECG Signal Classifier',
        'Real-time classification of electrocardiogram signals captured from a wearable device using convolutional neural networks for arrhythmia detection.',
        DATEADD(DAY, -90, GETDATE()),
        'in progress',
        5
    ),
    (
        'E-Commerce Logistics Optimization',
        'Linear programming and simulation models for optimizing last-mile delivery routes and warehouse allocation for an e-commerce case study.',
        DATEADD(DAY, -45, GETDATE()),
        'under review',
        6
    ),
    (
        'Predictive Maintenance for Industrial Equipment',
        'Vibration and temperature sensor fusion model to predict failure windows in industrial machinery, reducing unplanned downtime.',
        DATEADD(DAY, -70, GETDATE()),
        'approved',
        7
    );

GO
-- INSERT PROJECT TUTORS
INSERT INTO
    project_tutors (project_id, tutor_id, tutor_role)
VALUES
    (1, 1, 'Main Tutor'),
    (1, 5, 'Co-Advisor'),
    (2, 2, 'Main Tutor'),
    (3, 3, 'Main Tutor'),
    (3, 6, 'Co-Advisor'),
    (4, 1, 'Main Tutor'),
    (4, 4, 'Co-Advisor'),
    (5, 4, 'Main Tutor'),
    (6, 6, 'Main Tutor'),
    (6, 3, 'Co-Advisor'),
    (7, 2, 'Main Tutor');

GO
-- INSERT DOCUMENTS
INSERT INTO
    documents (doc_name, file_path, upload_date, doc_status, project_id)
VALUES
    (
        'Project_Proposal_BookEngine.pdf',
        '/docs/proposal_book_engine.pdf',
        DATEADD(DAY, -108, GETDATE()),
        'under review',
        1
    ),
    (
        'Literature_Review_BookEngine.pdf',
        '/docs/lit_review_book_engine.pdf',
        DATEADD(DAY, -85, GETDATE()),
        'approved',
        1
    ),
    (
        'Progress_Report_ScoutRobot.pdf',
        '/docs/progress_scout_robot.pdf',
        DATEADD(DAY, -50, GETDATE()),
        'approved',
        2
    ),
    (
        'Marketing_Plan_SMEs.pdf',
        '/docs/marketing_plan_smes.pdf',
        DATEADD(DAY, -55, GETDATE()),
        'approved',
        3
    ),
    (
        'Health_Data_Analysis_Report.docx',
        '/docs/health_data_analysis.docx',
        DATEADD(DAY, -110, GETDATE()),
        'rejected',
        4
    ),
    (
        'Final_Thesis_HealthAnalysis.pdf',
        '/docs/final_thesis_health_analysis.pdf',
        DATEADD(DAY, -30, GETDATE()),
        'approved',
        4
    ),
    (
        'ECG_Classifier_Proposal.pdf',
        '/docs/ecg_classifier_proposal.pdf',
        DATEADD(DAY, -88, GETDATE()),
        'approved',
        5
    ),
    (
        'ECG_Model_Evaluation.pdf',
        '/docs/ecg_model_evaluation.pdf',
        DATEADD(DAY, -40, GETDATE()),
        'under review',
        5
    ),
    (
        'Logistics_Optimization_Draft.pdf',
        '/docs/logistics_optimization_draft.pdf',
        DATEADD(DAY, -42, GETDATE()),
        'under review',
        6
    ),
    (
        'Maintenance_Model_Report.pdf',
        '/docs/maintenance_model_report.pdf',
        DATEADD(DAY, -65, GETDATE()),
        'approved',
        7
    );

GO
-- INSERT COMMENTS
INSERT INTO
    comments (comment_text, upload_date, document_id, tutor_id)
VALUES
    (
        'Good problem framing. The motivation section is clear, but the methodology needs more detail on the filtering algorithm you plan to use.',
        DATEADD(DAY, -107, GETDATE()),
        1,
        1
    ),
    (
        'Literature coverage is solid. Make sure to include at least two papers from the last two years to reflect the current state of the field.',
        DATEADD(DAY, -83, GETDATE()),
        2,
        5
    ),
    (
        'Progress report is well structured. Sensor calibration results are promising. Include error margin data in the next submission.',
        DATEADD(DAY, -49, GETDATE()),
        3,
        2
    ),
    (
        'Strong plan overall. The KPI section is particularly well thought out. Minor revision needed on the competitor analysis methodology.',
        DATEADD(DAY, -53, GETDATE()),
        4,
        3
    ),
    (
        'The data preprocessing section is incomplete. Feature normalization and handling of missing values must be addressed before resubmission.',
        DATEADD(DAY, -108, GETDATE()),
        5,
        1
    ),
    (
        'Excellent final thesis. The results are clearly presented and the conclusions are well supported by the data. Approved for submission.',
        DATEADD(DAY, -28, GETDATE()),
        6,
        4
    ),
    (
        'Proposal approved. CNN architecture choice is well justified. Confirm that the training dataset is balanced across arrhythmia classes.',
        DATEADD(DAY, -86, GETDATE()),
        7,
        4
    ),
    (
        'Model evaluation looks promising but the confusion matrix is missing from the report. Please add it along with precision and recall per class.',
        DATEADD(DAY, -38, GETDATE()),
        8,
        4
    ),
    (
        'The simulation model is a good start. Revise the assumptions section; some constraints are too optimistic for a real-world scenario.',
        DATEADD(DAY, -40, GETDATE()),
        9,
        6
    ),
    (
        'Very thorough report. The sensor fusion approach is well documented. Ready for final review.',
        DATEADD(DAY, -63, GETDATE()),
        10,
        2
    );

GO
