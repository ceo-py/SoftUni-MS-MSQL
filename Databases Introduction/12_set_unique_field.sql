ALTER TABLE Users DROP CONSTRAINT PK__Users__77222459872DB97A;

ALTER TABLE Users ADD CONSTRAINT UK_Username UNIQUE (Username)
WITH (IGNORE_DUP_KEY = OFF);

ALTER TABLE Users ADD CONSTRAINT CK_Username_Length CHECK (LEN(Username) >= 3);

ALTER TABLE Users ADD PRIMARY KEY (Id);
