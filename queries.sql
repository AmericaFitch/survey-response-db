-- Example questions the database can answer.

-- 1. Response rate: how many people each survey was sent to, and how many answered.
SELECT s.survey_name,
       COUNT(DISTINCT ss.participant_id) AS sent_to,
       COUNT(DISTINCT r.participant_id)  AS responded,
       ROUND(100.0 * COUNT(DISTINCT r.participant_id)
                   / COUNT(DISTINCT ss.participant_id), 0) AS response_rate_pct
FROM Survey s
JOIN sent_survey ss ON ss.survey_id = s.survey_id
LEFT JOIN Survey_details q ON q.survey_id = s.survey_id
LEFT JOIN Response r ON r.question_id = q.question_id
                    AND r.participant_id = ss.participant_id
GROUP BY s.survey_id
ORDER BY s.survey_id;

-- 2. Share of answers flagged as AI-generated, per survey.
SELECT s.survey_name,
       COUNT(*)            AS answers,
       SUM(r.ai_generated) AS ai_flagged,
       ROUND(100.0 * SUM(r.ai_generated) / COUNT(*), 0) AS ai_pct
FROM Response r
JOIN Survey_details q ON q.question_id = r.question_id
JOIN Survey s         ON s.survey_id   = q.survey_id
GROUP BY s.survey_id
ORDER BY s.survey_id;

-- 3. Who hasn't responded yet (for sending reminders).
SELECT s.survey_name, p.name, p.email
FROM sent_survey ss
JOIN Survey s      ON s.survey_id      = ss.survey_id
JOIN Participant p ON p.participant_id = ss.participant_id
WHERE NOT EXISTS (
    SELECT 1
    FROM Response r
    JOIN Survey_details q ON q.question_id = r.question_id
    WHERE q.survey_id = ss.survey_id
      AND r.participant_id = ss.participant_id
)
ORDER BY s.survey_name, p.name;

-- 4. Average of a numeric question.
SELECT q.question_text,
       ROUND(AVG(CAST(r.response AS REAL)), 1) AS average,
       COUNT(*) AS answers
FROM Response r
JOIN Survey_details q ON q.question_id = r.question_id
WHERE q.question_type IN ('number', 'rating')
GROUP BY q.question_id;
