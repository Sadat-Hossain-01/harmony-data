CREATE TABLE "TagFallsUnder" (
    tag_id     INTEGER NOT NULL
        CONSTRAINT tagfallsunder_tag_tag_id_fk
            REFERENCES "Tag"
            ON UPDATE CASCADE ON DELETE CASCADE,
    subject_id INTEGER NOT NULL
        CONSTRAINT tagfallsunder_subject_subject_id_fk
            REFERENCES "Subject"
            ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT tagfallsunder_pk
        PRIMARY KEY (tag_id, subject_id),
    CONSTRAINT tagfallsunder_pk_2
        UNIQUE (tag_id, subject_id)
);

COMMENT ON TABLE "TagFallsUnder" IS 'many-to-many relation between Tag and Subject';

ALTER TABLE "TagFallsUnder"
    OWNER TO postgres;

