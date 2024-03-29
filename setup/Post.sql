CREATE TABLE "Post" (
    post_id        SERIAL
        CONSTRAINT post_pk
            PRIMARY KEY,
    p_text         TEXT        DEFAULT 'Insert Post Here'::TEXT NOT NULL,
    p_type         VARCHAR(10) DEFAULT 'text'::VARCHAR NOT NULL,
    time           TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    upvote         INTEGER     DEFAULT 0                        NOT NULL,
    poster_id      INTEGER                                    NOT NULL
        CONSTRAINT post_user_user_id_fk
            REFERENCES "User"
            ON UPDATE CASCADE ON DELETE CASCADE,
    parent_post_id INTEGER
        CONSTRAINT post_post_post_id_fk
            REFERENCES "Post"
            ON UPDATE CASCADE ON DELETE CASCADE,
    subject_id     INTEGER
        CONSTRAINT post_subject_subject_id_fk
            REFERENCES "Subject"
            ON UPDATE CASCADE ON DELETE SET NULL,
    group_id       INTEGER
        CONSTRAINT post_group_group_id_fk
            REFERENCES "Group"
            ON UPDATE CASCADE ON DELETE CASCADE
);

COMMENT ON COLUMN "Post".parent_post_id IS 'if parent post id null, then this is the root post';

COMMENT ON COLUMN "Post".subject_id IS 'if null, then general subject';

CREATE UNIQUE INDEX post_post_id_uindex
    ON "Post" (post_id);

-- CREATE UNIQUE INDEX post_text_uindex
--     ON "Post" (p_text);

