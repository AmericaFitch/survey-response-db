-- Made-up sample data for trying the schema. No real people or surveys.
PRAGMA foreign_keys = ON;

INSERT INTO User (user_name) VALUES
    ('research_team'),
    ('student_affairs');

INSERT INTO Survey (survey_id, user_name, survey_name) VALUES
    (1, 'research_team',   'Study Habits 2026'),
    (2, 'student_affairs', 'Campus Dining Feedback');

INSERT INTO Survey_details (question_id, survey_id, question_text, question_type) VALUES
    (1, 1, 'How many hours do you study per week?',        'number'),
    (2, 1, 'What is your biggest obstacle to studying?',   'text'),
    (3, 1, 'Do you use AI tools when studying?',           'yes_no'),
    (4, 2, 'Rate the dining hall food from 1 to 5.',       'rating'),
    (5, 2, 'What one change would improve dining?',        'text');

INSERT INTO Participant (participant_id, name, email) VALUES
    (1, 'Alex Rivera',  'alex@example.com'),
    (2, 'Jordan Lee',   'jordan@example.com'),
    (3, 'Sam Patel',    'sam@example.com'),
    (4, 'Casey Morgan', 'casey@example.com'),
    (5, 'Riley Chen',   'riley@example.com');

INSERT INTO sent_survey (survey_id, participant_id, sent_at) VALUES
    (1, 1, '2026-10-01 09:00'),
    (1, 2, '2026-10-01 09:00'),
    (1, 3, '2026-10-01 09:00'),
    (1, 4, '2026-10-01 09:00'),
    (2, 2, '2026-10-05 12:00'),
    (2, 3, '2026-10-05 12:00'),
    (2, 5, '2026-10-05 12:00');

INSERT INTO Response (response_id, question_id, participant_id, response, ai_generated, submitted_at) VALUES
    (1,  1, 1, '12',                                   0, '2026-10-01 10:15'),
    (2,  2, 1, 'Working part-time leaves little time.', 0, '2026-10-01 10:16'),
    (3,  3, 1, 'yes',                                  0, '2026-10-01 10:16'),
    (4,  1, 2, '8',                                    0, '2026-10-02 18:40'),
    (5,  2, 2, 'Time management is a significant challenge that affects many students in various ways.', 1, '2026-10-02 18:41'),
    (6,  3, 2, 'no',                                   0, '2026-10-02 18:41'),
    (7,  1, 3, '20',                                   0, '2026-10-03 08:05'),
    (8,  2, 3, 'Phone notifications.',                 0, '2026-10-03 08:06'),
    (9,  4, 2, '4',                                    0, '2026-10-05 13:00'),
    (10, 5, 2, 'Longer weekend hours.',                0, '2026-10-05 13:01'),
    (11, 4, 5, '2',                                    0, '2026-10-06 11:30'),
    (12, 5, 5, 'Enhancing menu diversity would provide a more inclusive and satisfying dining experience.', 1, '2026-10-06 11:31');
