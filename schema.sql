

PRAGMA foreign_keys = ON;

-- CLIENTS TABLE
CREATE TABLE IF NOT EXISTS clients (
    client_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_initial TEXT NOT NULL,
    age_group TEXT NOT NULL CHECK (
        age_group IN ('Teen', 'Adult')
    ),
    enrollment_date TEXT NOT NULL,
    status TEXT NOT NULL DEFAULT 'Active' CHECK (
        status IN ('Active', 'Inactive')
    )
);

-- APPOINTMENTS TABLE
CREATE TABLE IF NOT EXISTS appointments (
    appointment_id INTEGER PRIMARY KEY AUTOINCREMENT,
    client_id INTEGER NOT NULL,
    appointment_date TEXT NOT NULL,
    appointment_time TEXT NOT NULL,
    session_type TEXT NOT NULL CHECK (
        session_type IN ('Virtual', 'In-Person')
    ),
    attendance_status TEXT NOT NULL DEFAULT 'Scheduled' CHECK (
        attendance_status IN ('Scheduled', 'Completed', 'Cancelled', 'No-Show')
    ),
    FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

-- ACTIVITIES TABLE
CREATE TABLE IF NOT EXISTS activities (
    activity_id INTEGER PRIMARY KEY AUTOINCREMENT,
    activity_name TEXT NOT NULL,
    communication_area TEXT NOT NULL CHECK (
        communication_area IN (
            'Social Communication',
            'Conversational Confidence',
            'Workplace Communication',
            'Pronunciation and Articulation',
            'Language Comprehension and Vocabulary',
            'Self-Advocacy'
        )
    ),
    difficulty_level TEXT NOT NULL CHECK (
        difficulty_level IN ('Beginner', 'Intermediate', 'Advanced')
    ),
    activity_type TEXT NOT NULL,
    description TEXT NOT NULL,
    is_active INTEGER NOT NULL DEFAULT 1 CHECK (is_active IN (0, 1))
);

-- LESSON PLANS TABLE
CREATE TABLE IF NOT EXISTS lesson_plans (
    lesson_plan_id INTEGER PRIMARY KEY AUTOINCREMENT,
    client_id INTEGER NOT NULL,
    activity_id INTEGER NOT NULL,
    assigned_date TEXT NOT NULL,
    due_date TEXT,
    completion_status TEXT NOT NULL DEFAULT 'Assigned' CHECK (
        completion_status IN ('Assigned', 'In Progress', 'Completed')
    ),
    clinician_notes TEXT,
    FOREIGN KEY (client_id) REFERENCES clients(client_id),
    FOREIGN KEY (activity_id) REFERENCES activities(activity_id)
);

-- CHANGE REQUESTS TABLE
CREATE TABLE IF NOT EXISTS change_requests (
    request_id INTEGER PRIMARY KEY AUTOINCREMENT,
    table_name TEXT NOT NULL,
    record_id INTEGER NOT NULL,
    field_name TEXT NOT NULL,
    requested_value TEXT NOT NULL,
    reason TEXT NOT NULL,
    request_status TEXT NOT NULL DEFAULT 'Pending' CHECK (
        request_status IN ('Pending', 'Approved', 'Rejected')
    ),
    submitted_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    reviewed_at TEXT,
    reviewed_by TEXT
);

-- SAMPLE CLIENTS
INSERT OR IGNORE INTO clients
(client_id, first_name, last_initial, age_group, enrollment_date, status)
VALUES
(1, 'Jordan', 'M', 'Teen', '2026-08-15', 'Active'),
(2, 'Taylor', 'R', 'Adult', '2026-09-03', 'Active'),
(3, 'Alex', 'B', 'Teen', '2026-09-22', 'Active'),
(4, 'Morgan', 'S', 'Adult', '2026-10-07', 'Active'),
(5, 'Casey', 'L', 'Adult', '2026-10-28', 'Inactive');

-- SAMPLE APPOINTMENTS
INSERT OR IGNORE INTO appointments
(appointment_id, client_id, appointment_date, appointment_time, session_type, attendance_status)
VALUES
(1, 1, '2026-10-12', '10:00', 'Virtual', 'Completed'),
(2, 2, '2026-11-05', '11:00', 'Virtual', 'Completed'),
(3, 3, '2026-11-18', '13:00', 'In-Person', 'No-Show'),
(4, 4, '2026-11-23', '14:00', 'Virtual', 'Scheduled'),
(5, 5, '2026-11-27', '15:00', 'In-Person', 'Cancelled');

-- SAMPLE ACTIVITIES
-- Six communication areas with three difficulty levels each
INSERT OR IGNORE INTO activities
(activity_id, activity_name, communication_area, difficulty_level, activity_type, description, is_active)
VALUES
(1, 'Recognizing Social Cues', 'Social Communication', 'Beginner', 'Scenario Practice', 'Identify common social cues in everyday conversations.', 1),
(2, 'Responding to Awkward Situations', 'Social Communication', 'Intermediate', 'Roleplay', 'Practice responding when a social interaction feels awkward.', 1),
(3, 'Navigating Complex Social Situations', 'Social Communication', 'Advanced', 'Scenario Practice', 'Explore strategies for handling complicated social interactions.', 1),

(4, 'Starting a Conversation', 'Conversational Confidence', 'Beginner', 'Guided Practice', 'Practice opening a conversation with another person.', 1),
(5, 'Keeping a Conversation Going', 'Conversational Confidence', 'Intermediate', 'Roleplay', 'Practice follow-up questions and active listening.', 1),
(6, 'Handling Challenging Discussions', 'Conversational Confidence', 'Advanced', 'Scenario Practice', 'Practice navigating difficult or unexpected discussions.', 1),

(7, 'Professional Introductions', 'Workplace Communication', 'Beginner', 'Guided Practice', 'Practice introducing yourself in a professional setting.', 1),
(8, 'Communicating with Coworkers', 'Workplace Communication', 'Intermediate', 'Roleplay', 'Practice clear and respectful workplace communication.', 1),
(9, 'Handling Workplace Conflict', 'Workplace Communication', 'Advanced', 'Scenario Practice', 'Practice communicating through professional disagreements.', 1),

(10, 'Basic Sound Practice', 'Pronunciation and Articulation', 'Beginner', 'Speaking Exercise', 'Practice selected sounds through guided prompts.', 1),
(11, 'Pronunciation in Sentences', 'Pronunciation and Articulation', 'Intermediate', 'Speaking Exercise', 'Practice clear pronunciation in complete sentences.', 1),
(12, 'Speaking Clearly in Longer Conversations', 'Pronunciation and Articulation', 'Advanced', 'Speaking Exercise', 'Practice maintaining clear speech in longer speaking activities.', 1),

(13, 'Understanding Common Words', 'Language Comprehension and Vocabulary', 'Beginner', 'Vocabulary Exercise', 'Practice identifying the meaning of common words.', 1),
(14, 'Using Context Clues', 'Language Comprehension and Vocabulary', 'Intermediate', 'Vocabulary Exercise', 'Use surrounding information to understand unfamiliar words.', 1),
(15, 'Understanding Complex Language', 'Language Comprehension and Vocabulary', 'Advanced', 'Comprehension Exercise', 'Practice interpreting more complex language and context.', 1),

(16, 'Expressing Preferences', 'Self-Advocacy', 'Beginner', 'Guided Practice', 'Practice communicating personal preferences.', 1),
(17, 'Asking for Clarification', 'Self-Advocacy', 'Intermediate', 'Roleplay', 'Practice asking questions when instructions are unclear.', 1),
(18, 'Communicating Boundaries and Needs', 'Self-Advocacy', 'Advanced', 'Scenario Practice', 'Practice expressing boundaries and needs in different situations.', 1);

-- SAMPLE LESSON PLANS
INSERT OR IGNORE INTO lesson_plans
(lesson_plan_id, client_id, activity_id, assigned_date, due_date, completion_status, clinician_notes)
VALUES
(1, 1, 1, '2026-10-15', '2026-10-22', 'Completed', 'Practice identifying social cues.'),
(2, 2, 5, '2026-11-10', '2026-11-24', 'In Progress', 'Practice asking follow-up questions.'),
(3, 3, 7, '2026-11-17', '2026-11-30', 'Assigned', 'Review professional introductions.'),
(4, 4, 11, '2026-11-19', '2026-12-03', 'Assigned', 'Complete the guided speaking exercise.'),
(5, 5, 14, '2026-11-20', '2026-12-04', 'Assigned', 'Review vocabulary in context.');
