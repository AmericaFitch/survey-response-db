CREATE TABLE Participant (
    participant_id INTEGER,
    name           TEXT,
    email          TEXT,
    PRIMARY KEY (
        participant_id
    )
);

CREATE TABLE User (
    user_name TEXT NOT NULL,
    PRIMARY KEY (
        user_name
    )
);

CREATE TABLE Survey (
    user_name   TEXT    NOT NULL,
    survey_id   INTEGER NOT NULL,
    survey_name TEXT,
    PRIMARY KEY (
        survey_id
    ),
    FOREIGN KEY (
        user_name
    )
    REFERENCES User (user_name) 
);

CREATE TABLE Survey_details (
    question_id   INTEGER,
    survey_id     INTEGER NOT NULL,
    question_text TEXT,
    question_type TEXT,
    PRIMARY KEY (
        question_id
    ),
    FOREIGN KEY (
        survey_id
    )
    REFERENCES Survey (survey_id) 
);

CREATE TABLE sent_survey (
    survey_id      INTEGER  NOT NULL,
    participant_id INTEGER  NOT NULL,
    sent_at        DATETIME,
    PRIMARY KEY (
        survey_id,
        participant_id
    ),
    FOREIGN KEY (
        survey_id
    )
    REFERENCES Survey (survey_id),
    FOREIGN KEY (
        participant_id
    )
    REFERENCES Participant (participant_id) 
);

CREATE TABLE Response (
    response_id    INTEGER,
    question_id    INTEGER  NOT NULL,
    participant_id INTEGER  NOT NULL,
    response       TEXT,
    ai_generated   INTEGER  NOT NULL
                            DEFAULT 0
                            CHECK (ai_generated IN (0, 1) ),
    submitted_at   DATETIME,
    PRIMARY KEY (
        response_id
    ),
    FOREIGN KEY (
        question_id
    )
    REFERENCES survey_details (question_id),
    FOREIGN KEY (
        participant_id
    )
    REFERENCES Participant (participant_id) 
);
