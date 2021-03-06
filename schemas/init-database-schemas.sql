USE $(DATABASE_NAME)
GO

CREATE TABLE [dbo].[Hoteis] ([Codigo] UNIQUEIDENTIFIER NOT NULL, [Nome] NVARCHAR(100) NOT NULL, [Estrelas] SMALLINT NOT NULL, [Classificacao] NVARCHAR(7) NOT NULL, [Rua] NVARCHAR(100) NOT NULL, [Bairro] NVARCHAR(100) NOT NULL, [Cidade] NVARCHAR(100) NOT NULL, [Cep] INT NOT NULL, [Telefone] NVARCHAR(20) NOT NULL, [Email] NVARCHAR(100) NOT NULL, CONSTRAINT [PK_Hoteis] PRIMARY KEY ([Codigo]))
GO

CREATE TABLE [dbo].[Quartos] ([Codigo] UNIQUEIDENTIFIER NOT NULL, [CodigoHotel] UNIQUEIDENTIFIER NOT NULL, [Nome] NVARCHAR(100) NOT NULL, [Descricao] NVARCHAR(MAX) NOT NULL, [Capacidade] INT NOT NULL, [QuantidadeDisponicel] INT NOT NULL, [PrecoPorNoite] DECIMAL(18,2) NOT NULL, CONSTRAINT [PK_Quartos] PRIMARY KEY ([Codigo]))
GO

ALTER TABLE [dbo].[Quartos] ADD CONSTRAINT [FK_Quarto_Hotel] FOREIGN KEY ([CodigoHotel]) REFERENCES [dbo].[Hoteis] ([Codigo])
GO