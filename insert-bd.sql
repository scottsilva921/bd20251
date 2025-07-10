/* Lógico_2: */
drop table Prof_Materia;
drop table Aluno_Curso;
drop table Materia_Curso;
drop table Aluno_Materia;
drop table Materia;
drop table Curso;
drop table Professor;
drop table Aluno;
drop table Pessoa;

CREATE table Pessoa (
    id_pessoa SERIAL PRIMARY key not NULL,
    nome VARCHAR(255) not null,
    cpf VARCHAR(15) not null unique,
    email VARCHAR(255) not null unique,
    login VARCHAR(255) not null unique,
    telefone VARCHAR(20) not null unique,
    senha VARCHAR(255) not null
);

insert into Pessoa(nome, cpf, email, login, telefone, senha) values('Lucas Mendes', '10123456789', 'lucas.mendes@email.com', 'lucasm', '11987654321', 'lucas123');
insert into Pessoa(nome, cpf, email, login, telefone, senha) values('Beatriz Silva', '10234567890', 'beatriz.silva@email.com', 'beasilva', '11912345678', 'bea456');
insert into Pessoa(nome, cpf, email, login, telefone, senha) values('João Oliveira', '10345678901', 'joao.oliveira@email.com', 'joaooli', '11998761234', 'joao789');
insert into Pessoa(nome, cpf, email, login, telefone, senha) values('Camila Ramos', '10456789012', 'camila.ramos@email.com', 'camilar', '11987612345', 'cami321');
insert into Pessoa(nome, cpf, email, login, telefone, senha) values('Rafael Costa', '10567890123', 'rafael.costa@email.com', 'rafac', '11976543210', 'rafa654');

CREATE table Materia (
    id_materia SERIAL PRIMARY key not NULL,
    nome VARCHAR(255) not null,
    data_inicio DATE not NULL,
    data_fim DATE not NULL
);

insert into Materia(nome, data_inicio, data_fim) values('Estrutura de Dados', '2025-02-01', '2025-06-15');
insert into Materia(nome, data_inicio, data_fim) values('TGA', '2025-03-01', '2025-07-10');
insert into Materia(nome, data_inicio, data_fim) values('Introducao a Desenho', '2025-01-15', '2025-05-30');
insert into Materia(nome, data_inicio, data_fim) values('Malhar 2', '2025-04-01', '2025-08-01');
insert into Materia(nome, data_inicio, data_fim) values('Confeccao de palhas', '2025-02-20', '2025-06-30');

CREATE TABLE Curso (
    id_curso SERIAL PRIMARY key not NULL,
    nome VARCHAR(255) not NULL,
    carga_horaria INTEGER not NULL
);

insert into Curso(nome, carga_horaria) values('Engenharia de Software', 400);
insert into Curso(nome, carga_horaria) values('Administração', 360);
insert into Curso(nome, carga_horaria) values('Design Gráfico', 300);
insert into Curso(nome, carga_horaria) values('Educação Física', 280);
insert into Curso(nome, carga_horaria) values('Gastronomia', 250);

CREATE TABLE Professor (
    fk_Pessoa_id_pessoa INTEGER not NULL,
    foreign key(fk_Pessoa_id_pessoa)
    references Pessoa(id_pessoa)
);

insert into professor(fk_Pessoa_id_pessoa) values(1);

CREATE table Aluno (
    periodo INTEGER not NULL,
    fk_Pessoa_id_pessoa INTEGER not NULL,
    foreign key(fk_Pessoa_id_pessoa)
    references Pessoa(id_pessoa)
);

insert into Aluno(fk_Pessoa_id_pessoa, periodo) values(2, 2);
insert into Aluno(fk_Pessoa_id_pessoa, periodo) values(3, 3);
insert into Aluno(fk_Pessoa_id_pessoa, periodo) values(4, 2);
insert into Aluno(fk_Pessoa_id_pessoa, periodo) values(5, 4);

