CREATE TABLE "Poll" (
    poll_id     SERIAL
        CONSTRAINT poll_pk
            PRIMARY KEY,
    poll_title  VARCHAR(40) DEFAULT 'Poll'::CHARACTER VARYING NOT NULL,
    group_id    INTEGER                                       NOT NULL
        CONSTRAINT poll_group_group_id_fk
            REFERENCES "Group"
            ON UPDATE CASCADE ON DELETE CASCADE,
    poll_opened TIMESTAMP   DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE "Poll"
    OWNER TO postgres;

CREATE UNIQUE INDEX poll_poll_id_uindex
    ON "Poll" (poll_id);

