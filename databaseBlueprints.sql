
CREATE TABLE PROCESSORS (
	ProcessorName varchar(255) NOT NULL,
	Architecture varchar(50), 
	Clockspeed int,
	Cores int,
	RegisterLength int,
	TransisitorWidth int,
	ProcessorType int,
	AveragePower int,
	PRIMARY KEY (ProcessorName)
	
);

CREATE TABLE PROCESSORNAMES (
	BoardName varchar(255) NOT NULL,
	ProcessorName varchar(255) NOT NULL,
	SecondaryProcessor varchar(255),
	ThirdProcessor varchar(255),
	FOREIGN KEY (ProcessorName) REFERENCES PROCESSORS(ProcessorName),
	FOREIGN KEY (SecondaryProcessor) REFERENCES PROCESSORS(ProcessorName),
	FOREIGN KEY (ThirdProcessor) REFERENCES PROCESSORS(ProcessorName),
	PRIMARY KEY (BoardName)
);



CREATE TABLE NEURALPROCESSORS (
	ChipID int,
	Speed int,
	RegisterSupport int[]
);

CREATE TABLE RAMINFORMATION (
	VersionName varchar(255) NOT NULL,
	Version int,
	VRAM int,
	Capacity int NOT NULL,
	Clockspeed int NOT NULL,
	ChannelCount int NOT NULL,
	PRIMARY KEY (VersionName)
);

CREATE TABLE GPUINFORMATION(
	GPUName varchar(255),
	VideoMemory int,
	Clockspeed int,
	TransisitorWidth int,
	PRIMARY KEY(GPUName)
);
CREATE TABLE ETHERNETINFORMATION (
	EthernetVersion varchar(255) NOT NULL,
	Speed int,
	Quantity int,
	RDMA boolean,
	PRIMARY KEY (EthernetVersion)
	);

CREATE TABLE USBINFORMATION(
	AssociatedDevice varchar(255) NOT NULL,
	USBA boolean,
	USBACount int,
	USBC boolean,
	USBCCount int,
	USBMicroB boolean,
	USBMicroBCount int,
	PRIMARY KEY (AssociatedDevice)
);

CREATE TABLE IOINTERFACE (
	BoardName varchar(255) NOT NULL,
	ethernetversion varchar(255) NOT NULL,
	USBInformation varchar(255) NOT NULL,
	FOREIGN KEY (EthernetVersion) REFERENCES ETHERNETINFORMATION(EthernetVersion),
	FOREIGN KEY (USBInformation) REFERENCES USBINFORMATION(AssociatedDevice),
	PRIMARY KEY (BoardName)
);


CREATE TABLE OPERATINGSYSTEM (
	DeviceName varchar(255) NOT NULL,
	OSType  os,
	Version int,
	PRIMARY KEY (DeviceName)
	
);

CREATE TABLE STORAGEINFORMATION (
	ModelName varchar(255),
	Capacity int,
	Speed int,
	PRIMARY KEY(ModelName)
);

CREATE TABLE WIRELESSINFORMATION (
	ChipID varchar(50),
	Wifi int,
	Bluetooth int,
	PRIMARY KEY (ChipID)
);

CREATE TABLE BOARDS (
	BoardName varchar(255) NOT NULL,
	RAMVersion varchar(255) NOT NULL,
	StorageType varchar(255) NOT NULL,
	OperatingSystem varchar(255) NOT NULL,
	IOInterface varchar(255) NOT NULL,
	NeuralProcessorID int,
	GraphicsProccessorName varchar(255),
	SystemOnChip varchar(255),
	WirelessVersion varchar(255),
	BoardType type,
	SensorList varchar(255)[],
	FOREIGN KEY (BoardName) REFERENCES PROCESSORNAMES(BoardName),
	FOREIGN KEY (BoardName) REFERENCES IOINTERFACE(BoardName),
	FOREIGN KEY (RAMVersion) REFERENCES RAMINFORMATION(VersionName),
	FOREIGN KEY (StorageType) REFERENCES STORAGEINFORMATION(ModelName),
	FOREIGN KEY (OperatingSystem) REFERENCES OPERATINGSYSTEM(DeviceName),
	FOREIGN KEY (GraphicsProccessorName) REFERENCES GPUINFORMATION(GPUName),
	FOREIGN KEY (WirelessVersion) REFERENCES WIRELESSINFORMATION(ChipID),
	PRIMARY KEY (BoardName)
);
