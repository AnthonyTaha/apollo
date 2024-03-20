DROP TABLE IF EXISTS Batteries;
DROP TABLE IF EXISTS Clients;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Panels;
DROP TABLE IF EXISTS Jobs;
DROP TABLE IF EXISTS EmployeeOnJob;
PRAGMA FOREIGN_KEYS=ON;

CREATE TABLE Batteries(
	batteryCapacity REAL NOT NULL PRIMARY KEY,
	batteryPrince REAL NOT NULL
);
CREATE TABLE Clients (
	clientId INT NOT NULL PRIMARY KEY,
	clientName TEXT NOT NULL,
	clientSurname TEXT NOT NULL,
	clientBirthDate DATE NOT NULL,
	clientAddress TEXT NOT NULL,
	clientNumber INT NOT NULL,
	clientEmail TEXT NOT NULL
);
CREATE TABLE Employees (
	employeeId INT NOT NULL PRIMARY KEY,
	employeeName TEXT NOT NULL,
	employeeSurname TEXT NOT NULL,
	employeeBirthDate DATE NOT NULL,
	employeeNumber INT NOT NULL,
	employeeEmail TEXT NOT NULL
);
CREATE TABLE Panels(
	panelName TEXT NOT NULL PRIMARY KEY,
	panelCapacity REAL NOT NULL,
	panelLength REAL NOT NULL,
	panelWidth REAL NOT NULL,
	panelPrice REAL NOT NULL,
	FOREIGN KEY(panelCapacity) REFERENCES Batteries(batteryCapacity)
);
CREATE TABLE Jobs(
	jobId INT NOT NULL PRIMARY KEY,
	jobPanel TEXT NOT NULL,
	jobDate DATE NOT NULL,
	jobStatus TEXT NOT NULL,
	jobNotes TEXT NOT NULL,
	jobType TEXT NOT NULL,
	clientId INT NOT NULL,
	FOREIGN KEY(jobPanel) REFERENCES Panels(panelName),
	FOREIGN KEY(clientId) REFERENCES Clients(clientId)
);
CREATE TABLE EmployeeOnJob(
	employeeId INT NOT NULL,
	jobId INT NOT NULL,
	employeeRole TEXT NOT NULL,
	PRIMARY KEY (employeeId,  jobId)
	FOREIGN KEY (employeeId) REFERENCES Employees(employeeId),
	FOREIGN KEY (jobId) REFERENCES Jobs(jobId)
);	