/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
if not exists (select 1 from dbo.RoomTypes)
begin
    insert into dbo.RoomTypes(Title, Description, Price)
    values('King Size Bed', 'A room with a king-size bed and tv', 100),
    ('Double Size Bed', 'A room with a double-size bed and tv', 80),
    ('Budget Double Size Bed', 'A room with only a double-sized bed', 60),
    ('Single Size Bed', 'A room with a single-size bed and tv', 60),
    ('Budget Single Size Bed', 'A room with only a single-sized bed', 40);
end

if not exists (select 1 from dbo.Rooms)
begin
    declare @roomId1 int;
    declare @roomId2 int;
    declare @roomId3 int;
    declare @roomId4 int;
    declare @roomId5 int;

    select @roomId1 = Id from dbo.RoomTypes where Title = 'Budget Single Size Bed';
    select @roomId2 = Id from dbo.RoomTypes where Title = 'Single Size Bed';
    select @roomId3 = Id from dbo.RoomTypes where Title = 'Budget Double Size Bed';
    select @roomId4 = Id from dbo.RoomTypes where Title = 'Double Size Bed';
    select @roomId5 = Id from dbo.RoomTypes where Title = 'King Size Bed';

    insert into dbo.Rooms(RoomNumber, RoomTypeId)
    values ('101', @roomId1),
    ('102', @roomId1),
    ('103', @roomId2),
    ('104', @roomId2),
    ('105', @roomId1),
    ('201', @roomId3),
    ('202', @roomId3),
    ('203', @roomId3),
    ('204', @roomId5),
    ('205', @roomId5),
    ('301', @roomId3),
    ('302', @roomId4),
    ('303', @roomId4),
    ('304', @roomId4),
    ('305', @roomId5)
end
