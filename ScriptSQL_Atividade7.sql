
CREATE TABLE dim_disciplina (
                Id_disciplina BIGINT NOT NULL,
                Descricao VARCHAR NOT NULL,
                CONSTRAINT Id_disciplina PRIMARY KEY (Id_disciplina)
);


CREATE TABLE dim_aluno (
                Id_aluno BIGINT NOT NULL,
                Nome VARCHAR NOT NULL,
                Idade INTEGER NOT NULL,
                CONSTRAINT Id_aluno PRIMARY KEY (Id_aluno)
);


CREATE TABLE dim_curso (
                Id_curso BIGINT NOT NULL,
                Descricao VARCHAR NOT NULL,
                CONSTRAINT Id_curso PRIMARY KEY (Id_curso)
);


CREATE TABLE dim_tempo (
                Id_tempo BIGINT NOT NULL,
                Semestre VARCHAR NOT NULL,
                Ano INTEGER NOT NULL,
                CONSTRAINT Id_tempo PRIMARY KEY (Id_tempo)
);


CREATE TABLE fato_aulas (
                Id_curso BIGINT NOT NULL,
                Id_tempo BIGINT NOT NULL,
                Id_disciplina BIGINT NOT NULL,
                Id_aluno BIGINT NOT NULL,
                Quant_reprovados INTEGER NOT NULL,
                Quant_aluno_curso INTEGER NOT NULL,
                Quant_disc_curso INTEGER NOT NULL,
                Quant_aprovados INTEGER NOT NULL,
                CONSTRAINT Id_curso PRIMARY KEY (Id_curso, Id_tempo, Id_disciplina, Id_aluno)
);


ALTER TABLE fato_aulas ADD CONSTRAINT dim_disciplina_fato_aulas_fk
FOREIGN KEY (Id_disciplina)
REFERENCES dim_disciplina (Id_disciplina)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE fato_aulas ADD CONSTRAINT dim_aluno_fato_aulas_fk
FOREIGN KEY (Id_aluno)
REFERENCES dim_aluno (Id_aluno)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE fato_aulas ADD CONSTRAINT dim_curso_fato_aulas_fk
FOREIGN KEY (Id_curso)
REFERENCES dim_curso (Id_curso)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE fato_aulas ADD CONSTRAINT dim_tempo_fato_aulas_fk
FOREIGN KEY (Id_tempo)
REFERENCES dim_tempo (Id_tempo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
