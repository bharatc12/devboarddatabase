CREATE TABLE BOARDS (
	BoardName varchar(255) NOT NULL,
	ProcessorSlots BOOLEAN[]
	ProcessorName varchar(255) NOT NULL,
	RAMVersion varchar(255) NOT NULL,
	StorageType varchar(255) NOT NULL,
	OperatingSystem varchar(255) NOT NULL,
	IOInterface varchar(255) NOT NULL,
	GraphicsProccessorName varchar(255),
	SystemOnChip varchar(255),
	WirelessVersion varchar(255),
	BoardType ENUM ('FPGA', 'ASIC','SBC'),
	SensorList varchar(255)[],
	FOREIGN KEY (ProcessorName) REFERENCES PROCESSORS(ProcessorName),
	FOREIGN KEY (RAMVersion) REFERENCES RAMINFORMATION(VersionName),
	FOREIGN KEY (OperatingSystem) REFERENCES OPERATINGSYSTEM(DeviceName),
	FOREIGN KEY (GraphicsProccessorName) REFERENCES GPUINFORMATION(ProductCode),
	FOREIGN KEY (WirelessVersion) REFERENCES WIRELESSINFORMATION(ChipID),
	PRIMARY KEY (BoardName)
);

CREATE TABLE PROCESSORS (
	ProcessorName varchar(255) NOT NULL,
	SecondaryProccessor varchar(255),
	ThirdProccessor varchar(255),
	Architecture varchar(50), 
	Clockspeed int,
	Cores int,
	RegisterLength int,
	ProcessorType int,
	AveragePower int,
	PRIMARY KEY (ProcessorName)
	
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
	ProductCode int,
	VideoMemory int,
	Clockspeed int,
);

CREATE TABLE IO-INTERFACE (
	DeviceName varchar(255) NOT NULL,
	ethernetversion varchar(255) NOT NULL,
	USBInformation varchar(255) NOT NULL,
	FOREIGN KEY (EthernetVersion) REFERENCES ETHERNETINFORMATION(EthernetVersion),
	FOREIGN KEY (USBInformation) REFERENCES USBINFORMATION(AssociatedDevice),
	PRIMARY KEY (DeviceName)
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
	USB-A boolean,
	USB-ACount int,
	USB-C boolean,
	USB-CCount int,
	USB-MicroB boolean,
	USB-MicroBCount int,
	PRIMARY KEY (AssociatedDevice)
);

CREATE TABLE OPERATINGSYSTEM (
	DeviceName varchar(255) NOT NULL,
	OSType  ENUM ('Windows', 'Linux','MacOS','Android')DEFAULT 'Linux',
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

