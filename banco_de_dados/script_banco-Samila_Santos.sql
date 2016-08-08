
CREATE TABLE public.Empresa (
                cnpj_empresa VARCHAR NOT NULL,
                nome VARCHAR NOT NULL,
                endereco VARCHAR NOT NULL,
                telefone VARCHAR NOT NULL,
                CONSTRAINT cod_empresa PRIMARY KEY (cnpj_empresa)
);


CREATE TABLE public.Onibus (
                num_onibus INTEGER NOT NULL,
                Empresa_cnpj_empresa VARCHAR NOT NULL,
                poltronas INTEGER NOT NULL,
                trajeto VARCHAR NOT NULL,
                cobrador VARCHAR NOT NULL,
                num_estacionamento INTEGER NOT NULL,
                CONSTRAINT num_onibus PRIMARY KEY (num_onibus, Empresa_cnpj_empresa)
);


CREATE TABLE public.Terminal_Rodoviario (
                cod_rodoviaria BIGINT NOT NULL,
                num_onibus INTEGER NOT NULL,
                Empresa_cnpj_empresa VARCHAR NOT NULL,
                nome VARCHAR NOT NULL,
                endereco VARCHAR NOT NULL,
                telefone VARCHAR NOT NULL,
                CONSTRAINT cod_rodoviaria PRIMARY KEY (cod_rodoviaria, num_onibus, Empresa_cnpj_empresa)
);


CREATE TABLE public.Ponto_De_Venda (
                cod_ponto_de_venda BIGINT NOT NULL,
                cod_rodoviaria BIGINT NOT NULL,
                num_onibus INTEGER NOT NULL,
                Empresa_cnpj_empresa VARCHAR NOT NULL,
                localizacao VARCHAR NOT NULL,
                CONSTRAINT cod_ponto_de_venda PRIMARY KEY (cod_ponto_de_venda, cod_rodoviaria, num_onibus, Empresa_cnpj_empresa)
);


CREATE TABLE public.Funcionario (
                matricula BIGINT NOT NULL,
                cod_ponto_de_venda BIGINT NOT NULL,
                nome VARCHAR NOT NULL,
                endereco VARCHAR NOT NULL,
                funcao VARCHAR NOT NULL,
                telefone VARCHAR NOT NULL,
                email VARCHAR NOT NULL,
                data_nascimento VARCHAR NOT NULL,
                CONSTRAINT matricula PRIMARY KEY (matricula, cod_ponto_de_venda)
);


CREATE TABLE public.Cliente (
                cpf VARCHAR NOT NULL,
                nome VARCHAR NOT NULL,
                data_nascimento INTEGER NOT NULL,
                email VARCHAR NOT NULL,
                telefone VARCHAR NOT NULL,
                CONSTRAINT cpf PRIMARY KEY (cpf)
);


CREATE TABLE public.Bagagem (
                num_bagagem BIGINT NOT NULL,
                cpf VARCHAR NOT NULL,
                proprietario VARCHAR NOT NULL,
                peso VARCHAR NOT NULL,
                CONSTRAINT num_bagagem PRIMARY KEY (num_bagagem, cpf)
);


CREATE TABLE public.ticket (
                cod_ticket BIGINT NOT NULL,
                cpf VARCHAR NOT NULL,
                cod_ponto_de_venda BIGINT NOT NULL,
                num_onibus INTEGER NOT NULL,
                Empresa_cnpj_empresa VARCHAR NOT NULL,
                origem VARCHAR NOT NULL,
                destino VARCHAR NOT NULL,
                preco REAL NOT NULL,
                poltrona INTEGER NOT NULL,
                CONSTRAINT cod_ticket PRIMARY KEY (cod_ticket, cpf, cod_ponto_de_venda, num_onibus, Empresa_cnpj_empresa)
);


ALTER TABLE public.Onibus ADD CONSTRAINT possui
FOREIGN KEY (Empresa_cnpj_empresa)
REFERENCES public.Empresa (cnpj_empresa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Terminal_Rodoviario ADD CONSTRAINT para
FOREIGN KEY (num_onibus, Empresa_cnpj_empresa)
REFERENCES public.Onibus (num_onibus, Empresa_cnpj_empresa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ticket ADD CONSTRAINT possui
FOREIGN KEY (num_onibus, Empresa_cnpj_empresa)
REFERENCES public.Onibus (num_onibus, Empresa_cnpj_empresa)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Ponto_De_Venda ADD CONSTRAINT possui
FOREIGN KEY (Empresa_cnpj_empresa, cod_rodoviaria, num_onibus)
REFERENCES public.Terminal_Rodoviario (Empresa_cnpj_empresa, cod_rodoviaria, num_onibus)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ticket ADD CONSTRAINT vende
FOREIGN KEY (cod_ponto_de_venda)
REFERENCES public.Ponto_De_Venda (cod_ponto_de_venda)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Funcionario ADD CONSTRAINT possui
FOREIGN KEY (cod_ponto_de_venda)
REFERENCES public.Ponto_De_Venda (cod_ponto_de_venda)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.ticket ADD CONSTRAINT adquire
FOREIGN KEY (cpf)
REFERENCES public.Cliente (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Bagagem ADD CONSTRAINT possui
FOREIGN KEY (cpf)
REFERENCES public.Cliente (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
