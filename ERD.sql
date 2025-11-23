-- 建立零件主表
CREATE TABLE Part (
    PartID SERIAL PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    CurrentVersion VARCHAR(20),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 建立零件版本歷史表
CREATE TABLE PartVersion (
    VersionID SERIAL PRIMARY KEY,
    PartID INT REFERENCES Part(PartID),
    VersionNumber VARCHAR(20) NOT NULL,
    ReleaseDate DATE,
    ChangeLog TEXT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 建立過時紀錄表
CREATE TABLE ObsolescenceRecord (
    RecordID SERIAL PRIMARY KEY,
    PartID INT REFERENCES Part(PartID),
    DeclaredObsoleteDate DATE,
    ReplacementPartID INT REFERENCES Part(PartID),
    Notes TEXT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 建立使用紀錄表
CREATE TABLE UsageRecord (
    UsageID SERIAL PRIMARY KEY,
    PartID INT REFERENCES Part(PartID),
    UsedDate DATE,
    Quantity INT,
    Location VARCHAR(100),
    UserID INT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 建立使用者表
CREATE TABLE User (
    UserID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Role VARCHAR(50),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
