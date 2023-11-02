USE [TestDB]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 02-11-2023 13:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryId] [int] NOT NULL,
	[CountryName] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[countryState]    Script Date: 02-11-2023 13:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[countryState](
	[StateId] [int] NOT NULL,
	[CountryId] [int] NULL,
	[StateName] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 02-11-2023 13:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[City] [varchar](100) NULL,
	[Address] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginDetails]    Script Date: 02-11-2023 13:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NULL,
	[Password] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegisterDetails]    Script Date: 02-11-2023 13:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegisterDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NULL,
	[Password] [varchar](100) NULL,
	[ConfirmPassword] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stateCity]    Script Date: 02-11-2023 13:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stateCity](
	[CityId] [int] NULL,
	[StateId] [int] NULL,
	[CityName] [varchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 02-11-2023 13:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[RetypeEmail] [varchar](100) NULL,
	[Phone] [varchar](100) NULL,
	[Country] [varchar](100) NULL,
	[State] [varchar](100) NULL,
	[City] [varchar](100) NULL,
	[Gender] [varchar](100) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (101, N'India')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (102, N'USA')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (103, N'Pakistan')
GO
INSERT [dbo].[countryState] ([StateId], [CountryId], [StateName]) VALUES (1001, 101, N'U.P')
INSERT [dbo].[countryState] ([StateId], [CountryId], [StateName]) VALUES (1002, 101, N'Kerala')
INSERT [dbo].[countryState] ([StateId], [CountryId], [StateName]) VALUES (1003, 101, N'Kasmir')
INSERT [dbo].[countryState] ([StateId], [CountryId], [StateName]) VALUES (2001, 102, N'Colorado')
INSERT [dbo].[countryState] ([StateId], [CountryId], [StateName]) VALUES (2002, 102, N'Delaware')
INSERT [dbo].[countryState] ([StateId], [CountryId], [StateName]) VALUES (2003, 102, N'Georgia')
INSERT [dbo].[countryState] ([StateId], [CountryId], [StateName]) VALUES (3001, 103, N'Punjap')
INSERT [dbo].[countryState] ([StateId], [CountryId], [StateName]) VALUES (3002, 103, N'Baluchistan')
INSERT [dbo].[countryState] ([StateId], [CountryId], [StateName]) VALUES (3003, 103, N'Sind')
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([id], [Name], [City], [Address]) VALUES (1, N'supra', N'chennai', N'shollinganalur')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[LoginDetails] ON 

INSERT [dbo].[LoginDetails] ([id], [UserName], [Password]) VALUES (1, N'Vijay', N'V1234')
INSERT [dbo].[LoginDetails] ([id], [UserName], [Password]) VALUES (2, N'Varshu', N'12345')
INSERT [dbo].[LoginDetails] ([id], [UserName], [Password]) VALUES (3, N'supra', N'supra23')
SET IDENTITY_INSERT [dbo].[LoginDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[RegisterDetails] ON 

INSERT [dbo].[RegisterDetails] ([id], [UserName], [Password], [ConfirmPassword]) VALUES (1, N'Vijay', N'V1234', N'V1234')
INSERT [dbo].[RegisterDetails] ([id], [UserName], [Password], [ConfirmPassword]) VALUES (2, N'Varshu', N'12345', N'12345')
INSERT [dbo].[RegisterDetails] ([id], [UserName], [Password], [ConfirmPassword]) VALUES (3, N'supra', N'supra23', N'supra23')
SET IDENTITY_INSERT [dbo].[RegisterDetails] OFF
GO
INSERT [dbo].[stateCity] ([CityId], [StateId], [CityName]) VALUES (11, 1001, N'Kanpur')
INSERT [dbo].[stateCity] ([CityId], [StateId], [CityName]) VALUES (12, 1001, N'Dg')
INSERT [dbo].[stateCity] ([CityId], [StateId], [CityName]) VALUES (21, 1002, N'Pal')
INSERT [dbo].[stateCity] ([CityId], [StateId], [CityName]) VALUES (22, 1002, N'Tri')
INSERT [dbo].[stateCity] ([CityId], [StateId], [CityName]) VALUES (31, 1003, N'Jammu')
INSERT [dbo].[stateCity] ([CityId], [StateId], [CityName]) VALUES (32, 1003, N'Manali')
INSERT [dbo].[stateCity] ([CityId], [StateId], [CityName]) VALUES (41, 2001, N'Alabama')
INSERT [dbo].[stateCity] ([CityId], [StateId], [CityName]) VALUES (42, 2001, N'Arizona')
INSERT [dbo].[stateCity] ([CityId], [StateId], [CityName]) VALUES (51, 2002, N'Bellefonte')
INSERT [dbo].[stateCity] ([CityId], [StateId], [CityName]) VALUES (52, 2002, N'Felton')
INSERT [dbo].[stateCity] ([CityId], [StateId], [CityName]) VALUES (61, 2003, N'Rustavi')
INSERT [dbo].[stateCity] ([CityId], [StateId], [CityName]) VALUES (62, 2003, N'Kobulati')
INSERT [dbo].[stateCity] ([CityId], [StateId], [CityName]) VALUES (71, 3001, N'Lahore')
INSERT [dbo].[stateCity] ([CityId], [StateId], [CityName]) VALUES (72, 3001, N'Faisalabad')
INSERT [dbo].[stateCity] ([CityId], [StateId], [CityName]) VALUES (81, 3002, N'Quetta')
INSERT [dbo].[stateCity] ([CityId], [StateId], [CityName]) VALUES (82, 3002, N'Nasirabad')
INSERT [dbo].[stateCity] ([CityId], [StateId], [CityName]) VALUES (91, 3003, N'Krachi')
INSERT [dbo].[stateCity] ([CityId], [StateId], [CityName]) VALUES (92, 3003, N'Mirpur khas')
GO
ALTER TABLE [dbo].[countryState]  WITH CHECK ADD FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([CountryId])
GO
ALTER TABLE [dbo].[stateCity]  WITH CHECK ADD FOREIGN KEY([StateId])
REFERENCES [dbo].[countryState] ([StateId])
GO
/****** Object:  StoredProcedure [dbo].[AddNewEmpDetails]    Script Date: 02-11-2023 13:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[AddNewEmpDetails]  
(  
   @Name varchar (50),  
   @City varchar (50),  
   @Address varchar (50)  
)  
as  
begin  
   Insert into Employee values(@Name,@City,@Address)  
End
GO
/****** Object:  StoredProcedure [dbo].[AddNewstdDetails]    Script Date: 02-11-2023 13:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[AddNewstdDetails]  
(  
   @Name varchar (100),  
   @Email varchar (100),  
   @RetypeEmail varchar (100),
   @Phone varchar(100),
   @Country varchar(100),
   @State varchar(100),
   @City varchar(100),
   @Gender varchar(100)


)  
as  
begin  
   Insert into Student values(@Name,@Email,@RetypeEmail,@Phone,@Country,@State,@City,@Gender)  
End
GO
/****** Object:  StoredProcedure [dbo].[DeleteEmpById]    Script Date: 02-11-2023 13:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[DeleteEmpById]  
(  
   @EmpId int  
)  
as   
begin  
   Delete from Employee where Id=@EmpId  
End
GO
/****** Object:  StoredProcedure [dbo].[DeletestdById]    Script Date: 02-11-2023 13:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[DeletestdById]  
(  
   @Id int  
)  
as   
begin  
   Delete from Student where Id=@Id  
End 
GO
/****** Object:  StoredProcedure [dbo].[GetEmployees]    Script Date: 02-11-2023 13:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[GetEmployees]  
as  
begin  
   select *from Employee  
End 
GO
/****** Object:  StoredProcedure [dbo].[Getstudentmvc]    Script Date: 02-11-2023 13:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Getstudentmvc]  
as  
begin  
   select *from Student  
End 
GO
/****** Object:  StoredProcedure [dbo].[sp_LoginDetails]    Script Date: 02-11-2023 13:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_LoginDetails]
(
    @UserName varchar(100),
    @Password varchar(100)
)
AS
BEGIN
        INSERT INTO LoginDetails
		(
		[UserName],[Password])
		values(@UserName,
		       @Password)
			   End
GO
/****** Object:  StoredProcedure [dbo].[SP_RegisterDetails]    Script Date: 02-11-2023 13:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_RegisterDetails]
(
    @UserName varchar(100),
    @Password varchar(100),
	@ConfirmPassword varchar(100)
)
AS
BEGIN
INSERT INTO RegisterDetails
		  (
			   [UserName],
			   [Password],
			   [ConfirmPassword]
		   )
		   values
		   (
				@UserName,
		        @Password,
				@ConfirmPassword
			)

INSERT INTO LoginDetails
		(
			[UserName],
			[Password]
		)
		values
		(
			  @UserName,
		       @Password
	    )

 End


GO
/****** Object:  StoredProcedure [dbo].[SP_ValidateLoginDetails]    Script Date: 02-11-2023 13:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_ValidateLoginDetails]
(
    @UserName varchar(100),
    @Password varchar(100)
)
AS
	BEGIN
        
		select * from LoginDetails WHERE UserName=@UserName AND [Password]=@Password

	End
GO
/****** Object:  StoredProcedure [dbo].[UpdateEmpDetails]    Script Date: 02-11-2023 13:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[UpdateEmpDetails]  
(  
   @EmpId int,  
   @Name varchar (50),  
   @City varchar (50),  
   @Address varchar (50)  
)  
as  
begin  
   Update Employee   
   set Name=@Name,  
   City=@City,  
   Address=@Address  
   where Id=@EmpId  
End 
GO
/****** Object:  StoredProcedure [dbo].[UpdatestdDetails]    Script Date: 02-11-2023 13:31:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[UpdatestdDetails]  
(  
   @Id int,  
   @Name varchar (100),  
   @Email varchar (100),  
   @RetypeEmail varchar (100),
   @Phone varchar(100),
   @Country varchar(100),
   @State varchar(100),
   @City varchar(100),
   @Gender varchar(100)
)  
as  
begin  
   Update Student   
   set Name=@Name,  
   Email=@Email,  
   RetypeEmail=@RetypeEmail,
   Phone=@Phone,
   Country=@Country,
   State=@State,
   City=@City,
   Gender=@Gender
   where Id=@Id  
End 
GO