CREATE TABLE Prof_Materia (
	id_prof_materia SERIAL PRIMARY key not NULL,
    fk_Professor_id_pessoa INTEGER not NULL,
    fk_Materia_id_materia INTEGER not NULL,
    foreign key(fk_Professor_id_pessoa)
    references Pessoa(id_pessoa),
    foreign key(fk_Materia_id_materia)
    references Materia(id_materia)
 	
);

insert into Prof_Materia(fk_Professor_id_pessoa, fk_Materia_id_materia) values(1, 1);
insert into Prof_Materia(fk_Professor_id_pessoa, fk_Materia_id_materia) values(1, 2);
insert into Prof_Materia(fk_Professor_id_pessoa, fk_Materia_id_materia) values(1, 3);
insert into Prof_Materia(fk_Professor_id_pessoa, fk_Materia_id_materia) values(1, 4);
insert into Prof_Materia(fk_Professor_id_pessoa, fk_Materia_id_materia) values(1, 5);

CREATE TABLE Aluno_Curso (
    fk_Aluno_id_pessoa INTEGER not NULL,
    fk_Curso_id_curso INTEGER not NULL,
    data_matricula DATE not NULL,
    id_aluno_curso SERIAL PRIMARY key not NULL,
    foreign key(fk_Aluno_id_pessoa)
    references Pessoa(id_pessoa),
    foreign key(fk_Curso_id_curso)
    references Curso(id_curso)
);

insert into Aluno_Curso(fk_Aluno_id_pessoa, fk_Curso_id_curso, data_matricula) values(2, 1, '2025-02-01');
insert into Aluno_Curso(fk_Aluno_id_pessoa, fk_Curso_id_curso, data_matricula) values(3, 2, '2025-02-01');
insert into Aluno_Curso(fk_Aluno_id_pessoa, fk_Curso_id_curso, data_matricula) values(4, 3, '2025-02-01');
insert into Aluno_Curso(fk_Aluno_id_pessoa, fk_Curso_id_curso, data_matricula) values(5, 4, '2025-02-01');

CREATE TABLE Materia_Curso (
	id_materia_cruso SERIAL PRIMARY key not NULL,
    fk_Materia_id_materia INTEGER not NULL,
    fk_Curso_id_curso INTEGER not NULL,
    periodo INTEGER not NULL,
    foreign key(fk_Materia_id_materia)
    references Materia(id_materia),
    foreign key(fk_Curso_id_curso)
    references Curso(id_curso)
);

insert into Materia_Curso(fk_Materia_id_materia, fk_Curso_id_curso, periodo) values(1, 1, 1);
insert into Materia_Curso(fk_Materia_id_materia, fk_Curso_id_curso, periodo) values(2, 2, 1);
insert into Materia_Curso(fk_Materia_id_materia, fk_Curso_id_curso, periodo) values(3, 3, 1);
insert into Materia_Curso(fk_Materia_id_materia, fk_Curso_id_curso, periodo) values(4, 4, 1);
insert into Materia_Curso(fk_Materia_id_materia, fk_Curso_id_curso, periodo) values(5, 5, 1);

CREATE TABLE Aluno_Materia (
	id_aluno_materia SERIAL PRIMARY key not NULL,
    fk_Materia_id_materia INTEGER not NULL,
    fk_Aluno_id_pessoa INTEGER not NULL,
    nota DOUBLE PRECISION not NULL,
    frequencia DOUBLE PRECISION not NULL,
    foreign key(fk_Materia_id_materia)
    references Materia(id_materia),
    foreign key(fk_Aluno_id_pessoa)
    references Pessoa(id_pessoa)
);

insert into Aluno_Materia(fk_Materia_id_materia, fk_Aluno_id_pessoa, nota, frequencia) values(1, 2, 100, 75);
insert into Aluno_Materia(fk_Materia_id_materia, fk_Aluno_id_pessoa, nota, frequencia) values(2, 3, 70, 80);
insert into Aluno_Materia(fk_Materia_id_materia, fk_Aluno_id_pessoa, nota, frequencia) values(3, 4, 60, 60);
insert into Aluno_Materia(fk_Materia_id_materia, fk_Aluno_id_pessoa, nota, frequencia) values(4, 5, 40, 50);
 
